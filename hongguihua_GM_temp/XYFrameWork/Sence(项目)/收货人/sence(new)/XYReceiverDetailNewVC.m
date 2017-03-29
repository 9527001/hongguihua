//
//  XYReceiverDetailNewVC.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#define MAXCOUNT 5

#import "XYReceiverDetailNewVC.h"

#import "XYTextFieldCell.h"
#import "XYSubmitCell.h" 
#import "YDProductTCell.h"

#import "XYConfirmReceiveNewVC.h"


@interface XYReceiverDetailNewVC ()

@property (nonatomic,strong) NSMutableArray * titleArr;
@property (nonatomic,strong) XYReceiversDetailModel * dataModel;

@end

@implementation XYReceiverDetailNewVC

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
    
    self.titleArr = [NSMutableArray arrayWithArray:@[@[@"到货车次",@"发货地",@"发货日期"],
                                                     @[@"到货明细",],
                                                     @[@"确认收货"],
                                                     ]];
     
 
}

- (void)initNet {
    [super initNet];
    [self xy_postWithValues:@{MTOKEN:m_userModel.token,@"shipment_id":self.lModel.xyid} ModelType:[XYReceiversDetailModel class] Path:i_get_shipment_byid hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
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
    [self.mTableView registerNib:@"YDProductTCell"];
    
    [self.mTableView.tableFooterView setBackgroundColor:[UIColor clearColor]];
}

#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  
    return [self.lModel.status isEqualToString:@"-1"] ? self.titleArr.count : self.titleArr.count - 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 1:
            return 1 + (self.dataModel.shipment_detail ? self.dataModel.shipment_detail.count : 0 );
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
    
    return 20.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYTextFieldCell *cell_tf = [tableView dequeueReusableCellWithIdentifier:@"XYTextFieldCell"];
    XYSubmitCell *SubmitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"];
    YDProductTCell *cell_product = [tableView dequeueReusableCellWithIdentifier:@"YDProductTCell"];
    
    NSArray * titleArr_temp = [self.titleArr safeObjectAtIndex:indexPath.section];
    NSString * title = [titleArr_temp safeObjectAtIndex:indexPath.row];
    [cell_tf.leftLabel setText:title];
    
    
    XYWeakSelf
    switch (indexPath.section) {
        case 0:
        {
            [cell_tf showtopline:(indexPath.row == 0 ? NO : YES) bottomline:NO jiantou:NO];
            [cell_tf.rightTextField setEnabled:NO];
            switch (indexPath.row ) {
                case 0:
                {
                    [cell_tf setModel:self.dataModel.car_num IndexPath:indexPath callBack:nil];
                }
                    break;
                case 1:
                {
                    [cell_tf setModel:self.dataModel.sname IndexPath:indexPath callBack:nil];
                }
                    break;
                case 2:
                {
                    [cell_tf setModel:self.dataModel.ship_time IndexPath:indexPath callBack:nil];
                }
                    break;
                    
                default:
                    break;
            }
            return cell_tf;
        }
            break;
        case 1:
        {
            if (indexPath.row == 0) {
                [cell_tf showtopline:NO bottomline:NO jiantou:NO];
                [cell_tf.rightTextField setEnabled:NO];
                return cell_tf;
            }else{
                [cell_product showUp:YES down:NO];
                XYSenderProductModel * dataModel = [self.dataModel.shipment_detail safeObjectAtIndex:indexPath.row - 1];
                NSString * content = [NSString stringWithFormat:@"%ld %@ %@ %@件 %@元",indexPath.row,dataModel.pname,dataModel.level_name,dataModel.num,dataModel.cost];
                [cell_product.titleLabel setText:content];
                return cell_product;
            }
            
        }
            break;
        default:
        {
            [SubmitCell setTitle:title titleColor:COLOR_WHITE backColor:COLOR_BLUE space:50.f enable:YES];
            
            SubmitCell.clickCellBtnBlock = ^(UIButton * btn) {
                
                [weakSelf submit:nil];
            };
            
            return SubmitCell;
        }
            break;
    }
}


#pragma mark -- tool
-(void)submit:(NSString *)status {
    XYConfirmReceiveNewVC * vc = [[XYConfirmReceiveNewVC alloc] init];
    if (self.dataModel) {
        vc.dataModel = self.dataModel;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
