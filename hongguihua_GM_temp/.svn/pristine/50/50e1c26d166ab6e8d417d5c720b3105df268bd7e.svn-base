//
//  XYReceiverViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYReceiverViewController.h"


#import "XYReceiveTCell.h"

#import "XYReceiverDetailViewController.h"
#import "XYReceiverDetailNewVC.h"

@interface XYReceiverViewController ()

@end

@implementation XYReceiverViewController

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
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initNet];
}

 

- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self frame:self.view.bounds];
    [self.mTableView registerNib:@"XYReceiveTCell"];
}

- (void)initData {
    [super initData];
}
- (void)initNet {
    [super initNet];
    XYWeakSelf
    [self xy_postWithValues:@{MTOKEN:m_token,MPAGENUMBER:m_pagenumber,MPAGESIZE:m_pagesize} ModelType:[XYReceiverModel class] Path:i_get_shipment_list hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[NSArray class]]) {
           [weakSelf sucessData:model];
        }
    } failure:^(NSString *msg, id model) {
        
    }];
}
#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.mData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYReceiveTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYReceiveTCell"];
    [cell.seperatorLine setHidden:(indexPath.row == 0 ? YES : NO)];
    XYReceiverModel * model = [self.mData safeObjectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XYReceiverDetailNewVC * vc = [[XYReceiverDetailNewVC alloc] init];
    if (self.mData.count) {
        XYReceiverModel * model = [self.mData safeObjectAtIndex:indexPath.row]; 
        vc.lModel = model;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
