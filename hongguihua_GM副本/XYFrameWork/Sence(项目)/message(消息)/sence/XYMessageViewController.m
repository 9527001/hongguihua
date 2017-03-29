//
//  XYMessageViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYMessageViewController.h"

#import "XYStandardCell.h"

#import "XYMessageListViewController.h"
#import "XYMineCasesViewController.h"
#import "XYMessageReceiveDeliverVC.h"

@interface XYMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray * titleArr;

@end

@implementation XYMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
 

- (void)initNavigationBar {
    [super initNavigationBar];
    self.title = @"消息";
    self.titleArr = @[@"我的请假单",@"我的报销",@"我的外出",@"我的转正",@"我的出差"];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    XYWeakSelf
    [self xy_postWithValues:@{@"token":m_token} ModelType:[XYMessageCaseModel class] Path:i_ismessage hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[XYMessageCaseModel class]]) {
            //status 1:有未读；2：没有未读；
            XYMessageCaseModel * newMessageModel = model;
            if ([@"1" isEqualToString:newMessageModel.status] ) {
                weakSelf.navigationController.tabBarItem.badgeValue = @"new";
            }else{
                weakSelf.navigationController.tabBarItem.badgeValue = nil;
            }
        }
    } failure:^(NSString *msg, id model) {
        
    }];
}
- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self frame:self.view.bounds];
    [self.mTableView registerNib:@"XYStandardCell"];
}
- (void)initData {
    [super initData];
}
- (void)initDataMultiple {
    [super initDataMultiple];
    XYWeakSelf
    [self xy_postWithValues:@{@"token":m_token} ModelType:[XYMessageCaseModel class] Path:i_message hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        [weakSelf.mData removeAllObjects];
        if ([model isKindOfClass:[NSArray class]]) {
            weakSelf.mData = [NSMutableArray arrayWithArray:model];
         }
//        if (weakSelf.mData.count) {
//            weakSelf.navigationController.tabBarItem.badgeValue = @"new";
// 
//        }else{
//            weakSelf.navigationController.tabBarItem.badgeValue = nil;
// 
//        }
         [weakSelf.mTableView reloadData];
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
    
    return 60;
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
        XYMessageListModel * model = [self.mData safeObjectAtIndex:indexPath.row];
        [cell setModel:model IndexPath:indexPath callBack:nil];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.mData.count) {
        XYMessageCaseModel * model = [self.mData safeObjectAtIndex:indexPath.row];
        NSString *count = model.type;//1:商品审核;2:请假;3:报销；4：出差；5：外出；6：转正 7 发货 8 收货 9销售消息
        switch ([count integerValue]) {
            case 1:
            {
                XYMessageListViewController * vc = [[XYMessageListViewController alloc] init];
                vc.title = @"消息列表";
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:
            {
                [self jumpOA:0];
            }
                break;
            case 3:
            {
                [self jumpOA:1];
            }
                break;
            case 4:
            {
                [self jumpOA:4];
            }
                break;
            case 5:
            {
                [self jumpOA:2];
            }
                break;
            case 6:
            {
                [self jumpOA:3];
            }
                break;
            case 7://发货
            {
                
                XYMessageReceiveDeliverVC * vc = [[XYMessageReceiveDeliverVC alloc] initWithType:develiverType];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 8://收
            {
                
                XYMessageReceiveDeliverVC * vc = [[XYMessageReceiveDeliverVC alloc] initWithType:receiveType];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 9://销售消息
            {
                
                XYMessageReceiveDeliverVC * vc = [[XYMessageReceiveDeliverVC alloc] initWithType:saleType];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
                
            default:
                break;
        }
    }
    
}
- (void)jumpOA:(NSInteger )type {
    /**
     sskForLeave, //请假
     submitAnExpenseAccount, //报销
     outside, //外出
     positive, //转正
     onABusinessTrip, //出差
     */
    XYMineCasesViewController * vc = [[XYMineCasesViewController alloc] init];
    vc.mainTitle = [self.titleArr safeObjectAtIndex:type];
    vc.type = type;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
