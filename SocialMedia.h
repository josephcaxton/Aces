//
//  SocialMedia.h
//  Aces
//
//  Created by Joseph caxton-Idowu on 26/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import "AppDelegate.h"
#import "YouTubeList.h"

@interface SocialMedia : UITableViewController{
    
    NSMutableArray *ImageNames;
    NSMutableArray *TitleLists;
     UIActivityIndicatorView * activityIndicator;
}
@property (nonatomic, retain) NSMutableArray *ImageNames;
@property (nonatomic, retain) NSMutableArray *TitleLists;
@property (nonatomic, retain)  UIActivityIndicatorView * activityIndicator;

@end
