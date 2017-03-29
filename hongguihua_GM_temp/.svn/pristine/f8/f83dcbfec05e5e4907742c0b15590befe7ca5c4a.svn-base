//
//  XYConfirmReceiveNewVC.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/23.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#define MAXCOUNT 5
#import "XYConfirmReceiveNewVC.h"


#import "XYTextFieldCell.h"
#import "XYSubmitCell.h"
#import "XYPhotosCell.h"
#import "YDProductTCell.h"

#import "XYPhotoBrowser.h"
#import "XYPickerViewModel.h"


@interface XYConfirmReceiveNewVC ()

@property (nonatomic,strong) NSMutableArray * titleArr;
@property (nonatomic,strong) NSMutableArray * placeHolderArr;
@property (nonatomic,strong) XYPhotoBrowser * PhotoBrowser;
@property (nonatomic,strong) NSMutableArray * dataArr;


@end

@implementation XYConfirmReceiveNewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

 
- (void)initNavigationBar {
    [super initNavigationBar];
    self.title = @"实际收货";
    
}

- (void)initUI {
    [super initUI];
    
    
    self.titleArr = [NSMutableArray arrayWithArray:@[@[[NSString stringWithFormat:@"%@到货明细",self.dataModel.car_num]],
                                                     @[@"发货件数"],
//                                                     @[@"实收件数",@"批发地杂费",],
                                                     @[@"批发地杂费",],
                                                     @[@"到货日期"],
                                                     @[@"原始单据",@""],
                                                     @[@""],
                                                     ]];
    
    self.placeHolderArr = [NSMutableArray arrayWithArray:@[@[@"",],
                                                           @[@""],
//                                                           @[@"请输入实收件数",@"请输入批发地杂费",],
                                                           @[@"请输入批发地杂费",],
                                                           @[@"请输入到货日期"],
                                                           @[@"",],
                                                           @[@""],
                                                           ]];
    self.dataModel.productArr = [NSMutableArray array];
    self.PhotoBrowser = [[XYPhotoBrowser alloc]init];
    
}
- (void)initData {
    [super initData];
    self.dataModel.productArr = [NSMutableArray array];
}

- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self frame:self.view.bounds];
    self.mTableView.showsVerticalScrollIndicator = NO;
    [self.mTableView registerNib:@"XYTextFieldCell"];
    [self.mTableView registerNib:@"XYSubmitCell"];
    [self.mTableView registerNib:@"XYPhotosCell"];
    [self.mTableView registerNib:@"YDProductTCell"];
    
    [self.mTableView.tableFooterView setBackgroundColor:[UIColor clearColor]];
}

#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            
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
   
    if (indexPath.section == self.titleArr.count - 2 && indexPath.row == 1) {
        return [XYPhotosCell cellHeight];
    }
    return H_TABLECELLDEFAULTHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return section == 0 ? 20.f : 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYTextFieldCell *cell_tf = [tableView dequeueReusableCellWithIdentifier:@"XYTextFieldCell"];
    XYSubmitCell *SubmitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"];
    XYPhotosCell *cell_photo = [tableView dequeueReusableCellWithIdentifier:@"XYPhotosCell"];
    YDProductTCell *cell_product = [tableView dequeueReusableCellWithIdentifier:@"YDProductTCell"];
    XYWeakSelf
    NSArray * titleArr_temp = [self.titleArr safeObjectAtIndex:indexPath.section];
    NSArray * placeHolderArr_temp = [self.placeHolderArr safeObjectAtIndex:indexPath.section];
    [cell_tf.leftLabel setText:[titleArr_temp safeObjectAtIndex:indexPath.row]];
    [cell_tf.rightTextField setPlaceholder:[placeHolderArr_temp safeObjectAtIndex:indexPath.row]];
    
 
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0) {
                [cell_tf showtopline:NO bottomline:NO jiantou:YES];
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
        case 1:
        {
            [cell_tf showtopline:(indexPath.row == 0 ? NO : YES) bottomline:YES jiantou:NO];
            [cell_tf.rightTextField setEnabled:NO];
            [cell_tf setModel:[NSString stringWithFormat:@"%@件",self.dataModel.count_num] IndexPath:indexPath callBack:nil];
            return cell_tf;
        }
            break;
        case 2:
        {
            [cell_tf showtopline:(indexPath.row == 0 ? NO : YES) bottomline:NO jiantou:NO];
            [cell_tf.rightTextField setEnabled:YES];
            switch (indexPath.row) {
//                case 0:
//                {
//                    [cell_tf setModel:self.dataModel.unit_real IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
//                        weakSelf.dataModel.unit_real = x;
//                    }];
//                }
//                    break;
                case 0:
                {
                    [cell_tf setModel:self.dataModel.otherprice IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.dataModel.otherprice = x;
                    }];
                }
                    break;
                    
                default:
                    break;
            }
            
            return cell_tf;
        }
            break;
        case 3:
        {
            [cell_tf showtopline:YES bottomline:NO jiantou:YES];
            [cell_tf setModel:self.dataModel.date_real IndexPath:indexPath callBack:nil];
            return cell_tf;
        }
            break;
        case 4:
        {
            if (indexPath.row == 0) {
                [cell_tf showtopline:YES bottomline:YES jiantou:NO];
                [cell_tf.rightTextField setEnabled:NO];
                
                return cell_tf;
            }else{
                
//                if ([self.dataModel.img_detail isKindOfClass:[NSString class]]) {
//                    NSArray * arr_temp = [self.dataModel.img_detail componentsSeparatedByString:@","];
//                    NSMutableArray * arr = [NSMutableArray arrayWithArray:arr_temp];
//                    [arr removeObject:@""];
//                    [cell_photo setModel:arr IndexPath:indexPath callBack:nil];
//                }
//                return cell_photo;
                
                if ([self.dataModel.productArr isKindOfClass:[NSArray class]]) {
                    NSMutableArray * imageArr = self.dataModel.productArr;
                    
                    [cell_photo setModel:imageArr IndexPath:indexPath callBack:^(NSMutableArray * arr, NSIndexPath *indexPath) {
                        [XYPhotoBrowser showPhotoBrowserWithTarget:weakSelf andMaxImageCount:(MAXCOUNT - arr.count) type:PhotoBrowserMultiple callBack:^(id x) {
                            if ([x isKindOfClass:[NSArray class]]) {
                                for (UIImage * image in x) {
                                    [weakSelf.dataModel.productArr addObject:image];
                                }
                                [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                            }
                        }];
                    } deleteBlock:^(id x,  NSIndexPath *indexPath) {
                        [weakSelf.dataModel.productArr removeObjectAtIndex:indexPath.row];
                    }];
                    
                }
                return cell_photo;
            }
        }
            break;
        default:
        {
            [SubmitCell setTitle:@"提交" titleColor:COLOR_WHITE backColor:COLOR_BLUE space:50.f enable:YES];
            XYWeakSelf
            SubmitCell.clickCellBtnBlock = ^(UIButton * btn) {
                [weakSelf submit];
            };
            
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
        case 3:
        {
            [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title  andIndexPath:indexPath andDataArr:nil type:PickerTypeDate callBack:^(NSString * x, NSIndexPath * indexPath) {
                weakSelf.dataModel.date_real = x;
                [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }];
        }
            break;
        default:
            break;
    }
}


#pragma mark -- submit
- (void)submit {
    
//    if (isNONE(self.dataModel.unit_real)) {
//        [DialogUtil showDlgAlert:@"请输入实收件数"];
//    }else
        if (isNONE(self.dataModel.otherprice)) {
        [DialogUtil showDlgAlert:@"请输入批发地杂费"];
    }else if (isNONE(self.dataModel.date_real)) {
        [DialogUtil showDlgAlert:@"请输入到货日期"];
    }
//    else if (self.dataModel.productArr.count == 0) {
//        [DialogUtil showDlgAlert:@"请选择照片"];
//    }
    else{
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
     shipment_id  发货数据id
     wholesale_other_cost  收货地杂费
     pics  收货图片
     receiver_time  到货日期
     */
    
    NSDictionary * dic = @{MTOKEN:m_token,
                           @"shipment_id":self.dataModel.xyid,
                           @"unit":self.dataModel.unit_real,
                           @"wholesale_other_cost":self.dataModel.otherprice,
                           @"receiver_time":self.dataModel.date_real,
                           @"pics":@[@""],
                           };
    
    XYWeakSelf
//    [self xy_postWithValues:dic ModelType:nil Path:i_addShipInfo hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
//        
//        NSArray * arr =  weakSelf.navigationController.viewControllers;
//        [weakSelf.navigationController popToViewController:[arr safeObjectAtIndex:arr.count - 3] animated:YES];
//    } failure:^(NSString *msg, id model) {
//        
//    }];
    
    
    [self xy_uploadPhotoWithValues:dic Image:self.dataModel.productArr modelType:nil Path:i_update_shipment_status Success:^(__kindof YTKBaseRequest *request, id model) {
        
        NSArray * arr =  weakSelf.navigationController.viewControllers;
        [weakSelf.navigationController popToViewController:[arr safeObjectAtIndex:arr.count - 3] animated:YES];
    } failure:^(NSString *msg, id model) {
        NSLog(@"%@",msg);
    }];
}



@end
