//
//  ILCreditStoreDetailModel.h
//  iLive
//
//  Created by 李晓毅 on 16/3/29.
//  Copyright © 2016年 301 Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILCreditStoreDetailModel : NSObject


@property(nonatomic,assign) int id;
@property(nonatomic,strong) NSString* orgName;
@property(nonatomic,strong) NSString* orgCode;
@property(nonatomic,assign) float creditLine;
@property(nonatomic,assign) float userCreditLine;
@property(nonatomic,strong) NSDate *createTime;
@property(nonatomic,strong) NSDate *modifyTime;


@end
