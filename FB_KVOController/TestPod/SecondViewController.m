//
//  SecondViewController.m
//  TestPod
//
//  Created by Mi on 2017/12/30.
//  Copyright © 2017年 iwming. All rights reserved.
//

#import "SecondViewController.h"
#import <KVOController/KVOController.h>

@interface SecondViewController ()

@end

@implementation SecondViewController

/**
 关于kvocontroller的原理简介
 一、对NSObject进行扩展，增加2个属性  1、KVOController 持有观察结构体info  2、KVOControllerNonRetaining 不持有观察结构体  底层是通过操作管理多个info结合的NSMapTable的可以分别指定keyOperation ValueOperation【 NSPointerFunctionsOptions类型：NSPointerFunctionsWeakMemory、NSPointerFunctionsStrongMemory等】，此处NSMapTable对应key为被观察的Object，value为观察的key&status&block等信息，所以通过指定keyOperation为week不持有被观察者object达到目的
 二、内部通过_FBKVOSharedController实现系统的被观察者绑定方法，为实际的绑定代码，回调时执行block|selector
     同时增加 解绑移除观察对象
 三、当对象被释放时，KVOController属性没有持有者了也会调用dealloc方法，在此移除观察值，实际操作_FBKVOSharedController中的方法
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    label.center = self.view.center;
    label.text = @"初始化内容";
    
    //    FBKVOController *kvoController = [FBKVOController controllerWithObserver:self];
    
    [self.KVOController observe:label keyPath:@"text" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        
        NSLog(@"--%@",change);
    }];
    
    label.text = @"点击返回控制台打印释放信息";
    
}

- (void)dealloc
{
    NSLog(@"first called, then KVOController dealloc called");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
