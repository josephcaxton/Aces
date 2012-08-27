//
//  Help.h
//  Aces
//
//  Created by Joseph caxton-Idowu on 10/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsFeed :  UITableViewController{
    
    NSMutableArray *ArrayofConfigObjects;
    
    
}

@property (nonatomic, retain) NSMutableArray *ArrayofConfigObjects;
-(BOOL)ShouldIDownloadOrNot:(NSString*)urllPath:(NSString*)LocalFileLocation;
-(void)GetConfigFileFromServeWriteToPath:(NSString*)Path;
-(void)Alertfailedconnection;
-(void)MyParser:(NSString *)FileLocation;
- (void)AddProgress;

@end
