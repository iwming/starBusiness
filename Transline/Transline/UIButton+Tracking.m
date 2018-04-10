//
//  UIButton+Tracking.m
//  Transline
//
//  Created by Mi on 2018/3/13.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import "UIButton+Tracking.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation UIButton (Tracking)

- (void)enableEventTracking
{
    NSString *className = [NSString stringWithFormat:@"EventTracking_%@",self.class];//EventTracking_UIButton
    Class kClass        = objc_getClass([className UTF8String]);//返回这个类的类对象，因为不存在返回nil
    
    if (!kClass) {
        kClass = objc_allocateClassPair([self class], [className UTF8String], 0);//objc_allocateClassPair(super class,name,0)
    }
    //获取到要操作的方法
    SEL setterSelector  = NSSelectorFromString(@"sendAction:to:forEvent:");
    Method setterMethod = class_getInstanceMethod([self class], setterSelector);
    
    NSLog(@"---%@",object_getClass(self)); // ---UIButton
    object_setClass(self, kClass); // 转换当前类从UIButton到新建的EventTracking_UIButton类 --- 修改isa指针,指向新创建的类
    NSLog(@"---%@",object_getClass(self)); // ---EventTracking_UIButton
    
    const char *types   = method_getTypeEncoding(setterMethod);
    
    class_addMethod(kClass, setterSelector, (IMP)eventTracking_SendAction, types); //给子类EventTracking_UIButton增加方法，覆写sendAction:to:forEvent:方法，IMP为eventTracking_SendAction
    
    objc_registerClassPair(kClass);
}

static void eventTracking_SendAction(id self, SEL _cmd, SEL action ,id target , UIEvent *event) {
    struct objc_super superclass = {
        .receiver    = self,
        .super_class = class_getSuperclass(object_getClass(self))
    };
    void (*objc_msgSendSuperCasted)(const void *, SEL, SEL, id, UIEvent *) = (void *)objc_msgSendSuper;
    
    // to do event tracking...
    NSLog(@"Click event record: target = %@, action = %@, event = %ld", target, NSStringFromSelector(action), (long)event.type);
    //调用父类的方法
    objc_msgSendSuperCasted(&superclass, _cmd, action, target, event);
}

@end
