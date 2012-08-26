//
//  Home.h
//  Aces
//
//  Created by Joseph caxton-Idowu on 10/08/2012.
//  Copyright (c) 2012 caxtonidowu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UITableViewController{
    
     NSMutableArray *ImageNames;
     NSMutableArray *TitleLists;
     NSMutableArray *SubTitleLists;
}
@property (nonatomic, retain) NSMutableArray *ImageNames;
@property (nonatomic, retain) NSMutableArray *TitleLists;
@property (nonatomic, retain) NSMutableArray *SubTitleLists;
@end
