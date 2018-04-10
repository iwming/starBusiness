//
//  ViewController.m
//  AboutRunLoop
//
//  Created by Mi on 2018/2/12.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import "ViewController.h"
#import "CusThread.h"

@interface ViewController ()
{
    CusThread *thread;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    thread = [[CusThread alloc] initWithTarget:self selector:@selector(testCalled) object:nil];
    [thread start];
}

- (void)testCalled
{
    NSLog(@"-current thread - %@",[NSThread currentThread]);
    while (1) {
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"++++++++");
    }
//    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop] run];
//    NSLog(@"---out");

}

- (IBAction)onClick:(id)sender {
    NSLog(@"---come");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self performSelector:@selector(threadAgain) onThread:thread withObject:nil waitUntilDone:NO];

}

- (void)threadAgain
{
    NSLog(@"--%@--", [NSThread currentThread]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
