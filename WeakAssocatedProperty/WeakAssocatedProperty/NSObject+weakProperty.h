//
//  NSObject+weakProperty.h
//  WeakAssocatedProperty
//
//  Created by Mi on 2018/4/10.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (weakProperty)

@property (nonatomic, weak) id weakObj;

@property (nonatomic, weak) id context;

@end
