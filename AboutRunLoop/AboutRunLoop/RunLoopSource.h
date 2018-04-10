//
//  RunLoopSource.h
//  AboutRunLoop
//
//  Created by Mi on 2018/2/12.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunLoopSource : NSObject
//{
//    CFRunLoopSourceRef runLoopSource;
//    NSMutableArray* commands;
//}
//
//- (id)init;
//- (void)addToCurrentRunLoop;
//- (void)invalidate;
//
//// Handler method
//- (void)sourceFired;
//
//// Client interface for registering commands to process
//- (void)addCommand:(NSInteger)command withData:(id)data;
//- (void)fireAllCommandsOnRunLoop:(CFRunLoopRef)runloop;
//
//@end
//
//// These are the CFRunLoopSourceRef callback functions.
//void RunLoopSourceScheduleRoutine (void *info, CFRunLoopRef rl, CFStringRef mode);
//void RunLoopSourcePerformRoutine (void *info);
//void RunLoopSourceCancelRoutine (void *info, CFRunLoopRef rl, CFStringRef mode);
//
//// RunLoopContext is a container object used during registration of the input source.
//@interface RunLoopContext : NSObject
//{
//    CFRunLoopRef        runLoop;
//    RunLoopSource*        source;
//}
//@property (readonly) CFRunLoopRef runLoop;
//@property (readonly) RunLoopSource* source;
//
//- (id)initWithSource:(RunLoopSource*)src andLoop:(CFRunLoopRef)loop;

@end
