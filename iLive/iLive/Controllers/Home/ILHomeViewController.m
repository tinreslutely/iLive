//
//  ILHomeViewController.m
//  iLive
//
//  Created by 李晓毅 on 16/3/15.
//  Copyright © 2016年 301 Studio. All rights reserved.
//

#import "ILHomeViewController.h"

@implementation ILHomeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:[[NSClassFromString(@"ILHomeView") alloc] initWithFrame:self.view.bounds]];
}

-(void)initRectLayer{
    CALayer *rectLayer = [[CALayer alloc] init];
    rectLayer.frame = CGRectMake(15, 200, 50, 50);
    rectLayer.cornerRadius = 15;
    rectLayer.backgroundColor = [[UIColor blackColor] CGColor];
    [self.view.layer addSublayer:rectLayer];
    
    CAKeyframeAnimation *rectRunAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    rectRunAnimation.values = @[[NSValue valueWithCGPoint:rectLayer.frame.origin]
                                ,[NSValue valueWithCGPoint:CGPointMake(320-15,rectLayer.frame.origin.y)]
                                ,[NSValue valueWithCGPoint:CGPointMake(320-15, rectLayer.frame.origin.y+100)]
                                ,[NSValue valueWithCGPoint:CGPointMake(15, rectLayer.frame.origin.y +100)]
                                ,[NSValue valueWithCGPoint:rectLayer.frame.origin]];
    rectRunAnimation.keyTimes = @[[NSNumber numberWithFloat:0]
                                  ,[NSNumber numberWithFloat:0.6]
                                  ,[NSNumber numberWithFloat:0.7]
                                  ,[NSNumber numberWithFloat:0.8]
                                  ,[NSNumber numberWithFloat:1]];
    rectRunAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    rectRunAnimation.repeatCount = 1000;
    rectRunAnimation.autoreverses = NO;
    rectRunAnimation.calculationMode = kCAAnimationLinear;
    rectRunAnimation.duration = 4;
    [rectLayer addAnimation:rectRunAnimation forKey:@"rectRunAnimation"];
}

-(void)initGroupLayer{
    float kYoffset = 10;
    CALayer *groupLayer = [[CALayer alloc] init];
    groupLayer.frame = CGRectMake(60, 540+kYoffset, 50, 50);
    groupLayer.cornerRadius = 10;
    groupLayer.backgroundColor = [[UIColor purpleColor] CGColor];
    [self.view.layer addSublayer:groupLayer];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 0.8;
    
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.fromValue = [NSValue valueWithCGPoint:groupLayer.position];
    moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(240, groupLayer.position.y)];
    moveAnimation.autoreverses = YES;
    moveAnimation.repeatCount = MAXFLOAT;
    moveAnimation.duration = 2;
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0*3.14];
    rotateAnimation.autoreverses = YES;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    CABasicAnimation *rotateAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation2.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation2.toValue = [NSNumber numberWithFloat:6.0*3.14];
    rotateAnimation2.autoreverses = YES;
    rotateAnimation2.repeatCount = MAXFLOAT;
    rotateAnimation2.duration = 2;
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = 2;
    groupAnimation.autoreverses = YES;
    groupAnimation.animations = @[scaleAnimation,moveAnimation,rotateAnimation,rotateAnimation2];
    groupAnimation.repeatCount = MAXFLOAT;
    
    
    
    [groupLayer addAnimation:groupAnimation forKey:@"groupAnimation"];
}

@end
