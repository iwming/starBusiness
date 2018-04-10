//
//  ViewController.m
//  WeakAssocatedProperty
//
//  Created by Mi on 2018/4/10.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+weakProperty.h"

@interface ViewController ()

@property (nonatomic, strong) NSDate *strongPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.strongPoint = [NSDate date];
//    self.weakObj = self.strongPoint;
    self.context = self.strongPoint;
    NSLog(@"%p", self.strongPoint); // print 指针。
//    NSLog(@"%p", self.weakObj); // print 相同的指针。
    NSLog(@"%p", self.context); // print 相同的指针。
    self.strongPoint = nil;
    
    NSLog(@"%p", self.strongPoint); // print 0x0 指针置为空。
//    NSLog(@"%p", self.weakObj); // print 0x0 指针置为空。
    NSLog(@"%p", self.context); // print 0x0 指针置为空。
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
