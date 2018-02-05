//
//  ViewController.m
//  DataStructDemo
//
//  Created by Mi on 2018/1/16.
//  Copyright © 2018年 iwming. All rights reserved.
//

#import "ViewController.h"
#include "PrintBinaryTreeTopToBottom.h"
#import "LayoutView.h"

@interface ViewController ()
{
    LayoutView *view;
}
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    PrintBinaryTreeFromTopToBottom();
    
    view = [[LayoutView alloc] initWithFrame:CGRectMake(0, 100, 100, 30)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 150, 60, 30);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    int val = 10;
    NSString *str = @"abc";
    
//    void (^block)(NSString *str,int value) = ^(NSString *str,int value){
//        NSLog(@"%@,--%d",str,value);
//    };

    void (^block)(void) = ^(void){
        NSLog(@"%@,--%d",str,val);
    };
    val = 11;
    str = @"ds";
    block();
    
}

- (void)call
{
    [view setNeedsLayout];
    [view layoutIfNeeded];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
