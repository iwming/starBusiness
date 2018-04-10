//
//  ViewController.m
//  Transline
//
//  Created by Mi on 2018/2/22.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import "ViewController.h"
#import "CusView.h"
#import "TestButton.h"
#import "TestClass.h"
#import <objc/runtime.h>
#import <objc/message.h>

#import "UIButton+Tracking.h"
#import "FatherView.h"
#import "SonView.h"


typedef void (^blk_t)(void);

@interface ViewController ()

@end

@implementation ViewController




- (void)buttonCalled
{
    NSLog(@"--called");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSLog(@"5&0x1:%d",6 & 0x1);
    
    FatherView *fatherView = [[FatherView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    fatherView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:fatherView];
    
    SonView *sonView = [[SonView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    sonView.backgroundColor = [UIColor yellowColor];
    [fatherView addSubview:sonView];
    
    
    
    
    return;
    
    UIButton *button = [UIButton new];
    button.frame = CGRectMake(100, 200, 100, 50);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self
                action:@selector(buttonCalled) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button enableEventTracking];
//    [TestClass new];
    
    
    [button mutableArrayValueForKey:@""];
    
//    if(__OBJC__){
//        NSLog(@"__OBJC__");
//    }
//    if(__OBJC2__){
//        NSLog(@"objc2");
//    }else{
//        NSLog(@"not objc2");
//    }
//
//    int count = 0;
//    blk_t blk = ^(){
//        NSLog(@"In Stack:%d", count);
//    };
//
//    NSLog(@"blk's Class:%@", [blk class]);//打印：blk's Class:__NSMallocBlock__
//    NSLog(@"Global Block:%@", [^{NSLog(@"Global Block");} class]);//打印：Global Block:__NSGlobalBlock__
//    NSLog(@"Copy Block:%@", [[^{NSLog(@"Copy Block:%d",count);} copy] class]);//打印：Copy Block:__NSMallocBlock__
//    NSLog(@"Stack Block:%@", [^{NSLog(@"Stack Block:%d",count);} class]);//打印：Stack Block:__NSStackBlock__
//
    
    
//    __block int a = 0;
//    NSLog(@"定义前：%p", &a);         //栈区
//    void (^foo)(void) = ^{
//        a = 1;
//        NSLog(@"block内部：%p", &a);    //堆区
//    };
//    NSLog(@"定义后：%p", &a);         //堆区
//    foo();
        
    
    
//    CusView *superView = [[CusView alloc] initWithFrame:CGRectMake(100, 100, 100, 60)];
//    superView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:superView];
//
//    TestButton *button = [[TestButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    button.backgroundColor = [UIColor yellowColor];
//    [button addTarget:self action:@selector(buttonCalled) forControlEvents:UIControlEventTouchUpInside];
//    [superView addSubview:button];
    
    
    
    
        
//        TestClass *x = [[TestClass alloc] init];
//        TestClass *y = [[TestClass alloc] init];
//        TestClass *xy = [[TestClass alloc] init];
//        TestClass *control = [[TestClass alloc] init];
//
//        [x addObserver:x forKeyPath:@"x" options:0 context:NULL];
//        [xy addObserver:xy forKeyPath:@"x" options:0 context:NULL];
//        [y addObserver:y forKeyPath:@"y" options:0 context:NULL];
//        [xy addObserver:xy forKeyPath:@"y" options:0 context:NULL];
//
//        PrintDescription(@"control", control);
//        PrintDescription(@"x", x);
//        PrintDescription(@"y", y);
//        PrintDescription(@"xy", xy);
//
//        printf("Using NSObject methods, normal setX: is %p, overridden setX: is %p\n",
//               [control methodForSelector:@selector(setX:)],
//               [x methodForSelector:@selector(setX:)]);
//        printf("Using libobjc functions, normal setX: is %p, overridden setX: is %p\n",
//               method_getImplementation(class_getInstanceMethod(object_getClass(control),
//                                                                @selector(setX:))),
//               method_getImplementation(class_getInstanceMethod(object_getClass(x),
//                                                                @selector(setX:))));

    
}


static NSArray *ClassMethodNames(Class c)
{
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(c, &methodCount);
    unsigned int i;
    for(i = 0; i < methodCount; i++)
        [array addObject: NSStringFromSelector(method_getName(methodList[i]))];
    free(methodList);
    
    return array;
}

static void PrintDescription(NSString *name, id obj)
{
    struct objc_object *object = (__bridge struct objc_object *)obj;
    NSString *str = [NSString stringWithFormat:
                     @"%@: %@\n\tNSObject class %s\n\tlibobjc class %s\n\timplements methods <%@>",
                     name,
                     obj,
                     class_getName([obj class]),
                     class_getName(object->isa),
                     [ClassMethodNames([obj class]) componentsJoinedByString:@", "]];
    printf("%s\n", [str UTF8String]);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
