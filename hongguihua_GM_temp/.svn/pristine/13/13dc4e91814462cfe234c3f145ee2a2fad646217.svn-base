//
//  YDSaleNewVC.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/26.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "YDSaleNewVC.h"

#import "YDSaleListNewVC.h"

#import "XYTextFieldCell.h"
#import "XYSubmitCell.h"
#import "XYPhotosCell.h"
#import "YDProductTCell.h"

#import "XYSaleModel.h"
#import "XYSenderModel.h"

#import "XYPickerViewModel.h"

@interface YDSaleNewVC ()

@property (nonatomic,strong) NSMutableArray * titleArr;
@property (nonatomic,strong) NSMutableArray * placeHolderArr;
@property (nonatomic,strong) NSMutableArray * dataArr;

@property (nonatomic,strong) XYSaleModel * dataModel;

@end

@implementation YDSaleNewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 
- (void)initUI {
    [super initUI];
    
    self.titleArr = [NSMutableArray arrayWithArray:@[@[@"车次",],
                                                     @[@"品相规格选择"],
                                                     @[@""],
//                                                     @[@"确认发货"],
                                                     ]];
    
    self.placeHolderArr = [NSMutableArray arrayWithArray:@[@[@"请选择车次"],
                                                           @[@""],
                                                           @[@""],
//                                                           @[@""],
                                                           ]];
    
}

- (void)initNet {
    XYWeakSelf
    [self xy_postWithValues:@{MTOKEN:m_userModel.token} ModelType:[XYSaleModel class] Path:i_get_shipment_carnum_list hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
//        weakSelf.dataModel = model;
        weakSelf.mData = model;
    } failure:^(NSString *msg, id model) {
        
    }];
}
- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self frame:self.view.bounds];
    self.mTableView.showsVerticalScrollIndicator = NO;
    [self.mTableView registerNib:@"XYTextFieldCell"];
    [self.mTableView registerNib:@"XYSubmitCell"];
    [self.mTableView registerNib:@"YDProductTCell"];
    
    [self.mTableView.tableFooterView setBackgroundColor:[UIColor clearColor]];
}

#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 2:
            return self.dataModel.shipment_detail.count;
            break;
        default:
        {
            if ([self.titleArr isKindOfClass:[NSArray class]]) {
                if ([[self.titleArr safeObjectAtIndex:section] isKindOfClass:[NSArray class]]) {
                    return [[self.titleArr safeObjectAtIndex:section] count];
                }
            }
            return 0;
        }
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == self.titleArr.count - 1 ) {
        return 50.f;
    }
    return H_TABLECELLDEFAULTHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return section == 2 ? 20.f : 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYTextFieldCell *cell_tf = [tableView dequeueReusableCellWithIdentifier:@"XYTextFieldCell"];
    XYSubmitCell *SubmitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"];
    YDProductTCell *cell_product = [tableView dequeueReusableCellWithIdentifier:@"YDProductTCell"];
 
    NSArray * titleArr_temp = [self.titleArr safeObjectAtIndex:indexPath.section];
    NSArray * placeHolderArr_temp = [self.placeHolderArr safeObjectAtIndex:indexPath.section];
    NSString * title = [titleArr_temp safeObjectAtIndex:indexPath.row];
    NSString * placeHolder = [placeHolderArr_temp safeObjectAtIndex:indexPath.row];
    [cell_tf.leftLabel setText:title];
    [cell_tf.rightTextField setPlaceholder:placeHolder];
    [cell_tf.rightTextField setPlaceholder:placeHolder];
    
    switch (indexPath.section) {
        case 0:
        {
            [cell_tf showtopline:NO bottomline:NO jiantou:NO];
            [cell_tf.rightTextField setEnabled:NO];
            [cell_tf.rightTextField setText:self.dataModel.car_num];
            return cell_tf;
        }
            break;
        case 1:
        {
            [cell_tf showtopline:YES bottomline:NO jiantou:NO];
            [cell_tf.rightTextField setEnabled:NO];
            [cell_tf setModel:self.dataModel.receiver_time IndexPath:indexPath callBack:nil];
            return cell_tf;
        }
            break;
        case 2:
        {
             
            [cell_product showUp:YES down:NO];
            [cell_product.arrowImageView setHidden:NO];
            XYSenderProductModel * dataModel = [self.dataModel.shipment_detail safeObjectAtIndex:indexPath.row ];
            NSString * content = [NSString stringWithFormat:@"%ld %@ %@ %@件 %@元",indexPath.row + 1,dataModel.pname,dataModel.level_name,dataModel.realNum,dataModel.cost];
            [cell_product.titleLabel setText:content];
            return cell_product;
        }
            break;
        default:
        {
            [SubmitCell setTitle:title titleColor:COLOR_WHITE backColor:COLOR_BLUE space:50.f enable:YES];
          
            
            return SubmitCell;
        }
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    XYWeakSelf
    NSString * title = [[self.placeHolderArr safeObjectAtIndex:indexPath.section] safeObjectAtIndex:indexPath.row];
    switch (indexPath.section) {
        case 0:
        {
            if (self.mData.count == 0) {
                [DialogUtil showDlgAlert:@"暂无可选车次"];
                return;
            }
            NSMutableArray * arr_temp = [NSMutableArray array];
            for (XYSaleModel * model in self.mData) {
                XYPickerViewModel * model_temp = [[XYPickerViewModel alloc]init];
                model_temp.xyid = model.xyid;
                model_temp.name = model.car_num;
                [arr_temp addObject:model_temp];
            }
            
            [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title andIndexPath:indexPath andDataArr:@[arr_temp] type:PickerTypeModelNeedIndex XYZBlock:^(id x, NSNumber * y, NSIndexPath * indexPath) {
             
                weakSelf.dataModel = [self.mData safeObjectAtIndex:[y integerValue]];
                [weakSelf.mTableView reloadData];
            }];
 

        }
            break;
        case 2:
        {
            YDSaleListNewVC * VC = [[YDSaleListNewVC alloc] init];
            VC.model = self.dataModel;
            VC.index = indexPath.row;
            XYWeakSelf
            VC.callBack = ^(XYSaleModel * model,NSInteger index) {
                weakSelf.dataModel = model;
                [weakSelf.mTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:2]] withRowAnimation:UITableViewRowAnimationAutomatic];
            };
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        default:
            break;
    }
}
 


@end
