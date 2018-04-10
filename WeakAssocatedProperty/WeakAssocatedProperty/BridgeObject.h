//
//  BridgeObject.h
//  WeakAssocatedProperty
//
//  Created by Mi on 2018/4/10.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DeallocBlock)(void);
@interface BridgeObject : NSObject

@property (nonatomic, copy) DeallocBlock block;

- (instancetype) initWithBlock:(DeallocBlock) block;

@end
