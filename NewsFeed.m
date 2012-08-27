//
//  Help.m
//  Aces
//
//  Created by Joseph caxton-Idowu on 10/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import "NewsFeed.h"
#import "AppDelegate.h"
#import "ConfigObject.h"
#import "NewsDetails.h"


@implementation NewsFeed

@synthesize ArrayofConfigObjects;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINavigationController *nav =self.navigationController;
    nav.navigationBar.tintColor = [UIColor blackColor];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    appDelegate.SecondThread = [[NSThread alloc]initWithTarget:self selector:@selector(AddProgress) object:nil];
    [appDelegate.SecondThread start];
    
    NSString *ServerUrl = appDelegate.NewsServerURL;
    
    NSString *Dir = [appDelegate.applicationDocumentsDirectory stringByAppendingPathComponent:@"NewsFeed.xml"];
    
    
    if(appDelegate.isDeviceConnectedToInternet){
        
        BOOL DownloadIt =  [self ShouldIDownloadOrNot:ServerUrl :Dir];
        
        if(DownloadIt == YES){
            
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSError *error=[[NSError alloc]init];
            
            BOOL success=[fileManager fileExistsAtPath:Dir];
            
            if(success)
        	{
        		[fileManager removeItemAtPath:Dir error:&error];
            }
            
            
            [self GetConfigFileFromServeWriteToPath:Dir];
            
        }
        
        
        
        ArrayofConfigObjects = [[NSMutableArray alloc] init];
        
        
        
    }
    else
    {
        
        [self Alertfailedconnection];
        
    }
	
    [(UIActivityIndicatorView *)[self navigationItem].rightBarButtonItem.customView stopAnimating];
    
    [appDelegate.SecondThread cancel];
    
}


-(BOOL)ShouldIDownloadOrNot:(NSString*)urllPath:(NSString*)LocalFileLocation{
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    BOOL ReturnVal =  [appDelegate downloadFileIfUpdated:urllPath:LocalFileLocation];
    
    return ReturnVal;
    
    
    
    
}

-(void)GetConfigFileFromServeWriteToPath:(NSString*)Path{
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSString *ServerUrl = appDelegate.NewsServerURL;
   
	NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:ServerUrl]];
    NSURLResponse *resp = nil; 
    NSError *err = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest: theRequest returningResponse: &resp error: &err];
    
    if (response) {
        
        NSError* error;
        
        [response writeToFile:Path options:NSDataWritingAtomic error:&error];
        
        if(error != nil)
            NSLog(@"write error %@", error);
    }
    
    
    
    
}

-(void)Alertfailedconnection{
    
    NSString *message = [[NSString alloc] initWithFormat:@"Your device is not connected to the internet. You need access to the internet to stream our videos "];
    
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"Important Notice"
                                                   message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
    
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSString *Dir = [appDelegate.applicationDocumentsDirectory stringByAppendingPathComponent:@"NewsFeed.xml"]; 
    [self MyParser:Dir];
    
    
} 
        
        
        
-(void)MyParser:(NSString *)FileLocation{
            
            NSError* error;
            
            NSString* fileContents = [NSString stringWithContentsOfFile:FileLocation encoding:NSWindowsCP1252StringEncoding error:&error];
            
            
            NSArray* pointStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"±"]];
            
            for(int idx = 0; idx < pointStrings.count - 1; idx++)
            {
                // break the string down even further to the columns
                NSString* currentPointString = [pointStrings objectAtIndex:idx];
                NSArray* arr = [currentPointString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"|"]];
                
                NSString *Title = [[NSString alloc] initWithFormat:@"%@",[arr objectAtIndex:1]];
                NSString *url = [[NSString alloc] initWithFormat:@"%@", [arr objectAtIndex:3]];
                
                ConfigObject *obj = [[ConfigObject alloc] init];
                obj.Title = Title;
                obj.URL = url;
                                
                [ArrayofConfigObjects addObject:obj];
				
                
                
            }
        }
        

        


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    NSInteger numberOfRows =[ArrayofConfigObjects count];
	
    return numberOfRows;

    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
    
    
    return 40.0;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell"; 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
     ConfigObject *obj = [ArrayofConfigObjects objectAtIndex:indexPath.row];
    
    
      cell.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"cellback.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
    
   
        UIImageView* arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteArrow.png"]];
        cell.accessoryView = arrowView;
        
        cell.textLabel.text = [obj Title];
         cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];

    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   ConfigObject *obj = [ArrayofConfigObjects objectAtIndex:indexPath.row];
    
    NewsDetails *ND = [[ NewsDetails alloc] init];
    ND.URL = [obj URL];
    
	[self.navigationController presentModalViewController:ND animated:YES];
        
}





- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)AddProgress{
	
        
        
        UIActivityIndicatorView * activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [activityIndicator stopAnimating];
        [activityIndicator hidesWhenStopped];
        UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
        [self navigationItem].rightBarButtonItem = barButton;
        
        [(UIActivityIndicatorView *)[self navigationItem].rightBarButtonItem.customView startAnimating];
        

	
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
