//
//  PdfReader.h
//  Aces
//
//  Created by Joseph caxton-Idowu on 25/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PdfReader : UIViewController<UIWebViewDelegate>{
    
    UIWebView *WebBox;
    NSString *TopicName;
    NSString *DocumentName;
}
@property (nonatomic, retain) UIWebView *WebBox;
@property (nonatomic, retain) NSString *TopicName;
@property (nonatomic, retain) NSString *DocumentName;
-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView;

@end
