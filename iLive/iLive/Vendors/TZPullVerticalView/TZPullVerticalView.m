//
//  TZPullVerticalView.m
//  iLive
//
//  Created by 李晓毅 on 16/3/18.
//  Copyright © 2016年 301 Studio. All rights reserved.
//

#import "TZPullVerticalView.h"

@implementation TZPullVerticalView{
    float _viewHeight;
    float _pullBottomFreeHeight;
    float _pullTopFreeHeight;
    int _pullVerticalType;//1  向上  2向下
    
}

-(instancetype)init{
    if(self = [super init]){
        [self initData];
        [self setupGestureRecognizer];
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH, _viewHeight)];
    }
    return self;
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if(flag){
        if(_pullVerticalType == 1) _pullVerticalType = 2;
    }
}

#pragma mark action methods
-(void)handlePullSide:(UIPanGestureRecognizer*)panGestureRecognizer{
    CGPoint point = [panGestureRecognizer translationInView:self];
    CGPoint vPoint = [panGestureRecognizer velocityInView:self];
    CGPoint mPoint = [panGestureRecognizer locationInView:self];
//    DDLogDebug(@"---translationInView--    x:%f,y:%f",point.x,point.y);
//    DDLogDebug(@"---velocityInView--    x:%f,y:%f",vPoint.x,vPoint.y);
//    DDLogDebug(@"---locationInView--    x:%f,y:%f",mPoint.x,mPoint.y);
    
    DDLogDebug(@"---translationInView--    x:%f,y:%f",point.x,point.y);
    if(_pullVerticalType == 1){
        self.frame = CGRectMake(0, point.y, self.frame.size.width, self.frame.size.height);
        
    }else if(_pullVerticalType == 2){
        
    }
//    if(point.y < 0){//向上
//        if(_viewHeight + self.frame.origin.y > _pullTopFreeHeight) self.frame = CGRectMake(0, point.y, self.frame.size.width, self.frame.size.height);
//    }else if(point.y > 0){//向下
//        if(self.frame.origin.y < 0) self.frame = CGRectMake(0, point.y, self.frame.size.width, self.frame.size.height);
//    }
}


#pragma mark private methods
-(void)initData{
    _pullTopFreeHeight = 68.0f;
    _viewHeight = SCREEN_HEIGHT - _pullTopFreeHeight;
    _pullTopFreeHeight = 68.0f;
    _pullVerticalType = 1;
}

-(void)setupGestureRecognizer{
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePullSide:)];
    [self addGestureRecognizer:panGestureRecognizer];
}

@end
