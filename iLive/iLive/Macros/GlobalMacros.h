//
//  GlobalMacros.h
//  iLive
//
//  Created by 李晓毅 on 16/3/15.
//  Copyright © 2016年 301 Studio. All rights reserved.
//

#ifndef GlobalMacros_h
#define GlobalMacros_h

/***************  屏幕 start   ****************/
#define SCREEN_BOUNDS ([UIScreen mainScreen].bounds)
#define SCREEN_WIDTH (SCREEN_BOUNDS.size.width)
#define SCREEN_HEIGHT (SCREEN_BOUNDS.size.height)
/***************  屏幕 end   ****************/

/***************  1px线的实际宽度 start   ****************/
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)
/***************  1px线的实际宽度 end   ****************/

/***************  颜色 start   ****************/
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//rgb颜色
#define UIColorFromRGBA(r,g,b,a)([UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)])
/***************  颜色 start   ****************/

#endif /* GlobalMacros_h */
