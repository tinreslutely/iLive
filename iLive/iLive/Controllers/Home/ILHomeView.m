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
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self makeLine];
        [self addPanGesture];
    }
    return self;
}

#pragma mark  - CAAnimationDelegate
- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (anim == [_verticalLineLayer animationForKey:@"bounce_left"] ) {
        _verticalLineLayer.path = [self getLeftLinePathWithAmount:0.0];
        [_verticalLineLayer removeAllAnimations];
        [self addPanGesture];
    }
}

-(void)hanleSlide:(UIPanGestureRecognizer*)panGestureRecognizer{
    CGPoint point = [panGestureRecognizer translationInView:self];
    if(ABS(point.y) > ABS(point.x)){
        return;
    }
    
    if(panGestureRecognizer.state == UIGestureRecognizerStateEnded ||
       panGestureRecognizer.state == UIGestureRecognizerStateCancelled ||
       panGestureRecognizer.state == UIGestureRecognizerStateFailed){
        if(point.x > 0){
            [self removeGestureRecognizer:panGestureRecognizer];
            [self animationLeftLineReturnFrom:fabs(point.x)];
        }
            
    }else if(panGestureRecognizer.state == UIGestureRecognizerStateChanged){
        
        if(point.x >= 0){
            _verticalLineLayer.path = [self getLeftLinePathWithAmount:point.x];
            if(point.x > self.bounds.size.width/2){
                [self removeGestureRecognizer:panGestureRecognizer];
                [self animationLeftLineReturnFrom:point.x];
            }
        }else{
            RESideMenu *sideController  =  (RESideMenu*)((AppDelegate*)[UIApplication sharedApplication].delegate).window.rootViewController;
            [sideController presentRightMenuViewController];
        }
    }
}

-(void)makeLine{
    _verticalLineLayer = [CAShapeLayer layer];
    _verticalLineLayer.strokeColor = [[UIColor whiteColor] CGColor];
    _verticalLineLayer.lineWidth = 1.0;
    _verticalLineLayer.fillColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:_verticalLineLayer];
}

-(void) addPanGesture{
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(hanleSlide:)];
    [self addGestureRecognizer:panGestureRecognizer];
}


-(CGPathRef)getLeftLinePathWithAmount:(CGFloat)amount{
    UIBezierPath *verticalLine = [UIBezierPath bezierPath];
    CGPoint topPoint = CGPointMake(0, 0);
    CGPoint midControlPoint = CGPointMake(amount, self.bounds.size.height/2);
    CGPoint bottomPoint = CGPointMake(0, self.bounds.size.height);
    [verticalLine moveToPoint:topPoint];
    [verticalLine addQuadCurveToPoint:bottomPoint controlPoint:midControlPoint];
    [verticalLine closePath];
    return [verticalLine CGPath];
}

-(void)animationLeftLineReturnFrom:(CGFloat)positionX{
    CAKeyframeAnimation *morph = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    morph.values = @[(id)[self getLeftLinePathWithAmount:positionX],
                     (id)[self getLeftLinePathWithAmount:-(positionX*0.9)],
                     (id)[self getLeftLinePathWithAmount:(positionX*0.6)],
                     (id)[self getLeftLinePathWithAmount:-(positionX*0.4)],
                     (id)[self getLeftLinePathWithAmount:(positionX*0.25)],
                     (id)[self getLeftLinePathWithAmount:-(positionX*0.15)],
                     (id)[self getLeftLinePathWithAmount:(positionX*0.05)],
                     (id)[self getLeftLinePathWithAmount:0.0]];
    morph.duration = 0.5;
    morph.removedOnCompletion = NO;
    morph.fillMode = kCAFillModeForwards;
    morph.delegate = self;
    [_verticalLineLayer addAnimation:morph forKey:@"bounce_left"];
}
@end
