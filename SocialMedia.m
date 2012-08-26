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

@synthesize ImageNames,TitleLists;


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
    
    if (indexPath.section == 1) {
        
		
        
        switch (index) {
                
            case 0:{
                
                //Africa *Afri = [[Africa	alloc] initWithNibName:nil bundle:nil];
                //[self.navigationController pushViewController:Afri animated:YES];
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




@end
