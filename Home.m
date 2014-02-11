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
    
     NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIColor whiteColor],NSBackgroundColorAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:57.0/255.0 green:67.0/255.0 blue:99.0/255.0 alpha:1]];
   
    
    
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
		
		numberOfRows = 6;
    }
    
    return numberOfRows;

        
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
    if (indexPath.section == 0){
        
         return 42.0;
    }
    else if (indexPath.row == 5){
        return 120;
    }
    
    return 60.0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   static NSString *CellIdentifier = @"Cell"; 
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0){
        cell.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:67.0/255.0 blue:99.0/255.0 alpha:0.8];
        cell.textLabel.textColor = [UIColor whiteColor];
        UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
        cell.textLabel.text = @"Aces Project";
        
        cell.textLabel.font = font;
        
    }
    else if (indexPath.row == 5){
        
         cell.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:67.0/255.0 blue:99.0/255.0 alpha:1.0];
    }
    else  {
        
        
        //cell.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"cellback.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
        cell.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:67.0/255.0 blue:99.0/255.0 alpha:0.5];

        NSString *ImageName = [[NSString alloc] initWithFormat:@"%@",[ImageNames objectAtIndex:indexPath.row]];
        UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        UIImage* theImage = [UIImage imageNamed:ImageName];
        imgview.image = theImage;
        cell.imageView.image = theImage;
        
        
        NSString *Title = [[NSString alloc] initWithFormat:@"%@",[TitleLists objectAtIndex:indexPath.row]];
        UILabel *mylabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 202, 40)];
        mylabel.text = Title;
        UIFont *Firstfont = [UIFont fontWithName:@"Helvetica" size:14.0];
        [mylabel setFont:Firstfont];
        //mylabel.font = Firstfont;
        //cell.textLabel.text = Title;
        //cell.textLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:mylabel];
                           
        NSString *SubTitle = [[NSString alloc] initWithFormat:@"%@",[SubTitleLists objectAtIndex:indexPath.row]];
        UILabel *detaillabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, 202, 40)];
        detaillabel.text = SubTitle;
        UIFont *Secondfont = [UIFont fontWithName:@"Helvetica" size:10.0];
        [detaillabel setFont:Secondfont];

        //cell.detailTextLabel.text = SubTitle;
        //cell.detailTextLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:detaillabel];
        
        NSString *arrowName = @"whiteArrow.png";
        UIImageView* arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
         UIImage* arrowImage = [UIImage imageNamed:arrowName];
        arrowView.image  = arrowImage;
        
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
