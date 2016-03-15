//
//  ILHomeView.m
//  iLive
//  KYBezierBounceView
//  Created by 李晓毅 on 16/3/15.
//  Copyright © 2016年 301 Studio. All rights reserved.
//

#import "ILHomeView.h"

@implementation ILHomeView{
    CAShapeLayer *_verticalLineLayer;
    UIView *_leftBubble;
    UIView *_righBubble;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self makeLine];
        [self addPanGesture];
    }
    return self;
}

-(void)hanleSlide:(UIPanGestureRecognizer*)panGestureRecognizer{
    CGPoint point = [panGestureRecognizer translationInView:self];
    if(ABS(point.y) > ABS(point.x)){
        NSLog(@"返回");
        return;
    }
    
    if(panGestureRecognizer.state == UIGestureRecognizerStateEnded ||
       panGestureRecognizer.state == UIGestureRecognizerStateCancelled ||
       panGestureRecognizer.state == UIGestureRecognizerStateFailed){
        NSLog(@"停止");
    }else if(panGestureRecognizer.state == UIGestureRecognizerStateChanged){
        NSLog(@"改变");
    }
}

-(void)makeLine{
    _verticalLineLayer = [CAShapeLayer layer];
    _verticalLineLayer.strokeColor = [[UIColor whiteColor] CGColor];
    _verticalLineLayer.lineWidth = 1.0;
    _verticalLineLayer.fillColor = [UIColor whiteColor].CGColor;
}

-(void) addPanGesture{
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(hanleSlide:)];
    [self addGestureRecognizer:panGestureRecognizer];
}
@end
