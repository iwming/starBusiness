//
//  CusView.m
//  Transline
//
//  Created by Mi on 2018/2/22.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import "CusView.h"

static CusView *_instance;
@implementation CusView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%s",__FUNCTION__);
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%s",__FUNCTION__);
    return [super pointInside:point withEvent:event];
}

//单例写法 
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    NSLog(@"---%s",__FUNCTION__);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(_instance){
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;

}

+ (instancetype) sharedInstance
{
    NSLog(@"---%s",__FUNCTION__);
    return [[self alloc] init];
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}



@end
