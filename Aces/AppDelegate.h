//
//  AppDelegate.h
//  Aces
//
//  Created by Joseph caxton-Idowu on 10/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : NSObject <UIApplicationDelegate>{
    
    UIWindow *window;
    UITabBarController *tabBarController;
    NSThread *SecondThread;
    NSString *NewsServerURL;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) NSThread *SecondThread;
@property (nonatomic, retain) NSString *NewsServerURL;

- (NSString *)applicationDocumentsDirectory;
-(BOOL)isDeviceConnectedToInternet;
- (BOOL)downloadFileIfUpdated:(NSString*)urlString
                            :(NSString*)LocalFileLocation;
@end
