//
//  ILBaseNormalEditTableViewCell.m
//  iLive
//
//  Created by 李晓毅 on 16/3/28.
//  Copyright © 2016年 301 Studio. All rights reserved.
//

#import "ILBaseNormalEditTableViewCell.h"

@implementation ILBaseNormalEditTableViewCell

@synthesize textLabel = _textLabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
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
    
    _textField = [UITextField new];
    _textField.font = [UIFont systemFontOfSize:12];
    _textField.textAlignment = NSTextAlignmentLeft;
    _textField.layer.cornerRadius = 5;
    _textField.layer.borderWidth = SINGLE_LINE_WIDTH;
    _textField.layer.borderColor = UIColorFromRGBA(146, 168, 209, 1).CGColor;
    [self.contentView addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_textLabel.mas_right).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-8);
        make.height.equalTo(_textLabel.mas_height);
        make.centerY.equalTo(self.contentView);
    }];
    
    _textField.leftViewMode = UITextFieldViewModeAlways;
    _textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    _tipsButton = [[UIButton alloc] init];
    [_tipsButton setBackgroundColor:[UIColor redColor]];
    _textField.rightViewMode = UITextFieldViewModeAlways;
    _textField.rightView = _tipsButton;
}


@end
