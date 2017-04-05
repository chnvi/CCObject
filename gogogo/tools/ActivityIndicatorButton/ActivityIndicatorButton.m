//
//  ActivityIndicatorButton.m
//  Garden
//
//  Created by 武探 on 15/3/20.
//  Copyright (c) 2015年 wu. All rights reserved.
//

#import "ActivityIndicatorButton.h"

@implementation ActivityIndicatorButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self initializeComponent];
    }
    return self;
}

-(void)awakeFromNib
{
//    [super awakeFromNib];
    [self initializeComponent];
}

-(void)initializeComponent
{
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [self addSubview:_activityIndicatorView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    if(!_customerActivityFrame)
    {
        _activityIndicatorView.frame = CGRectMake(CGRectGetWidth(self.frame)/2-CGRectGetWidth(_activityIndicatorView.frame)/2, CGRectGetHeight(self.frame)/2-CGRectGetHeight(_activityIndicatorView.frame)/2, CGRectGetWidth(_activityIndicatorView.frame), CGRectGetHeight(_activityIndicatorView.frame));
    }
    _activityIndicatorView.hidesWhenStopped = YES;
}

-(void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    if(_autoAnimationByEnabled)
    {
        if(enabled)
        {
            [self stopAnimating];
        }
        else
        {
            [self startAnimating];
        }
    }
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    if(!_activityIndicatorView.isAnimating)
    {
        _title = title;
    }
    [super setTitle:title forState:state];
}

-(void)setRadius:(unsigned int)radius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

-(void)startAnimating
{
    [_activityIndicatorView startAnimating];
    [self setTitle:@"" forState:UIControlStateNormal];
}

-(void)stopAnimating
{
    [_activityIndicatorView stopAnimating];
    [self setTitle:_title forState:UIControlStateNormal];
}

@end
