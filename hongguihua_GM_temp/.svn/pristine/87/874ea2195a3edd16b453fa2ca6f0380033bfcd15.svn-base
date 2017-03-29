//
//  XYMessageListViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/7.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYMessageListViewController.h"

#import "XYMessageListCell.h"
#import "XYTableViewHeaderFooterView.h"

#import "XYMessageDetailViewController.h"

@interface XYMessageListViewController ()

@end

@implementation XYMessageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initFresh];
}
- (void)initFresh {
    [super initFresh];
}
  
- (void)initNavigationBar {
    [super initNavigationBar];
}

- (void)initNet {
    [super initNet];
    /**
     *  
     id     列表id
     photos 商品图片
     addtime提交时间
     name  商品名称
     reasons 事由
     */
    XYWeakSelf
    [self xy_getWithValues:@{@"token":m_token,MPAGESIZE:m_pagesize,MPAGENUMBER:m_pagenumber} ModelType:[XYMessageListModel class] Path:i_productmessagelist hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[NSArray class]]) {
            [weakSelf sucessData:model];
        }
    } failure:^(NSString *msg, id model) {
        
    }];
}
- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self frame:self.view.bounds];
    [self.mTableView registerNib:@"XYMessageListCell"];
    [XYTableViewHeaderFooterView  registerClass:self.mTableView];
}


#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.mData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    return [XYMessageListCell whc_CellHeightForIndexPath:indexPath tableView:tableView] + 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYMessageListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYMessageListCell"];
    
    if (self.mData.count) {
        XYMessageListModel *model = [self.mData safeObjectAtIndex:indexPath.section];
        [cell setModel:model IndexPath:indexPath callBack:nil];
    }
    return cell;
}

#pragma mark -- HeaderFooterViewReusable
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.mData.count) {
        XYMessageListModel *model = [self.mData safeObjectAtIndex:indexPath.section];
        XYMessageDetailViewController * vc = [[XYMessageDetailViewController alloc] init];
        vc.title = @"消息详情";
        vc.lModel = model;
        [self.navigationController pushViewController:vc animated:YES];
     }
    
}


@end
