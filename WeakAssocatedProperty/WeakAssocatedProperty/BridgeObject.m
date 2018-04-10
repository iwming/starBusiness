//
//  BridgeObject.m
//  WeakAssocatedProperty
//
//  Created by Mi on 2018/4/10.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import "BridgeObject.h"

@implementation BridgeObject

- (instancetype)initWithBlock:(DeallocBlock)block
{
    self = [super init];
    if(self){
        self.block = block;
    }
    return self;
}

//当该类释放时，执行block
- (void)dealloc
{
    NSLog(@"call dealloc");
    self.block ? self.block() : nil;
}

@end
