//
//  Share.m
//  Aces
//
//  Created by Joseph caxton-Idowu on 10/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import "YoutubePlayer.h"



@implementation YoutubePlayer

- (YoutubePlayer *)initWithStringAsURL:(NSString *)urlString frame:(CGRect)frame
{
    if (self = [super init]) 
    {
        
        // HTML to embed YouTube video
        NSString *youTubeVideoHTML = @"<html><head>\
        <body style=\"margin:0\">\
        <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
        width=\"%0.0f\" height=\"%0.0f\"></embed>\
        </body></html>";
        
        NSString *html = [NSString stringWithFormat:youTubeVideoHTML, urlString, frame.size.width, frame.size.height];
        
        //NSLog(@"%@",html);
        //self.backgroundColor = [UIColor blueColor];
        // Create webview with requested frame size
        /* if(Video == nil) {  
            Video = [[UIWebView alloc] initWithFrame:frame];  
           [self addSubview:Video];  
            
        }*/

       // Load the html into the webview
        [self loadHTMLString:html baseURL:nil];
    }
    return self;  
}

@end
