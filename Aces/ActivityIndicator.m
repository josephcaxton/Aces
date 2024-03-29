//
//  ActivityIndicator.m
//  Evaluator
//
//  Created by Joseph caxton-Idowu on 15/04/2011.
//  Copyright 2011 caxtonidowu. All rights reserved.
//

#import "ActivityIndicator.h"


@implementation ActivityIndicator


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
		//UIActivityIndicatorView *Activity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(round((self.frame.size.width - 25) / 2),round((self.frame.size.height - 25) / 2),20,20)];
		UIActivityIndicatorView *Activity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(160,220,20,20)];
		Activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
		
		UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(150,200,100,20)];
		[lbl setText:@"loading....."];														 
		lbl.backgroundColor = [UIColor clearColor];
		
		
		[Activity startAnimating];
		[self addSubview:Activity];
		[self addSubview:lbl];
		
		//[Activity release];
		//[lbl release];
											 
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
   
}


@end
