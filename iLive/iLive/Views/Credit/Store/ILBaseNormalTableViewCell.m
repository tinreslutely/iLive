//
//  ILBaseNormalTableViewCell.m
//  iLive
//
//  Created by 李晓毅 on 16/3/28.
//  Copyright © 2016年 301 Studio. All rights reserved.
//

#import "ILBaseNormalTableViewCell.h"

@implementation ILBaseNormalTableViewCell

@synthesize textLabel = _textLabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self initCell];
    }
    return self;
}

-(void)initCell{
    _textLabel = [UILabel new];
    _textLabel.font = [UIFont systemFontOfSize:12];
    _textLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_textLabel];
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 30));
        make.left.equalTo(self.contentView.mas_left).with.offset(8);
        make.centerY.equalTo(self.contentView);
    }];
    
    _tipsButton = [UIButton new];
    [self.contentView addSubview:_tipsButton];
    [_tipsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.equalTo(self.contentView.mas_right).with.offset(-8);
        make.centerY.equalTo(self.contentView);
    }];
    
    _textField = [UITextField new];
    _textField.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_textField.mas_right).with.offset(0);
        make.right.equalTo(_tipsButton.mas_left).with.offset(0);
        make.height.equalTo(_textLabel.mas_height);
        make.centerY.equalTo(self.contentView);
    }];
}

@end
