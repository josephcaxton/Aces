//
//  NewsDetails.m
//  Aces
//
//  Created by Joseph caxton-Idowu on 27/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import "NewsDetails.h"

@interface NewsDetails ()

@end

@implementation NewsDetails

@synthesize URL,Act;


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    UIWebView *WebBox  = [[UIWebView alloc ] initWithFrame:CGRectMake(0, 0, 320, 400)];
    [WebBox	setBackgroundColor:[UIColor clearColor]];
    [WebBox setOpaque:NO];
    WebBox.dataDetectorTypes = 0; // This will remove the underlines i am experiencing
    WebBox.userInteractionEnabled = YES;  // This allow the cell to  
    WebBox.scalesPageToFit = YES;
   
    NSURL *aURL = [NSURL URLWithString:URL];
    NSURLRequest *aRequest = [NSURLRequest requestWithURL:aURL];
    
    WebBox.delegate= self;
    
    [WebBox loadRequest:aRequest];
    
    [self.view addSubview:WebBox];
   
    UIButton *btnExit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnExit.frame = CGRectMake(240, 420, 80, 38);
    [btnExit setTitle:@"Exit" forState:UIControlStateNormal];
    [btnExit addTarget:self action:@selector(dismissView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnExit];	
    
    
    Act  = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(160,220,20,20)];
    
    Act.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    Act.hidesWhenStopped = YES;
    
    [Act startAnimating];
    
    [self.view addSubview:Act];
    

   
}



- (IBAction)dismissView:(id)sender {
    
    [self dismissModalViewControllerAnimated:YES];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [Act stopAnimating];
    [Act setHidden:YES];
   
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
