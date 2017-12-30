//
//  ViewController.m
//  AboutCategory
//
//  Created by Mi on 2017/12/14.
//  Copyright © 2017年 iwming. All rights reserved.
//

#import "ViewController.h"
#import "ViewController+Test.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testFunc];
}

- (void)testFunc
{
    NSLog(@"category");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
