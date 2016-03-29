//
//  ILCreditStoreDetailViewController.m
//  iLive
//
//  Created by 李晓毅 on 16/3/28.
//  Copyright © 2016年 301 Studio. All rights reserved.
//

#import "ILCreditStoreDetailViewController.h"
#import "ILBaseNormalEditTableViewCell.h"
#import "TPKeyboardAvoidingTableView.h"

@interface ILCreditStoreDetailViewController()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ILCreditStoreDetailViewController{
    TPKeyboardAvoidingTableView *_mainTableView;
    
    
}


#pragma mark life cycle
-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self initView];
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    switch (indexPath.row) {
        case 0://机构名称
        {
            static NSString *orgNamecellIdentifier = @"orgNameCell";
            cell = [tableView dequeueReusableCellWithIdentifier:orgNamecellIdentifier];
            if(cell == nil){
                cell = [[ILBaseNormalEditTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orgNamecellIdentifier];
                cell.textLabel.text = @"机构名称";
            }
        }
            break;
        case 1://信用总额度
        {
            static NSString *creditLineCellIdentifier = @"creditLineCell";
            cell = [tableView dequeueReusableCellWithIdentifier:creditLineCellIdentifier];
            if(cell == nil){
                cell = [[ILBaseNormalEditTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:creditLineCellIdentifier];
                cell.textLabel.text = @"信用总额度";
            }
        }
            break;
        case 2://可用额度
        {
            static NSString *useCreditLineCellIdentifier = @"useCreditLineCell";
            cell = [tableView dequeueReusableCellWithIdentifier:useCreditLineCellIdentifier];
            if(cell == nil){
                cell = [[ILBaseNormalEditTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:useCreditLineCellIdentifier];
                cell.textLabel.text = @"可用额度";
            }
        }
            break;
        case 3://提交
        {
            static NSString *submitCellIdentifier = @"submitCell";
            cell = [tableView dequeueReusableCellWithIdentifier:submitCellIdentifier];
            if(cell == nil){
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:submitCellIdentifier];
                UIButton *button = [[UIButton alloc] init];
                [button setTitle:@"提交" forState:UIControlStateNormal];
                [button setBackgroundColor:SUBJECTCOLOR];
                button.layer.cornerRadius = 5;
                [cell.contentView addSubview: button];
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(cell.contentView).with.insets(UIEdgeInsetsMake(5, 8, 5, 8));
                }];
            }
        }
            break;
    }
    return cell;
}

#pragma mark UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    ILBaseNormalEditTableViewCell *editCell = (ILBaseNormalEditTableViewCell*)cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
}

#pragma mark private methods
-(void)initView{
    self.navigationItem.title = @"卡";
    
    _mainTableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [_mainTableView setDataSource:self];
    [_mainTableView setDelegate:self];
    [_mainTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_mainTableView];
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    [_mainTableView bringSubviewToFront:self.view];
}

@end
