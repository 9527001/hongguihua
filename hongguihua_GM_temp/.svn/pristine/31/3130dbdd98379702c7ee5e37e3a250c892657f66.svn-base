//
//  XYSettingViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYSettingViewController.h"

#import "XYTitleCell1.h"
#import "XYSubmitCell.h"

#import "XYNicknameViewController.h"

@interface XYSettingViewController ()

@property (nonatomic,strong) NSArray * titleArr;

@end

@implementation XYSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initNavigationBar {
    [super initNavigationBar];
    self.title = @"设置";
}

- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self andStyle:UITableViewStyleGrouped];
    [self.mTableView registerNib:@"XYTitleCell1"];
    [self.mTableView registerNib:@"XYSubmitCell"];
}
- (void)initData {
    self.titleArr = @[@"头像",@"昵称"];
    [self.mTableView reloadData];
}

#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.titleArr.count;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return H_TABLECELLDEFAULTHEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYTitleCell1 *TitleCell = [tableView dequeueReusableCellWithIdentifier:@"XYTitleCell1"];
    XYSubmitCell *SubmitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"];
    if (indexPath.section == 0) {
        [TitleCell showLeft:YES right:NO topline:NO bottomline:YES jiantou:YES];
        [TitleCell.leftTitle setText:[self.titleArr safeObjectAtIndex:indexPath.row]];
        if (indexPath.row == self.titleArr.count - 1) {
            [TitleCell showLeft:YES right:NO topline:NO bottomline:NO jiantou:YES];
        }
        return TitleCell;
    }else{
        [SubmitCell setTitle:@"退出登录" titleColor:COLOR_WHITE backColor:COLOR_BLUE space:50.f enable:YES];
        XYWeakSelf
        SubmitCell.clickCellBtnBlock = ^(UIButton * btn) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        };
      return SubmitCell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section ==1) {
        return 50.f;
    }
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            XYNicknameViewController * vc = [[XYNicknameViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
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
