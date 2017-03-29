//
//  XYMineViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#define iconHeight 250 * 0.5f
#import "XYMineViewController.h"

#import "XYStandardImageTitleCell.h"
#import "XYTitleCell2.h"
#import "XYSubmitCell.h"

#import "XYMineCasesViewController.h"
#import "XYSettingViewController.h"
#import "XYLoginViewController.h"


#import "XYPhotoSheet.h"

@interface XYMineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray * titleArr;
@property (nonatomic,strong) NSArray * photosArr;
@property (nonatomic,strong) XYPhotoSheet * photoSheet;



@end

@implementation XYMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

 
- (void)initData {
    _photoSheet = [[XYPhotoSheet alloc]init];
    self.titleArr = @[@"我的请假单",@"我的报销",@"我的外出",@"我的转正",@"我的出差"];
    self.photosArr = @[@"mine_图层-1",@"mine_图层-3",@"mine_图层-2",@"mine_图层-4",@"mine_图层-5"];
    [self.mTableView reloadData];

}

- (void)initUI {
    [super initUI];
    
}
- (void)initNavigationBar {
    [super initNavigationBar];
    self.title = @"个人中心";
}

- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self andStyle:UITableViewStyleGrouped ];
    [self.mTableView registerNib:@"XYStandardImageTitleCell"];
    [self.mTableView registerNib:@"XYTitleCell2"];
    [self.mTableView registerNib:@"XYSubmitCell"];
    
}

#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArr.count + 1 + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section ==0 ) {
        return iconHeight;
    }else if (indexPath.section == self.titleArr.count + 1 ) {
        return H_TABLECELLDEFAULTHEIGHT;
    }else {
        return 50.f;
    }

}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYWeakSelf
    XYStandardImageTitleCell *cell_it = [tableView dequeueReusableCellWithIdentifier:@"XYStandardImageTitleCell"];
    XYTitleCell2 * cell_itN = [tableView dequeueReusableCellWithIdentifier:@"XYTitleCell2"];
    XYSubmitCell *submitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"];
    if (indexPath.section == 0) {
        [cell_it.titleLabel setText:m_loginname];
        [cell_it.backGroundImageView setImage:[UIImage imageNamed:@"mine_backGround"]];
        [cell_it.iconImageView xy_setCornerRadius:(iconHeight - 40)* 0.5];
        [cell_it.iconImageView setUserInteractionEnabled:YES];
        [cell_it.iconImageView kSetImageWithURL:m_userModel.photo placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
        [cell_it.iconImageView bk_whenTapped:^{
            
            [_photoSheet xy_showActionSheetInView:weakSelf.view taget:self title1:@"相册" title2:@"相机" cancel:@"取消" success:^(UIImage *image) {
                [weakSelf xy_uploadPhotoWithValues:@{MTOKEN:m_token,@"photo":@""} Image:image modelType:nil Path:i_uploaduserpic Success:^(__kindof YTKBaseRequest *request, id model) {
                    m_userModel.photo = model;
                    [weakSelf.mTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
                } failure:^(NSString *msg, id model) {
                    
                }];
            }];
        }];
    
        return cell_it;
    }else if (indexPath.section == self.titleArr.count + 1){
        [submitCell setTitle:@"退出登录" titleColor:COLOR_WHITE backColor:COLOR_BLUE space:50.f enable:YES];
        XYWeakSelf
        submitCell.clickCellBtnBlock = ^(UIButton * btn) {
             [weakSelf signOut];
        };

        return submitCell;
    }else{
        [cell_itN showRight:NO topline:NO bottomline:NO jiantou:NO];
        if (self.titleArr.count) {
            [cell_itN.leftTitle setText:[self.titleArr safeObjectAtIndex:indexPath.section - 1]];
        }
        if (self.photosArr.count) {
            
            [cell_itN.leftImage setImage:[UIImage imageNamed:[self.photosArr safeObjectAtIndex:indexPath.section - 1]]];
        }
        return cell_itN;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
//        XYSettingViewController * vc = [[XYSettingViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
    }else{
        XYMineCasesViewController * vc = [[XYMineCasesViewController alloc] init];
        vc.mainTitle = [self.titleArr safeObjectAtIndex:indexPath.section - 1];
        vc.type = indexPath.section -1;
        vc.logo = [self.photosArr safeObjectAtIndex:indexPath.section - 1];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark -- tool
- (void)signOut {
    XYWeakSelf
    NSDictionary * dic = @{@"token":m_token};
    [self xy_postWithValues:dic ModelType:[XYModel class] Path:i_logout hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        [weakSelf signOutSuccess];
    } failure:^(NSString *msg, id model) {
        
    }];
}
- (void)signOutSuccess{
    [XYCenter removeAllLoginData];
    [XYLoginViewController login]; 
}



@end
