//
//  BasicAnimationController.m
//  Animation_demo
//
//  Created by gaojianlong on 2017/11/20.
//  Copyright © 2017年 JLB. All rights reserved.
//  基本动画

#import "BasicAnimationController.h"

@interface BasicAnimationController ()

@property (weak, nonatomic) IBOutlet UIButton *red;
@property (weak, nonatomic) IBOutlet UIButton *green;
@property (weak, nonatomic) IBOutlet UIButton *yellow;

@end

@implementation BasicAnimationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[[NSBundle mainBundle] loadNibNamed:@"BasicView" owner:self options:nil] firstObject];
    self.title = @"基本动画";    
    [self initViews];
}

- (void)initViews
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.red.layer.masksToBounds = YES;
    self.red.layer.cornerRadius = 15;
    self.red.alpha = 0;
    
    self.green.layer.masksToBounds = YES;
    self.green.layer.cornerRadius = 15;
    self.green.alpha = 0;
    
    self.yellow.layer.masksToBounds = YES;
    self.yellow.layer.cornerRadius = 15;
    self.yellow.alpha = 0;
}

- (IBAction)startAnimations
{
    [self startAnimationForButton:self.red fromValue:0 toValue:@1.0 beginTime:CACurrentMediaTime()];
    [self startAnimationForButton:self.green fromValue:@0 toValue:@1.0 beginTime:CACurrentMediaTime() + 0.5];
    [self startAnimationForButton:self.yellow fromValue:@0 toValue:@1.0 beginTime:CACurrentMediaTime() + 1.0];
}

- (void)startAnimationForButton:(UIButton *)btn fromValue:(NSNumber *)fromValue toValue:(NSNumber *)toValue beginTime:(CFTimeInterval)beginTime
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.autoreverses = YES; //回退动画，动画可逆，即循环
    animation.duration = 1.0;
    animation.beginTime = beginTime;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [btn.layer addAnimation:animation forKey:@"aAlpha"];
}

@end
