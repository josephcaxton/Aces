//
//  MultipleChoiceSingleAnswer.m
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 28/09/2010.
//  Copyright 2010 caxtonidowu. All rights reserved.
//

#import "MultipleChoiceSingleAnswer.h"


@implementation MultipleChoiceSingleAnswer


#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 450

- (void)viewDidLoad {
    [super viewDidLoad];
	
    UIButton *btnExit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnExit.frame = CGRectMake(10, 400, 80, 38);
    [btnExit setTitle:@"Exit" forState:UIControlStateNormal];
    [btnExit addTarget:self action:@selector(dismissView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnExit];	
    
    UIButton *btnNext = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnNext.frame = CGRectMake(230, 400, 80, 38);
    [btnNext setTitle:@"Next" forState:UIControlStateNormal];
    [btnNext addTarget:self action:@selector(NextQuestion:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnNext];	

    //[self.view setBackgroundColor:[UIColor blueColor]]; 
    
}

-(void)viewWillAppear:(BOOL)animated{
	
	
    
	
}

- (IBAction)dismissView:(id)sender {
    
    [self dismissModalViewControllerAnimated:YES];
}


- (IBAction)NextQuestion:(id)sender {
    
   
}





#pragma mark -
#pragma mark Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
			
		return 2;
		
	
	
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(section == 0){
        return 1;
    }
    else
    {
    return 7;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
    if (indexPath.section == 0){
        
        return 200.0;
    }
    else{
        
        return 40.0;
    }
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[WebViewInCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    if(indexPath.section == 0){
        
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QuestionBackground"]]; 
        UILabel *Questionlabel = [[UILabel alloc ]initWithFrame:CGRectMake(40,30,250,150)];
        Questionlabel.textAlignment = UITextAlignmentLeft;
        Questionlabel.textColor = [UIColor blackColor];
        Questionlabel.backgroundColor = [UIColor clearColor];
        Questionlabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(14.0)];
        Questionlabel.text = @"Who am I?";
        [Questionlabel sizeToFit];
        [cell addSubview:Questionlabel];
    }
    
    else if (indexPath.section == 1 && indexPath.row < 4){
	
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bigcell.png"]];
     cell.textLabel.backgroundColor = [UIColor clearColor];
     cell.textLabel.text = @"Possible answers here";		
    
    }
    
    else{
        
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bluebackgroundcell.png"]];
        
    }
    return cell;
		
		

	
	
	
	
}

- (void)configureCell:(WebViewInCell *)mycell HTMLStr:(NSString *)value; {
    
    mycell.HTMLText =value;
	
}



#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     
	


}

 

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	//NSLog(@"Memory warning from Joseph %i", [QuestionHeaderBox retainCount]);
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    


}


- (void)dealloc {
	


	
	
}


@end

