//
//  YDSaleListNewVC.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/26.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//
 #import "YDSaleListNewVC.h"

#import "XYTextFieldCell.h"
#import "XYSubmitCell.h"
#import "YDProductTCell.h"

@interface YDSaleListNewVC ()

@property (nonatomic,strong) NSMutableArray * titleArr;
@property (nonatomic,strong) NSMutableArray * placeHolderArr;

@property (nonatomic,strong) NSString * currentNum;
@property (nonatomic,strong) NSString * currentPrice;

@end

@implementation YDSaleListNewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)initNavigationBar {
    [super initNavigationBar];
    self.title = @"出售信息";
}

- (void)initUI {
    [super initUI];
    
    
    self.titleArr = [NSMutableArray arrayWithArray:@[@[@""],
                                                     @[@"出售单价",@"出售件数",],
                                                     @[@"剩余件数"],
                                                     @[@"确认"],
                                                     ]];
    
    self.placeHolderArr = [NSMutableArray arrayWithArray:@[@[@"",],
                                                           @[@"请输入出售单价",@"请输入出售件数",],
                                                           @[@""],
                                                           @[@""],
                                                           ]];
    
}
- (void)initData {
    [super initData];
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
    if ([self.titleArr isKindOfClass:[NSArray class]]) {
        if ([[self.titleArr safeObjectAtIndex:section] isKindOfClass:[NSArray class]]) {
            return [[self.titleArr safeObjectAtIndex:section] count];
        }
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == self.titleArr.count - 1 ) {
        return 50.f;
    }
    return H_TABLECELLDEFAULTHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return (section == 0 || section == 2) ? 10.f : 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYTextFieldCell *cell_tf = [tableView dequeueReusableCellWithIdentifier:@"XYTextFieldCell"];
    XYSubmitCell *SubmitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"];
    YDProductTCell *cell_product = [tableView dequeueReusableCellWithIdentifier:@"YDProductTCell"];
    XYWeakSelf
    NSArray * titleArr_temp = [self.titleArr safeObjectAtIndex:indexPath.section];
    NSArray * placeHolderArr_temp = [self.placeHolderArr safeObjectAtIndex:indexPath.section];
    NSString * title = [titleArr_temp safeObjectAtIndex:indexPath.row];
    NSString * placeHolder = [placeHolderArr_temp safeObjectAtIndex:indexPath.row];
    [cell_tf.leftLabel setText:title];
    [cell_tf.rightTextField setPlaceholder:placeHolder];
    
    XYSenderProductModel * model = [self.model.shipment_detail safeObjectAtIndex:self.index];
    
    switch (indexPath.section) {
        case 0:
        {
            [cell_product showUp:NO down:NO];
            NSString * content = [NSString stringWithFormat:@"%ld %@ %@ %@件 %@元",self.index + 1,model.product,model.level_name,model.realNum,model.cost];
            [cell_product.titleLabel setText:content];
            return cell_product;
        }
            break;
        case 1:
        {
            [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            [cell_tf.rightTextField setEnabled:YES];
            switch (indexPath.row) {
                case 0:
                {
                    cell_tf.tfType = demical;
                    cell_tf.isMax = NO;
                    [cell_tf setModel:self.currentPrice IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.currentPrice = x;
                    }];
                }
                    break;
                case 1:
                {
                    cell_tf.tfType = pureNumber;
                    cell_tf.isMax = YES;
                    cell_tf.maxCount = [model.realNum integerValue];
                    [cell_tf setModel:self.currentNum IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.currentNum = x;
                    }];
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
            [cell_tf showtopline:NO bottomline:NO jiantou:NO];
            [cell_tf.rightTextField setEnabled:NO];
             [cell_tf setModel:model.realNum IndexPath:indexPath callBack:nil];
            
            return cell_tf;
        }
            break;
        default:
        {
            [SubmitCell setTitle:title titleColor:COLOR_WHITE backColor:COLOR_BLUE space:50.f enable:YES];
            XYWeakSelf
            SubmitCell.clickCellBtnBlock = ^(UIButton * btn) {
                [weakSelf submit];
            };
            
            return SubmitCell;
        }
            break;
    }
}



#pragma mark -- submit
- (void)submit {
    
    if (isNONE(self.currentPrice)) {
        [DialogUtil showDlgAlert:@"请输入出售单价"];
    }else if (isNONE(self.currentNum)) {
        [DialogUtil showDlgAlert:@"请输入出售件数"];
    } else{
        [self upload];
    }
    
    
}
- (void)upload {
    /**
     *
     token	用户唯一标示
     sid	列表id
     unit	实际到货件数
     otherprice	杂费
     arrivetime	到货日期
     weight	重量
     
     token  用户唯一标示
     detail_id 发货详情id
     product_id  商品id
     one_monye  出售单价
     one_num   出售数量

     */
    XYSenderProductModel * model = [self.model.shipment_detail safeObjectAtIndex:self.index];
    
    NSDictionary * dic = @{MTOKEN:m_token,
                           @"detail_id":model.xyid,
                           @"product_id":model.product_id,
                           @"one_monye":self.currentPrice,
                           @"one_num":self.currentNum,
                           };
    
    XYWeakSelf
    [self xy_postWithValues:dic ModelType:nil Path:i_buy_shipment_product hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        
//        NSArray * arr =  weakSelf.navigationController.viewControllers;
//        [weakSelf.navigationController popToViewController:[arr safeObjectAtIndex:arr.count - 3] animated:YES];
        
        XYSenderProductModel * model_temp = [weakSelf.model.shipment_detail safeObjectAtIndex:weakSelf.index];
        model_temp.current_num = [NSString stringWithFormat:@"%ld",[model_temp.current_num integerValue] + [self.currentNum integerValue]];
        
        if (weakSelf.callBack) {
            weakSelf.callBack(weakSelf.model,weakSelf.index);
        }
        [weakSelf.navigationController popViewControllerAnimated:YES];
    } failure:^(NSString *msg, id model) {
        
    }];
}



@end
