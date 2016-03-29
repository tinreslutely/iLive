//
//  ILCreditStoreViewController.m
//  iLive
//  信用机构
//  Created by 李晓毅 on 16/3/22.
//  Copyright © 2016年 301 Studio. All rights reserved.
//

#import "ILCreditStoreViewController.h"

@interface ILCreditStoreViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ILCreditStoreViewController{
    __strong UITableView *_mainTableView;
}

#pragma mark life cycle
-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self initView];
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    return cell;
}

#pragma mark UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 0;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
}



#pragma mark private methods
-(void)initView{
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [_mainTableView setDataSource:self];
    [_mainTableView setDelegate:self];
    [self.view addSubview:_mainTableView];
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsZero);
    }];
    [_mainTableView bringSubviewToFront:self.view];
}

@end
