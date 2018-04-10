//
//  ViewController.m
//  AboutAnimation
//
//  Created by Mi on 2018/2/6.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *topViews;
@property (weak, nonatomic) IBOutlet UIButton *centerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self basicAnimationOfPosition];
    [self basicAnimationOfPositionX];

}
- (void)basicAnimationOfPosition {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position"];
    ani.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    ani.duration = 1.0f;
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.topViews.layer addAnimation:ani forKey:@"PossitionAni"];
}

- (void)basicAnimationOfPositionX
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position.x"];
    ani.toValue = [NSNumber numberWithFloat:20];
    ani.removedOnCompletion = NO;
    ani.duration = 1.0f;
    ani.fillMode = kCAFillModeBackwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.topViews.layer addAnimation:ani forKey:@"PositionXAni"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
