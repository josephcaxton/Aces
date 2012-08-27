//
//  NewsDetails.h
//  Aces
//
//  Created by Joseph caxton-Idowu on 27/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NewsDetails : UIViewController <UIWebViewDelegate>{
    
    NSString *URL;
    UIActivityIndicatorView *Act;
    
}
@property (nonatomic, retain)  NSString *URL;
@property (nonatomic, retain)   UIActivityIndicatorView *Act;
@end
