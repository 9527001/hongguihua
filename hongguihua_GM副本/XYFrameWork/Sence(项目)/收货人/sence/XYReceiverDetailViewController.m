//
//  XYReceiverDetailViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYReceiverDetailViewController.h"

#import "XYTextFieldDetailCell.h"
#import "XYTextFieldCell.h"
#import "XYSubmitCell.h"
#import "XYPhotosCell.h"
#import "XYSubmitSelectorCell.h"

#import "XYPickerViewModel.h"
#import "XYConfirmReceiveViewController.h"

@interface XYReceiverDetailViewController ()

@property (nonatomic,strong) NSArray * titleArr;
@property (nonatomic,strong) NSArray * placeHolderArr;
@property (nonatomic,strong) XYReceiversDetailModel * dataModel;

@end

@implementation XYReceiverDetailViewController

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
    self.title = @"收货详情";
}

- (void)initUI {
    [super initUI];
    self.titleArr = @[@[@"申请事由"],
                      @[@"水果等级",@"发货日期"],
                      @[@"名称"],
                      @[@"规格",@"件数",@"单位",@"价格"],
                      @[@"图片",@""],
                      @[@""],
                      ];
    self.placeHolderArr = @[@[@"请输入申请事由"],
                            @[@"请选择类型",@"请选择选择交付日期"],
                            @[@"请输入名称"],
                            @[@"",@"",@"",@"",@""],
                            @[@""],
                            ];
    self.dataModel = [[XYReceiversDetailModel alloc] init];
    
}
- (void)initData {
    [super initData];
}
- (void)initNet {
    [super initNet];
    [self xy_postWithValues:@{MID:self.lModel.xyid} ModelType:[XYReceiversDetailModel class] Path:i_getgoodsdetail hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[XYReceiversDetailModel class]]) {
            self.dataModel = model;
            [self.mTableView reloadData];
            
        }
    } failure:^(NSString *msg, id model) {
        
    }];
}
- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self frame:self.view.bounds];
    self.mTableView.showsVerticalScrollIndicator = NO;
    [self.mTableView registerNib:@"XYTextFieldCell"];
    [self.mTableView registerNib:@"XYSubmitCell"];
    [self.mTableView registerNib:@"XYPhotosCell"];
    
    [self.mTableView.tableFooterView setBackgroundColor:[UIColor clearColor]];
}

#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self.titleArr safeObjectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == self.titleArr.count -1 ) {
        if ([self.lModel.sendstatus isEqualToString:@"2"]) {//已收货
            return 0;
        }
        return 60.f;
    }
    if (indexPath.section == 4 && indexPath.row == 1) {
        return [XYPhotosCell cellHeight];
    }
    return H_TABLECELLDEFAULTHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 1 ||section == 3||section == 4 || section == 5) {
        return 20.f;
    }
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYTextFieldCell *cell_tf = [tableView dequeueReusableCellWithIdentifier:@"XYTextFieldCell"];
    XYSubmitCell *submitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"];
    XYPhotosCell *cell_photo = [tableView dequeueReusableCellWithIdentifier:@"XYPhotosCell"];
    XYWeakSelf
    if (self.titleArr.count&&self.placeHolderArr.count) {
        [cell_tf.leftLabel setText:[[self.titleArr safeObjectAtIndex:indexPath.section] safeObjectAtIndex:indexPath.row]];
        [cell_tf.rightTextField setPlaceholder:[[self.placeHolderArr safeObjectAtIndex:indexPath.section] safeObjectAtIndex:indexPath.row]];
    }
    switch (indexPath.section) {
        case 0:
        {
            [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            [cell_tf setModel:@"暂无" IndexPath:indexPath callBack:nil];
            return cell_tf;
        }
            break;
        case 1:
        {
            [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            switch (indexPath.row) {
                case 0:
                {
                    [cell_tf.rightTextField setText:self.dataModel.grade];
                }
                    break;
                case 1:
                {
                    [cell_tf.rightTextField setText:self.dataModel.addtime];
                }
                    break;
                default:
                    break;
            }
            return cell_tf;
        }
            break;
        case 2:
        {
            [cell_tf showtopline:YES bottomline:YES jiantou:NO];
            [cell_tf.rightTextField endEditing:YES];
            [cell_tf.rightTextField setText:self.dataModel.name];
            return cell_tf;
        }
            break;
        case 3:
        {
            [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            if (self.dataModel) {
                [cell_tf setModel:self.dataModel IndexPath:indexPath callBack:nil];
            }
            
            return cell_tf;
        }
            break;
        case 4:
        {
            if (indexPath.row == 0) {
                [cell_tf showtopline:YES bottomline:YES jiantou:NO];
                return cell_tf;
            }else{
                
                if ([self.dataModel.photos isKindOfClass:[NSString class]]) {
                    
                    NSArray * arr = [self.dataModel.photos componentsSeparatedByString:@","];
    
                    [cell_photo setModel:arr IndexPath:indexPath callBack:nil];
                    
                }
                return cell_photo;
            }
        }
            break;
        default:
        {
            [submitCell setTitle:@"确认收货" titleColor:COLOR_WHITE backColor:COLOR_BLUE space:50 enable:YES callBack:^(id x) {
                
                [weakSelf submit:nil]; 
            }];
     
            return submitCell;
        }
            break;
    }
}
#pragma mark -- tool
-(void)submit:(NSString *)status {
    XYConfirmReceiveViewController * vc = [[XYConfirmReceiveViewController alloc] init];
    if (self.dataModel) {
        vc.lModel = self.dataModel;
        [self.navigationController pushViewController:vc animated:YES];
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
