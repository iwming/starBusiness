//
//  ViewController.m
//  MemoryDo
//
//  Created by Mi on 2018/1/3.
//  Copyright © 2018年 iwming. All rights reserved.
//

#import "ViewController.h"
#import "TestObject.h"
#import "SonObject.h"
#import "CustomOperation.h"
#import "ConcurrentOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)checkCopy
{
//    NSString *string = @"abc";
//    NSMutableString *copyString = [string copy];//不可变的 且地址与string一致
//    NSMutableString *mutableCopyString = [string mutableCopy];//得到mutableSting
//    NSLog(@"%p,%p,%p",string,copyString,mutableCopyString);
//    [mutableCopyString appendString:@"123"];
    
    
//    NSMutableString *string      = [NSMutableString stringWithString: @"origin"];
//    //copy
//    NSString *stringCopy         = [string copy];
//    NSMutableString *mStringCopy = [string copy];
//    NSMutableString *stringMCopy = [string mutableCopy];
//
//    NSLog(@"%p", string);
//    NSLog(@"%p", stringCopy);
//    NSLog(@"%p", mStringCopy);
//    NSLog(@"%p", stringMCopy);
    
//    NSArray *array = @[@[@"a", @"b"], @[@"c", @"d"]];
//    NSArray *copyArray = [array copy];
//    NSMutableArray *mCopyArray = [array mutableCopy];
//
//    NSLog(@"%p", array);
//    NSLog(@"%p", copyArray);
//    NSLog(@"%p", mCopyArray);
    
//    NSMutableArray *array = [NSMutableArray arrayWithObjects:[NSMutableString stringWithString:@"a"],@"b",@"c",nil];
//    NSArray *copyArray = [array copy];
//    NSMutableArray *mCopyArray = [array mutableCopy];
//
//    NSLog(@"%p", array);
//    NSLog(@"%p", copyArray);
//    NSLog(@"%p", mCopyArray);
    
//    NSMutableString *string = [NSMutableString stringWithString:@"abc"];
//    NSMutableString *copyString = [string copy];//不可变的
//    NSString *justString = [string copy];//不可变的
//    NSMutableString *mutableCopyString = [string mutableCopy];
//    NSLog(@"%p,%p,,%p,%p",string,copyString,justString,mutableCopyString);
//    [string appendString:@"123"];
//    [copyString appendString:@"123"];//挂
//    [mutableCopyString appendString:@"123"];
    
//    NSArray *array = @[@"a",@"b",@"c"];
//    NSArray *copyArray = [array copy]; //浅拷贝
//    NSMutableArray *mutableCopyArray = [array mutableCopy];//单层浅拷贝，里面的元素元素仍为指针拷贝
//    NSLog(@"%p,%p,%p,%p,%p",array,copyArray,mutableCopyArray,array[0],mutableCopyArray[0]);
//    [mutableCopyArray addObject:@"1"];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@[@"1",@"2"],@"b",@"c",nil];
    NSMutableArray *copyArray = [array copy];
    NSMutableArray *mutableCopyArray = [array mutableCopy];
    [mutableCopyArray addObject:@"1"];
    //单层复制
    NSArray *deepCopyArray=[[NSArray alloc] initWithArray:array copyItems:YES];
   //完全复制
    
    NSArray* trueDeepCopyArray = [NSKeyedUnarchiver unarchiveObjectWithData:
                                  [NSKeyedArchiver archivedDataWithRootObject:array]];
//    [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:array]];
    NSLog(@"%p,%p,%p,%p,%p,%p,%p",array,copyArray,mutableCopyArray,array[0],mutableCopyArray[0],deepCopyArray[0],trueDeepCopyArray[0]);


}

- (void)testPerform
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //子线程中增加一个timer 如果没有启动RunLoop则不会执行回调
        [self performSelector:@selector(callme) withObject:nil afterDelay:2];

        NSLog(@"%@",[NSThread currentThread]);
//        NSMachPort *port = [[NSMachPort alloc] init];
//        [[NSRunLoop currentRunLoop] addPort:port forMode:NSRunLoopCommonModes];
//        [[NSRunLoop currentRunLoop] run];
          [[NSRunLoop currentRunLoop] run];
    });
    
}

- (void)callme
{
    
    NSLog(@"----%@",[NSThread currentThread]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    TestObject *obj = [[TestObject alloc] init];
//    TestObject *obj = [TestObject new];
//    [obj mutableCopy];
    
   SonObject *son = [SonObject new];
    
   [(TestObject *)son test];
   [son test];

    
    
    return;
    [self testPerform];
    return;
    [self checkCopy];
    
    return;
    
//    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invoke:) object:@"ab"];
//    operation.completionBlock = ^{
//        NSLog(@"end");
//    };
//    [operation start];

//    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"first %@",[NSThread currentThread]);
//    }];
//
//    [blockOperation addExecutionBlock:^{
//        NSLog(@"second %@",[NSThread currentThread]);
//    }];
//    [blockOperation addExecutionBlock:^{
//        NSLog(@"third %@",[NSThread currentThread]);
//    }];
//    [blockOperation addExecutionBlock:^{
//        NSLog(@"fourth %@",[NSThread currentThread]);
//    }];
//
//    [blockOperation setCompletionBlock:^{
//        NSLog(@"end %@",[NSThread currentThread]);
//    }];
//
//    [blockOperation start];
    
    NSLog(@"main thread:%@",[NSThread currentThread]);

    
 
    CustomOperation *noCurrentOperation = [[CustomOperation alloc] init];
//    cusOperation.queuePriority = NSOperationQueuePriorityHigh;//设置高优先级 可以提升执行顺序，否则按照加入顺序
    //调用start时，会在start当前的线程中执行。
    //如果我们创建多个自定义的NoCurrentOperation，并放入NSOperationQueue中，这些任务也是并发执行的，只不过因为我们没有处理并发情况下，线程执行完，KVO等操作，因此不建议在只实现main函数的情况下将其加入NSOperationQueue，
    //只实现main一般只适合自定义非并发的。
//    [cusOperation start];
    
      /*
        此时start会在新线程
       */
//    ConcurrentOperation *currentOperation = [[ConcurrentOperation alloc] init];
//    [currentOperation start];
    
    ConcurrentOperation *currentOperation2 = [[ConcurrentOperation alloc] init];
    //    [currentOperation start];
    
    ConcurrentOperation *currentOperation1 = [[ConcurrentOperation alloc] init];
 
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperation:currentOperation1];
//    [queue addOperation:currentOperation2];

    [queue addOperation:noCurrentOperation];
}

- (void)invoke:(id)obj
{
    
    NSLog(@"current:%@",[NSThread currentThread]);
}


- (void)dealloc
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
