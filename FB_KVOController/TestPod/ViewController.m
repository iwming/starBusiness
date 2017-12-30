//
//  ViewController.m
//  TestPod
//
//  Created by Mi on 2017/12/18.
//  Copyright © 2017年 iwming. All rights reserved.
//

#import "ViewController.h"

#import "SecondViewController.h"
#import <KVOController/KVOController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.    
    
    SecondViewController *vc = [[SecondViewController alloc]init];
    
//    self.KVOController = vc.KVOController;
    [self.navigationController pushViewController:vc animated:YES];
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
