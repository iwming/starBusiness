//
//  ViewController.m
//  AboutLock
//
//  Created by Mi on 2017/12/11.
//  Copyright © 2017年 iwming. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSLock *lock;
@property (nonatomic, strong) NSConditionLock *conditionlLock;


@property (nonatomic, assign) NSInteger leftMoney;//存款金额

@end


int  num = 10;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)testFunc
{
    NSLog(@"viewcontroller");
    
}
- (IBAction)useNSLock:(id)sender
{
    self.lock = [[NSLock alloc] init];
    self.leftMoney = 100;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self takeMoney:1];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self takeMoney:2];
    });
}

- (void)takeMoney:(NSInteger)index
{
    [self.lock lock];
    NSLog(@"index:%ld begin",index);
    while (self.leftMoney > 0) {
        NSLog(@"index:%ld,leftMoney:%ld",(long)index,_leftMoney);
        self.leftMoney -= 10;
    }
    NSLog(@"index:%ld end",index);
    [self.lock unlock];
}

- (IBAction)useConditionLock:(id)sender {
    self.conditionlLock = [[NSConditionLock alloc] initWithCondition:1];
    self.leftMoney = 0;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self takeMoney];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self putMoney];
    });
}

- (void)putMoney
{
     //condition为1的时候执行，否则等待
    [self.conditionlLock lockWhenCondition:1];
    NSLog(@"putMoney begin");
    while (self.leftMoney < 100) {
        NSLog(@"index:%ld,leftMoney:%ld",(long)index,_leftMoney);
        self.leftMoney += 10;
    }
    NSLog(@"putMoney end");
    [self.conditionlLock unlockWithCondition:2];
    
}

- (void)takeMoney
{
    //condition为2的时候执行，否则等待
    [self.conditionlLock lockWhenCondition:2];
    NSLog(@"takeMoney begin");
    while (self.leftMoney > 0) {
        NSLog(@"index:%ld,takeMoney:%ld",(long)index,_leftMoney);
        self.leftMoney -= 10;
    }
    NSLog(@"takeMoney end");
    [self.conditionlLock unlockWithCondition:1];
    
    
}

- (IBAction)useSemaphore:(id)sender {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //阻塞
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"begin task 1");
        sleep(5);
        //释放
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //阻塞等待
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"begin task 2");
        //释放
        dispatch_semaphore_signal(semaphore);
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


















