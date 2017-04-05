//
//  ActivityIndicatorButton.h
//  Garden
//
//  Created by 武探 on 15/3/20.
//  Copyright (c) 2015年 wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityIndicatorButton : UIButton

@property(nonatomic,strong) UIActivityIndicatorView *activityIndicatorView;
@property(nonatomic,assign) BOOL autoAnimationByEnabled;
@property(nonatomic,retain,readonly) NSString *title;
@property(nonatomic,assign) unsigned int radius;
@property(nonatomic,assign) BOOL customerActivityFrame;

-(void)startAnimating;
-(void)stopAnimating;

@end
