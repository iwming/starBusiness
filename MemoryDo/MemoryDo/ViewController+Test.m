//
//  ViewController+Test.m
//  MemoryDo
//
//  Created by Mi on 2018/1/6.
//  Copyright © 2018年 iwming. All rights reserved.
//

#import "ViewController+Test.h"
#import <objc/runtime.h>
#import <pthread.h>
@implementation ViewController (Test)


//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    NSLog(@"category viewdidLoad");
//    
//    pthread_mutex_t pLock;
//    pthread_mutex_init(&pLock, PTHREAD_MUTEX_NORMAL);
//}

- (NSString *)associatedObject_assign
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAssociatedObject_assign:(NSString *)associatedObject_assign
{
    objc_setAssociatedObject(self, @selector(associatedObject_assign), associatedObject_assign, OBJC_ASSOCIATION_ASSIGN);
}


@end
