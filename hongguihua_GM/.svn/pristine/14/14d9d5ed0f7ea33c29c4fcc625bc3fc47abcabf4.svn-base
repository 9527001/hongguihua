//
//  XYNicknameViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYNicknameViewController.h"

#import "XYTextFieldOnlyCell.h"
#import "XYSubmitCell.h"

@interface XYNicknameViewController ()

@end

@implementation XYNicknameViewController

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
    self.title = @"昵称";
}

- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self andStyle:UITableViewStyleGrouped];
    [self.mTableView registerNib:@"XYTextFieldOnlyCell"];
    [self.mTableView registerNib:@"XYSubmitCell"];
}
- (void)initData {
    [self.mTableView reloadData];
}

#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        return H_TABLECELLDEFAULTHEIGHT;
    
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYTextFieldOnlyCell *TFCell = [tableView dequeueReusableCellWithIdentifier:@"XYTextFieldOnlyCell"];
    XYSubmitCell *SubmitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"];
    if (indexPath.section == 0) {
        [TFCell.inputTF setPlaceholder:@"请输入昵称"];
        return TFCell;
    }else{
        [SubmitCell setTitle:@"保存" titleColor:COLOR_WHITE backColor:COLOR_BLUE space:50.f enable:YES];
        XYWeakSelf
        SubmitCell.clickCellBtnBlock = ^(UIButton * btn) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        };
        return SubmitCell;
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
