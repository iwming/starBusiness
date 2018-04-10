//
//  TestClass.m
//  Transline
//
//  Created by Mi on 2018/2/28.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import "TestClass.h"
#import <objc/runtime.h>
@interface TestClass()
{
    int x;
    int y;
    int z;
}
@property int x;
@property int y;
@property int z;
@end

@implementation TestClass

@synthesize x, y, z;

- (instancetype)init
{
    self = [super init];
    
//    Class currentClass = [self class];
//    const char *a = object_getClassName(currentClass);
//    for (int i = 1; i < 5; i++) {
//        NSLog(@"Following the isa pointer %d times gives %p---%s", i, currentClass,a);
//        currentClass = object_getClass(currentClass);
//        a = object_getClassName(currentClass);
//    }
    
    Class currentClass = [self class];
    const char *a = object_getClassName(currentClass);
    for (int i = 1; i < 5; i++) {
        NSLog(@"Following the isa pointer %d times gives %p---%s", i, currentClass,a);
        currentClass = objc_getClass([NSStringFromClass(currentClass)UTF8String]);
        a = object_getClassName(currentClass);
    }
    
    return self;
}

+(BOOL)resolveInstanceMethod:(SEL)sel
{
    return YES;
}

+(BOOL)resolveClassMethod:(SEL)sel
{
    return YES;
}

-(id)forwardingTargetForSelector:(SEL)aSelector
{
    return nil;
}



@end

