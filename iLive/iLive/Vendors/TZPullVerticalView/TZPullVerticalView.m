//
//  TZPullVerticalView.m
//  iLive
//
//  Created by 李晓毅 on 16/3/17.
//  Copyright © 2016年 301 Studio. All rights reserved.
//

#import "TZPullVerticalView.h"

static NSString *tzPullAnimationKey = @"bounce_Vertical";

typedef struct{
    int duration;
    
}TZAnimationParam;

@implementation TZPullVerticalView{
    CAShapeLayer *_horizontalLineLayer;//变化的线图层
    TZAnimationParam param;
}

#pragma mark life cycle
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        param.duration = 2;
        [self makeLine];
        [self addPanGesture];
    }
    return self;
}

#pragma mark  - CAAnimationDelegate
- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (anim == [_horizontalLineLayer animationForKey:tzPullAnimationKey] ) {
        _horizontalLineLayer.path = [self getBottomLinePathWithAmount:0.0];
        [_horizontalLineLayer removeAllAnimations];
        [self addPanGesture];
        
        
        CGFloat height = SCREEN_BOUNDS.size.height-100;
        [_horizontalLineLayer removeFromSuperlayer];
        _horizontalLineLayer.frame = CGRectMake(0, height, self.frame.size.width, 1);
        
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(0, 0, self.frame.size.width, height);
        } completion:^(BOOL finished) {
            [self.layer addSublayer:_horizontalLineLayer];
        }];
        
    }
}

#pragma mark action methods
-(void)hanleSlide:(UIPanGestureRecognizer*)panGestureRecognizer{
    CGPoint point = [panGestureRecognizer translationInView:self];
    if(ABS(point.x) > ABS(point.y)){
        DDLogDebug(@"返回");
        return;
    }
    
    if(panGestureRecognizer.state == UIGestureRecognizerStateEnded ||
       panGestureRecognizer.state == UIGestureRecognizerStateCancelled ||
       panGestureRecognizer.state == UIGestureRecognizerStateFailed){
        if(point.y > 0){
            [self removeGestureRecognizer:panGestureRecognizer];
            [self animationLeftLineReturnFrom:fabs(point.y)];
        }
        
    }else if(panGestureRecognizer.state == UIGestureRecognizerStateChanged){
        DDLogDebug(@"改变");
        if(point.y >= 0){
            _horizontalLineLayer.path = [self getBottomLinePathWithAmount:point.y];
            if(point.y > self.bounds.size.width*0.5){
                [self removeGestureRecognizer:panGestureRecognizer];
                [self animationLeftLineReturnFrom:point.y];
            }
        }
    }
}

#pragma mark private methods
-(void)makeLine{
    _horizontalLineLayer = [CAShapeLayer layer];
    [_horizontalLineLayer setFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
    _horizontalLineLayer.strokeColor = [[UIColor whiteColor] CGColor];
    _horizontalLineLayer.lineWidth = 1.0;
    _horizontalLineLayer.fillColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:_horizontalLineLayer];
}

-(void)addPanGesture{
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(hanleSlide:)];
    [self addGestureRecognizer:panGestureRecognizer];
}

-(CGPathRef)getBottomLinePathWithAmount:(CGFloat)amount{
    UIBezierPath *verticalLine = [UIBezierPath bezierPath];
    CGPoint leftPoint = CGPointMake(0, 0);
    CGPoint midControlPoint = CGPointMake(self.bounds.size.width/2, amount);
    CGPoint rightPoint = CGPointMake(self.bounds.size.width, 0);
    [verticalLine moveToPoint:leftPoint];
    [verticalLine addQuadCurveToPoint:rightPoint controlPoint:midControlPoint];
    [verticalLine closePath];
    return [verticalLine CGPath];
}

-(void)animationLeftLineReturnFrom:(CGFloat)positionY{
    CAKeyframeAnimation *morph = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    morph.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    morph.values = @[(id)[self getBottomLinePathWithAmount:positionY],
                     (id)[self getBottomLinePathWithAmount:0.0]];
    morph.duration = 0.3;
    morph.removedOnCompletion = NO;
    morph.fillMode = kCAFillModeForwards;
    morph.delegate = self;
    [_horizontalLineLayer addAnimation:morph forKey:tzPullAnimationKey];
}

-(void)animationBottomLineReturnFrom:(CGFloat)positionY{
    
}

#pragma mark public methods
-(void)setBackgroundColor:(UIColor *)backgroundColor{
    [super setBackgroundColor:backgroundColor];
    [_horizontalLineLayer setStrokeColor:backgroundColor.CGColor];
    [_horizontalLineLayer setFillColor:backgroundColor.CGColor];
}

@end
