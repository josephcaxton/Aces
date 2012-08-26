//
//  Home.m
//  Aces
//
//  Created by Joseph caxton-Idowu on 10/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import "Home.h"
#import "Africa.h"

@interface Home ()

@end

@implementation Home

@synthesize ImageNames,TitleLists,SubTitleLists;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINavigationController *nav =self.navigationController;
    nav.navigationBar.tintColor = [UIColor blackColor];
    
    self.navigationItem.title = @"Resources";

    ImageNames = [[NSMutableArray alloc] init];
    TitleLists = [[NSMutableArray alloc] init];
    SubTitleLists = [[NSMutableArray alloc] init];
    
    [ImageNames addObject:@"AfricaImage.png"];
    [TitleLists addObject:@"Africa"];
    [SubTitleLists addObject:@"African Culture and Traditions"];
    
    [ImageNames addObject:@"CaribbeanImage.png"];
    [TitleLists addObject:@"Caribbean"];
    [SubTitleLists addObject:@"Caribbean Culture and Traditions"];
    
    [ImageNames addObject:@"BritainImage.png"];
    [TitleLists addObject:@"Britain"];
    [SubTitleLists addObject:@"British Culture and Traditions"];
    
    [ImageNames addObject:@"USAImage.png"];
    [TitleLists addObject:@"USA"];
    [SubTitleLists addObject:@"American Culture and Traditions"];
    
    [ImageNames addObject:@"WorldWideImage.png"];
    [TitleLists addObject:@"World Wide"];
    [SubTitleLists addObject:@"Other Cultures and Traditions"];

    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
     return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSInteger numberOfRows = 0;
	
	if (section == 0)
		numberOfRows = 1;
    
    else {
		
		numberOfRows = 5;
    }
    
    return numberOfRows;

        
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
    if (indexPath.section == 0){
        
         return 52.0;
    }
    else{
        
    return 80.0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   static NSString *CellIdentifier = @"Cell"; 
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0){
        
       cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo.png"]];
        
    }
    else {
        
        
        cell.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"cellback.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
        
        NSString *ImageName = [[NSString alloc] initWithFormat:@"%@",[ImageNames objectAtIndex:indexPath.row]];
        
        UIImage* theImage = [UIImage imageNamed:ImageName];
        cell.imageView.image = theImage;
        
        
        NSString *Title = [[NSString alloc] initWithFormat:@"%@",[TitleLists objectAtIndex:indexPath.row]];
        cell.textLabel.text = Title;
        cell.textLabel.backgroundColor = [UIColor clearColor];
                           
        NSString *SubTitle = [[NSString alloc] initWithFormat:@"%@",[SubTitleLists objectAtIndex:indexPath.row]];
        cell.detailTextLabel.text = SubTitle;
        cell.detailTextLabel.backgroundColor = [UIColor clearColor];
        
        UIImageView* arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteArrow.png"]];
        cell.accessoryView = arrowView;

    }

    
    
     return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int index = indexPath.row;
    
    if (indexPath.section == 1) {
        
		
        
        switch (index) {
                
            case 0:{
                
               Africa *Afri = [[Africa	alloc] initWithNibName:nil bundle:nil];
              [self.navigationController pushViewController:Afri animated:YES];
                }
                break;
            
            case 1:{
            
               

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
    
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
