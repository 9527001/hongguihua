//
//  XYCheckListViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/17.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYCheckListViewController.h"

#import "XYStandardCell.h"

#import "XYCheckListDetailViewController.h"

@interface XYCheckListViewController ()

@property (nonatomic,strong) NSArray * titleArr;

@end

@implementation XYCheckListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initFresh];
}
- (void)initFresh {
    [super initFresh];
}
 
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initNet];
}


- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self frame:self.view.bounds];
    [self.mTableView registerNib:@"XYStandardCell"];
}

- (void)initData {
    [super initData];
}
- (void)initNet {
    [super initNet];
    XYWeakSelf
    [self xy_postWithValues:@{MPAGESIZE:m_pagesize,MPAGENUMBER:m_pagenumber} ModelType:[XYControlModel class] Path:i_checklist hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
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
    
    XYStandardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYStandardCell"];
     
    if (self.mData.count) {
        XYControlModel * model = [self.mData safeObjectAtIndex:indexPath.row];
        [cell setGearalModel:model];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XYCheckListDetailViewController * vc = [[XYCheckListDetailViewController alloc] init];
    if (self.mData.count) {
        vc.lModel = [self.mData safeObjectAtIndex:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

 

@end
