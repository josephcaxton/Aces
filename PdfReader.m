//
//  PdfReader.m
//  Aces
//
//  Created by Joseph caxton-Idowu on 25/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import "PdfReader.h"
#import "MultipleChoiceSingleAnswer.h"



@implementation PdfReader

@synthesize WebBox,TopicName,DocumentName;

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 450


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *TakeTest = [[UIBarButtonItem alloc] initWithTitle:@"Take Test" style:UIBarButtonItemStylePlain target:self action:@selector(StartTest:)];
	
    self.navigationItem.rightBarButtonItem = TakeTest;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
    self.navigationItem.title = TopicName;
    self.WebBox = [[UIWebView alloc ] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.WebBox.scalesPageToFit = YES;
	self.WebBox.delegate = self;
    
    [self loadDocument:DocumentName inView:self.WebBox];
	[self.view addSubview:WebBox];
}

-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView{
	
    NSString *path = [[NSBundle mainBundle] pathForResource:documentName ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
	
	
}


-(IBAction)StartTest:(id)sender{
	
		
	MultipleChoiceSingleAnswer *Multi = [[MultipleChoiceSingleAnswer alloc] init];
    
	[self.navigationController presentModalViewController:Multi animated:YES];
	
	
	
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
