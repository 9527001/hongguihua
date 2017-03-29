//
//  XYMessageDetailViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/7.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYMessageDetailViewController.h"

#import "XYMessageDetailCell.h"

@interface XYMessageDetailViewController ()
@property (nonatomic,strong) XYMessageListDetailModel * dataModel;
@end

@implementation XYMessageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)initNavigationBar {
    [super initNavigationBar];
}

- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self frame:self.view.bounds];
    [self.mTableView registerNib:@"XYMessageDetailCell"];
    
}
- (void)initNet {
    [super initNet]; 
    XYWeakSelf
    if (self.lModel) {
        [self xy_getWithValues:@{@"token":m_token,MID:self.lModel.xyid} ModelType:[XYMessageListDetailModel class] Path:i_productmessagedetail hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
            if ([model isKindOfClass:[NSArray class]]) {
                XYMessageListDetailModel * dataModel = [model firstObject];
                self.dataModel = dataModel;
                [weakSelf.mTableView reloadData];
            }
            if ([model isKindOfClass:[XYMessageListDetailModel class]]) {
                self.dataModel = model;
            }
        } failure:^(NSString *msg, id model) {
            
        }];
    }
    
}
#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return [XYMessageDetailCell whc_CellHeightForIndexPath:indexPath tableView:tableView] + 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section { 
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYMessageDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYMessageDetailCell"];
    if (self.dataModel) {
        [cell setGearalModel:self.dataModel];
    }
    
    return cell;
}
@end
