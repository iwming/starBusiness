//
//  CustomOperation.m
//  MemoryDo
//
//  Created by Mi on 2018/1/5.
//  Copyright © 2018年 iwming. All rights reserved.
//

#import "CustomOperation.h"

@implementation CustomOperation




//非并发只需重载main方法，对于并发NSOperation 需要重写多个基本方法
//执行主任务，正确响应取消事件
- (void)main
{
    @autoreleasepool{
        
        if(self.isCancelled){
            //属性置空
            return;
        }
        
        for (int i = 0; i < 3; i++){
            NSLog(@"current:%d.thread:%@",i,[NSThread currentThread]);
        }
        
        if(self.isCancelled){
            //属性置空
            return;
        }
        //通知 主线程
    }
}

@end
