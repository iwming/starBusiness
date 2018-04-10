//
//  ViewController.m
//  Load_initialize
//
//  Created by Mi on 2018/2/2.
//  Copyright © 2018年 iwming. All rights reserved.
//

#import "ViewController.h"
#import "Son.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [Father new];
    [Son new];
    [self viewLayer];
}

- (void)viewLayer
{
    CALayer *redLayer = [[CALayer alloc] init];
    redLayer.bounds = CGRectMake(0, 0, 200, 100);
    redLayer.position = CGPointMake(10, 10);
    redLayer.anchorPoint = CGPointMake(0, 0);
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:redLayer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
