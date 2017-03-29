//
//  XYProductListViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/18.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYProductListViewController.h"

#import "XYPorductCell.h"

@interface XYProductListViewController ()

@end

@implementation XYProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initFresh];
}
- (void)initFresh {
    [super initFresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initNavigationBar {
    [super initNavigationBar];
    self.title = @"发货列表";
}

- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self frame:self.view.bounds];
    [self.mTableView registerNib:@"XYPorductCell"];
}

- (void)initData {
    [super initData];
}
- (void)initNet {
    [super initNet];
    XYWeakSelf
    [self xy_postWithValues:@{MPAGENUMBER:m_pagenumber,MPAGESIZE:m_pagesize} ModelType:[XYSendProductModel class] Path:i_sendgoodslist hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[NSArray class]]) {
            [weakSelf sucessData:model];
        }
    } failure:^(NSString *msg, id model) {
        
    }];
}
#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.mData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYPorductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYPorductCell"];
    
    if (self.mData.count) {
        XYSendProductModel * model = [self.mData safeObjectAtIndex:indexPath.section];
        [cell setGearalModel:model];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.mData.count) {
        if (self.block) {
            self.block([self.mData safeObjectAtIndex:indexPath.section]);
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}
 

@end
