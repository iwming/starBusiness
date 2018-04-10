//
//  FatherView.m
//  Transline
//
//  Created by Mi on 2018/3/29.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import "FatherView.h"

@implementation FatherView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UITapGestureRecognizer *tagGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchGes)];
    [self addGestureRecognizer:tagGesture];
    return self;
}

- (void)touchGes
{
    NSLog(@"%s",__FUNCTION__);
}

@end
