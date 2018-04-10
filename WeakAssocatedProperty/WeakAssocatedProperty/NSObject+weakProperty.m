//
//  NSObject+weakProperty.m
//  WeakAssocatedProperty
//
//  Created by Mi on 2018/4/10.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import "NSObject+weakProperty.h"
#import <objc/runtime.h>
#import "BridgeObject.h"

@implementation NSObject (weakProperty)

-(id)weakObj
{
    return objc_getAssociatedObject(self, @selector(weakObj));
}

//总结：给传入的对象先关联一个带dealloc的属性，然后再将传入对象assign形式关联到self上。
- (void)setWeakObj:(id)weakObj
{
    BridgeObject *obj = [[BridgeObject alloc] initWithBlock:^{
        //置空
        objc_setAssociatedObject(self, @selector(weakObj), nil, OBJC_ASSOCIATION_ASSIGN);
    }];
    //将obj 关联到 weakObj 上，当weakObj被释放时，关联在它上面的obj对象会主动调用dealloc，并在dealloc中将关联属性重置为nil，
    //这里必须用Retain修饰，否则会直接释放
    objc_setAssociatedObject(weakObj, (__bridge const void *)obj.block, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //将传入的对象weakObj以assign的方式关联到self上，这样不会增加weakObj的引用计数，可以在weakObj被释放时，能及时置空。固此处必须用assign修饰
    objc_setAssociatedObject(self, @selector(weakObj), weakObj, OBJC_ASSOCIATION_ASSIGN);//
}


/*
 *  极简单处理
    将传入的Object用weak修饰，这样当Object被释放时，weakObject自动设置为Nil，
    实际保存block到self，读取时获取到Block，执行block打印weakObject，利用了weak修饰的变量可以自动置nil特性，曲线实现weak属性。
 */

- (void)setContext:(id)object {
    id __weak weakObject = object;
    id (^block)(void) = ^{ return weakObject; };
    objc_setAssociatedObject(self, @selector(context), block, OBJC_ASSOCIATION_COPY);
}

- (id)context {
    id (^block)(void) = objc_getAssociatedObject(self, @selector(context));
    id curContext = (block ? block() : nil);
    return curContext;
}


@end
