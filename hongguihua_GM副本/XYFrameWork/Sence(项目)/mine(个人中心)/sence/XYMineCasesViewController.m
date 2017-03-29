//
//  XYMineCasesViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYMineCasesViewController.h"

#import "XYStandardCell.h"
#import "XYMineCasesModel.h"
#import "XYMineCasesDetailViewController.h"


@interface XYMineCasesViewController ()

@property (nonatomic,strong) NSArray * titleArr;

@end

@implementation XYMineCasesViewController

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
    self.title = self.mainTitle;
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
    NSArray * pathArr = @[i_myleave,i_myreimburse,i_mygoout,i_mypositive,i_mytravel]; 
    [self xy_postWithValues:@{@"token":m_token,MPAGESIZE:m_pagesize,MPAGENUMBER:m_pagenumber} ModelType:[XYMineCasesModel class] Path:[pathArr safeObjectAtIndex:self.type] hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
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
    
    XYStandardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYStandardCell"];
    [cell.titleLabel setText:self.mainTitle];
//    if (self.logo) {
//        [cell.icon setImage:[UIImage imageNamed:self.logo]];
//    }
    if (self.mData.count) {
        cell.model = [self.mData safeObjectAtIndex:indexPath.section];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XYMineCasesDetailViewController * vc = [[XYMineCasesDetailViewController alloc] init];
    switch (self.type) {
        case 0:
            vc.type = 0;
            break;
        case 1:
            vc.type = 1;
            break;
        case 2:
            vc.type = 2;
            break;
        case 3:
            vc.type = 3;
            break;
        case 4:
            vc.type = 4;
            break;
            
        default:
            break;
    }
    if (self.mData.count) {
        vc.lModel = [self.mData safeObjectAtIndex:indexPath.row];
        
    }
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
