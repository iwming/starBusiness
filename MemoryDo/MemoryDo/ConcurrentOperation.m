//
//  ConcurrentOperation.m
//  MemoryDo
//
//  Created by Mi on 2018/1/5.
//  Copyright © 2018年 iwming. All rights reserved.
//

#import "ConcurrentOperation.h"



/**
 至少要重写
 - (void)start
 - (BOOL)isConcurrent
 - (BOOL)isExecuting
 - (BOOL)isFinished
 */
@interface ConcurrentOperation()

/**
 * The request used by the operation's task.
 */

@property (nonatomic,assign,getter=isExecuting) BOOL executing;
@property (nonatomic,assign,getter=isFinished) BOOL finished;
// SessionTask的运行session,外部实例化的Session
@property (nonatomic, weak  ) NSURLSession *unownedSession;

@end

@implementation ConcurrentOperation

@synthesize executing = _executing;
@synthesize finished = _finished;

- (instancetype)init
{
    if(self = [super init]){
        
        _executing = NO;
        _finished = NO;

    }
    return  self;
}

 - (BOOL)isConcurrent
{
    return YES;
}

- (BOOL)isExecuting
{
    return _executing;
}

- (BOOL)isFinished
{
    return _finished;
}

- (void)start
{
    if(self.isCancelled){
        [self willChangeValueForKey:@"isFinished"];
        _finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    [self willChangeValueForKey:@"isExcuting"];
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    _executing = YES;
    [self didChangeValueForKey:@"isExcuting"];
    
    
}

- (void)main
{
    @autoreleasepool{
        //此处为定义的并发任务具体
        NSLog(@"concurrent-thread:%@",[NSThread currentThread]);
        
        //任务执行完后修改状态值
        [self willChangeValueForKey:@"isFinished"];
        [self willChangeValueForKey:@"isExecuting"];

        _executing = NO;
        _finished = YES;
        [self didChangeValueForKey:@"isExecuting"];
        [self didChangeValueForKey:@"isFinished"];
    }
    
}

@end
