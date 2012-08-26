//
//  SocialMedia.m
//  Aces
//
//  Created by Joseph caxton-Idowu on 26/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import "SocialMedia.h"


@interface SocialMedia ()

@end

@implementation SocialMedia

@synthesize ImageNames,TitleLists,activityIndicator;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UINavigationController *nav =self.navigationController;
    nav.navigationBar.tintColor = [UIColor blackColor];
    
    self.navigationItem.title = @"Social Media";
    
    ImageNames = [[NSMutableArray alloc] init];
    TitleLists = [[NSMutableArray alloc] init];
    
    [ImageNames addObject:@"Youtube.png"];
    [TitleLists addObject:@"YouTube"];
    
    
    [ImageNames addObject:@"Twitter.png"];
    [TitleLists addObject:@"Twitter"];
    
    
    [ImageNames addObject:@"Facebook.png"];
    [TitleLists addObject:@"Facebook"];
    
    
    [ImageNames addObject:@"TwitterFollow.png"];
    [TitleLists addObject:@"Follow us on Twitter"];
   
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        
    return 3;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
    
        
        return 80.0;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell"; 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
        
        //cell.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"cellback.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
        
        NSString *ImageName = [[NSString alloc] initWithFormat:@"%@",[ImageNames objectAtIndex:indexPath.row]];
        
        UIImage* theImage = [UIImage imageNamed:ImageName];
        cell.imageView.image = theImage;
        
        
        NSString *Title = [[NSString alloc] initWithFormat:@"%@",[TitleLists objectAtIndex:indexPath.row]];
        cell.textLabel.text = Title;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        
      
    if(indexPath.row == 0){
        
        UIImageView* arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteArrow.png"]];
        cell.accessoryView = arrowView;
        
    }
        

    
    
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int index = indexPath.row;
    
           
        switch (index) {
                
            case 0:{
                
                YouTubeList *youtube = [[YouTubeList alloc] initWithNibName:nil bundle:nil];
                [self.navigationController pushViewController:youtube animated:YES];
            }
                break;
                
            case 1:{
                
                 [self Twit];
                
                
            }
                break;
                
            case 2:{
                
                
                
            }
                break;
            case 3:{
                
            }
                break;
            case 4:{
                
            }
                break;
        }
        
    }
    



-(void)Twit {
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.SecondThread = [[NSThread alloc]initWithTarget:self selector:@selector(AddProgress) object:nil];
    [appDelegate.SecondThread start];
    
    if ([TWTweetComposeViewController canSendTweet])
    {
        NSString *UrlString = @"http://itunes.apple.com/us/app/gcse-physics-questions./id551944206?ls=1&mt=8";
        
        TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
        [tweetSheet setInitialText:@"This app is teaching me about my culture, check it out"];
        [tweetSheet addImage:[UIImage imageNamed:@"Icon.png"]];
        [tweetSheet addURL:[NSURL URLWithString:UrlString]];
        
        
        
        
        tweetSheet.completionHandler = ^(TWTweetComposeViewControllerResult result) {
           
            switch (result) {
                case TWTweetComposeViewControllerResultCancelled:                    
                    break;
                    
                case TWTweetComposeViewControllerResultDone:
                    
                    // Report to  analytics
                    /*if (![[GANTracker sharedTracker] trackEvent:@"Shared via twitter"
                                                         action:@"twitter shared"
                                                          label:@"twitter shared"
                                                          value:1
                                                      withError:&error]) {
                        NSLog(@"error in trackEvent");
                    }
                    */
                    
                                       
                    break;
                    
                default:
                    break;
            }
            [self dismissModalViewControllerAnimated:YES];
        };
        
        
        [activityIndicator stopAnimating];
	    [self presentModalViewController:tweetSheet animated:YES];
         
    }
    else
    {
        [activityIndicator stopAnimating];
        UIAlertView *alertView = [[UIAlertView alloc] 
                                  initWithTitle:@"Sorry"                                                             
                                  message:@"You can't send a tweet right now, make sure  your device has an internet connection and you have at least one Twitter account setup"                                                          
                                  delegate:self                                              
                                  cancelButtonTitle:@"OK"                                                   
                                  otherButtonTitles:nil];
        [alertView show];
        
    }
    
}

- (void)AddProgress{
	
    @autoreleasepool {
        
        
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [activityIndicator stopAnimating];
        [activityIndicator hidesWhenStopped];
        activityIndicator.center = CGPointMake(250, 125);
        
        [self.view addSubview:activityIndicator];
        [activityIndicator startAnimating];
                
    }
	
}





@end
