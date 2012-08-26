//
//  Africa.m
//  Aces
//
//  Created by Joseph caxton-Idowu on 25/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import "Africa.h"
#import "PdfReader.h"



@implementation Africa

@synthesize ImageNames,TitleLists,SubTitleLists;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINavigationController *nav =self.navigationController;
    nav.navigationBar.tintColor = [UIColor blackColor];

    self.navigationItem.title = @"Africa";
    
    ImageNames = [[NSMutableArray alloc] init];
    TitleLists = [[NSMutableArray alloc] init];
    SubTitleLists = [[NSMutableArray alloc] init];
    
    
    // Note Image Name and DocumentName must be the same.
    
    [ImageNames addObject:@"Africa_Creativity.png"];
    [TitleLists addObject:@"Cultural Heritage"];
    [SubTitleLists addObject:@"Creativity and Education for all in Africa"];
    
    [ImageNames addObject:@"Africa_The_Roots.png"];
    [TitleLists addObject:@"Going to Our Roots"];
    [SubTitleLists addObject:@"Visit the history"];
    
    [ImageNames addObject:@"Africa_Primary.png"];
    [TitleLists addObject:@"Primary Education"];
    [SubTitleLists addObject:@"How they do it"];
    
    [ImageNames addObject:@"Africa_Culture.png"];
    [TitleLists addObject:@"The Culture"];
    [SubTitleLists addObject:@"Checking the culture"];
    
    [ImageNames addObject:@"Africa_opposite.png"];
    [TitleLists addObject:@"The Opposites"];
    [SubTitleLists addObject:@"Let's help"];


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
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

#pragma mark - Table view data source

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    NSString *Title = [[NSString alloc] initWithFormat:@"%@",[TitleLists objectAtIndex:indexPath.row]];
    NSString *DocumentName = [[NSString alloc] initWithFormat:@"%@",[ImageNames objectAtIndex:indexPath.row]];
    
    PdfReader *Reader = [[PdfReader alloc] initWithNibName:nil bundle:nil];
    Reader.TopicName = Title;
    Reader.DocumentName = [DocumentName stringByDeletingPathExtension];
    [self.navigationController pushViewController:Reader animated:YES];



}

@end
