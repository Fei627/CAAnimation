//
//  AnimationGroupController.m
//  Animation_demo
//
//  Created by gaojianlong on 2017/11/28.
//  Copyright © 2017年 JLB. All rights reserved.
//

#define kScreenWidth    CGRectGetWidth(self.view.frame)
#define kScreenHeight   CGRectGetHeight(self.view.frame)

#import "AnimationGroupController.h"

@interface AnimationGroupController ()

@property (weak, nonatomic) IBOutlet UIButton *heart;
@property (weak, nonatomic) IBOutlet UILabel *me;
@property (weak, nonatomic) IBOutlet UILabel *love;
@property (weak, nonatomic) IBOutlet UILabel *you;

@end

@implementation AnimationGroupController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"动画组";
    
    [self initViews];
}

- (void)initViews
{
    self.me.alpha = 0;
    self.love.alpha = 0;
    self.you.alpha = 0;
}

- (IBAction)heartClicked
{
    [self startDisplacement];
    [self startBreathingAnimationWithBeginTime:CACurrentMediaTime() + 6.5];
    
    [self startAnimationForLabel:self.me fromValue:0 toValue:@1.0 beginTime:CACurrentMediaTime() + 6.5];
    [self startAnimationForLabel:self.love fromValue:@0 toValue:@1.0 beginTime:CACurrentMediaTime() + 7.0];
    [self startAnimationForLabel:self.you fromValue:@0 toValue:@1.0 beginTime:CACurrentMediaTime() + 7.5];
}

- (void)startDisplacement
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    
    CGFloat heartW = CGRectGetWidth(self.heart.frame);
    CGFloat heartH = CGRectGetHeight(self.heart.frame);
    
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth / 2.0, 64 + heartH)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth - heartW, kScreenHeight / 2.0)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth / 2.0, kScreenHeight - heartH)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(heartW, kScreenHeight / 2.0)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth / 2.0, 64 + heartH)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame))];
    
    animation.values = @[value0, value1, value2, value3, value4, value5];
    animation.repeatCount = 0;
    animation.duration = 6.0;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.heart.layer addAnimation:animation forKey:@"values"];
}

- (void)startBreathingAnimationWithBeginTime:(CFTimeInterval)beginTime
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];

    animation.toValue = @(2);
    animation.autoreverses = YES; //回退动画，动画可逆，即循环
    animation.duration = 0.5;
    animation.beginTime = beginTime;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.heart.layer addAnimation:animation forKey:nil];
}

- (void)startAnimationForLabel:(UILabel *)label fromValue:(NSNumber *)fromValue toValue:(NSNumber *)toValue beginTime:(CFTimeInterval)beginTime
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
    [label.layer addAnimation:animation forKey:nil];
}

@end
