//
//  YouTubeList.m
//  Aces
//
//  Created by Joseph caxton-Idowu on 26/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import "YouTubeList.h"


@interface YouTubeList ()

@end

@implementation YouTubeList


- (void)viewDidLoad
{
    [super viewDidLoad];
    
      
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
   
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
    
    
    return 140.0;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell"; 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    // HTML to embed YouTube video
    NSString *youTubeVideoHTML = @"<html><head>\
    <body style=\"margin:0\">\
    <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
    width=\"%0.0f\" height=\"%0.0f\"></embed>\
    </body></html>";
    
    NSString *html = [NSString stringWithFormat:youTubeVideoHTML, @"http://www.youtube.com/watch?v=vZNh5Uw8mDw&list=UUytu2J8l5uhlygW92DWReig&index=2&feature=plcp" , 120.00, 120.00];
    
    UIWebView *youtube = [[UIWebView alloc]initWithFrame:CGRectMake(10, 10, 120, 120)];
    
    [youtube loadHTMLString:html baseURL:nil];
    [cell addSubview:youtube];
    
    // Add a label
    UILabel *Title = [[UILabel alloc] initWithFrame:CGRectMake(140, 40, 180, 40)];
    Title.text =  @"Name of this video";
    [cell addSubview:Title];
    
    // Don't know why this won't work
    /*YoutubePlayer *youTube = [[YoutubePlayer alloc] 
                              initWithStringAsURL:@"http://youtu.be/sYRTOTeD1rM" 
                              frame:CGRectMake(0, 0, 120.00, 120.00)];
    
    
    [self.view addSubview:youTube];*/
    
    
    
    return cell;
    
    
}





@end
