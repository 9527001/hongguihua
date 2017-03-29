//
//  XYSenderNewVC.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/21.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//


#define MAXCOUNT 5
#import "XYSenderNewVC.h"


#import "XYTextFieldDetailCell.h"
#import "XYTextFieldCell.h"
#import "XYSubmitCell.h"
#import "XYPhotosCell.h"
#import "YDProductTCell.h"

#import "XYPhotoBrowser.h"
#import "XYPickerViewModel.h"
#import "SBZCustomDistrictSelectorPickerView.h"


#import "YDAddressModel.h"

#import "XYProductListViewController.h"
#import "XYSenderProductVC.h"


@interface XYSenderNewVC ()

@property (nonatomic,strong) NSMutableArray * titleArr;
@property (nonatomic,strong) NSMutableArray * placeHolderArr;
@property (nonatomic,strong) XYPhotoBrowser * PhotoBrowser;
@property (nonatomic,strong) XYSenderModel * dataModel;
@property (nonatomic,strong) NSMutableArray * dataArr;
@property (nonatomic,strong) YDAddressModel * mDataModel;



@end

@implementation XYSenderNewVC

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
    
    
    self.titleArr = [NSMutableArray arrayWithArray:@[@[@"批发地",@"车次",@"发货地",@"发货日期"],
                                                     @[@"车牌号",@"司机电话"],
                                                     @[@"发货地杂费",@"发货总件数",],
                                                     @[@"增加发货单品",],
                                                     @[@"原始单据",@""],
                                                     @[@""],
                                                     ]];
    
    self.placeHolderArr = [NSMutableArray arrayWithArray:@[@[@"请选择批发地",@"",@"请选择发货地",@"请选择发货日期"],
                                                           @[@"请输入车牌号",@"请输入司机电话"],
                                                           @[@"请输入发货地杂费",@"还未提交货品",],
                                                           @[@"",],
                                                           @[@"",@""],
                                                           @[@""],
                                                           ]];
    self.dataModel = [[XYSenderModel alloc] init];
    self.dataModel.productArr = [NSMutableArray array];
    self.dataModel.photos = [NSMutableArray array];
    self.PhotoBrowser = [[XYPhotoBrowser alloc]init];
    
}
- (void)initData {
    [super initData];
}
- (void)initNet {
    [super initNet];
    XYWeakSelf
    [self xy_postWithValues:nil ModelType:[YDAddressModel class] Path:i_get_ship_all_info hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        weakSelf.mDataModel = model;
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
    [self.mTableView registerNib:@"YDProductTCell"];
    
    [self.mTableView.tableFooterView setBackgroundColor:[UIColor clearColor]];
}

#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 3:
            
            return 1 + (self.dataModel.productArr ? self.dataModel.productArr.count : 0 );
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
   
    return 20.f;
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
            [cell_tf showtopline:(indexPath.row == 0 ? NO : YES) bottomline:NO jiantou:YES];
            
            [cell_tf.rightTextField setEnabled:NO];
            switch (indexPath.row ) {
                case 0:
                {
                    [cell_tf setModel:self.dataModel.sourcePlace IndexPath:indexPath callBack:nil];
                }
                    break;
                case 1:
                {
                    [cell_tf setModel:self.dataModel.car_num IndexPath:indexPath callBack:nil];
                }
                    break;
                case 2:
                {
                    [cell_tf setModel:self.dataModel.sendtoplace IndexPath:indexPath callBack:nil];
                }
                    break;
                case 3:
                {
                    [cell_tf setModel:self.dataModel.sendtime IndexPath:indexPath callBack:nil];
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
            [cell_tf showtopline:(indexPath.row == 0 ? NO : YES) bottomline:NO jiantou:NO];
            switch (indexPath.row) {
                case 0:
                {
                    [cell_tf.rightTextField setEnabled:YES];
                    [cell_tf setModel:self.dataModel.carnumber IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.dataModel.carnumber = x;
                    }];
                }
                    break;
                case 1:
                {
                    [cell_tf.rightTextField setEnabled:YES];
                    cell_tf.tfType = pureNumber;
                    [cell_tf setModel:self.dataModel.driverphone IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.dataModel.driverphone = x;
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
            [cell_tf showtopline:(indexPath.row == 0 ? NO : YES) bottomline:NO jiantou:NO];
            switch (indexPath.row) {
                case 0:
                {
                    [cell_tf.rightTextField setEnabled:YES];
                    cell_tf.tfType = demical;
                    [cell_tf setModel:self.dataModel.otherprice IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.dataModel.otherprice = x;
                    }];
                }
                    break;
                case 1:
                {
                    [cell_tf setModel:self.dataModel.maxCount IndexPath:indexPath callBack:nil];
                    [cell_tf.rightTextField setEnabled:NO];
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
            if (indexPath.row == 0) {
                [cell_tf showtopline:NO bottomline:NO jiantou:YES];
                return cell_tf;
            }else{
                [cell_product showUp:YES down:NO];
                XYSenderProductModel * dataModel = [self.dataModel.productArr safeObjectAtIndex:indexPath.row - 1];
                NSString * content = [NSString stringWithFormat:@"%ld %@ %@ %@件 %@元",indexPath.row,dataModel.product,dataModel.level_name,dataModel.num,dataModel.cost];
                [cell_product.titleLabel setText:content];
                return cell_product;
            }
       
        }
            break;
        case 4:
        {
            if (indexPath.row == 0) {
                [cell_tf showtopline:NO bottomline:YES jiantou:YES];
                
                return cell_tf;
            }else{
                
                if ([self.dataModel.photos isKindOfClass:[NSArray class]]) {
                    NSArray * imageArr = self.dataModel.photos;
                    
                    [cell_photo setModel:imageArr IndexPath:indexPath callBack:^(NSMutableArray * arr, NSIndexPath *indexPath) {
                        [XYPhotoBrowser showPhotoBrowserWithTarget:weakSelf andMaxImageCount:(MAXCOUNT - arr.count) type:PhotoBrowserMultiple callBack:^(id x) {
                            if ([x isKindOfClass:[NSArray class]]) {
                                for (UIImage * image in x) {
                                    [weakSelf.dataModel.photos addObject:image];
                                }
                                [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                            }
                        }];
                    } deleteBlock:^(id x,  NSIndexPath *indexPath) {
                        [weakSelf.dataModel.photos removeObjectAtIndex:indexPath.row];
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
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    if (!self.mDataModel) {
                        return;
                    }
                    NSMutableArray * arr = self.mDataModel.wholesale;
                    NSMutableArray * arr_temp = [NSMutableArray array];
                    for (YDAddressDetailModel * model in arr) {
                        XYPickerViewModel * model_temp = [[XYPickerViewModel alloc]init];
                        model_temp.xyid = model.xyid;
                        model_temp.name = model.name;
                        [arr_temp addObject:model_temp];
                    }
 
                    [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title andIndexPath:indexPath andDataArr:@[arr_temp] type:PickerTypeModelNeedIndex XYZBlock:^(id x, NSNumber * y, NSIndexPath * indexPath) {
                        weakSelf.dataModel.sourcePlace = x;
                        YDAddressDetailModel * model = [self.mDataModel.wholesale safeObjectAtIndex:[y integerValue]];
                        weakSelf.dataModel.sourcePlaceID = model.xyid;
                        NSInteger car_num = [model.current_no integerValue];
                        car_num ++;
                        NSDate * nowDate = [NSDate date];
                        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
                        [dateFormatter setDateFormat:@"yy"];
                        NSString * date = [dateFormatter stringFromDate:nowDate]; 
                        weakSelf.dataModel.car_num = [NSString stringWithFormat:@"%@%@%03ld",model.name,date,car_num];
                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath,[NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }];
                }
                    break;
                case 2:
                {
                    if (!self.mDataModel) {
                        return;
                    }
                    NSMutableArray * arr = self.mDataModel.ship;
                    NSMutableArray * arr_temp = [NSMutableArray array];
                    for (YDAddressDetailModel * model in arr) {
                        XYPickerViewModel * model_temp = [[XYPickerViewModel alloc]init];
                        model_temp.xyid = model.xyid;
                        model_temp.name = model.name;
                        [arr_temp addObject:model_temp];
                    }
                    
                    [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title andIndexPath:indexPath andDataArr:@[arr_temp] type:PickerTypeModelNeedIndex XYZBlock:^(id x, NSNumber * y, NSIndexPath * indexPath) {
                        weakSelf.dataModel.sendtoplace = x;
                        YDAddressDetailModel * model = [self.mDataModel.ship safeObjectAtIndex:[y integerValue]];
                        weakSelf.dataModel.sendtoplaceID = model.xyid;
                      
                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath,[NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }];

                }
                    break;
                case 3:
                {
                    
                    [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title  andIndexPath:indexPath andDataArr:nil type:PickerTypeDate callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.dataModel.sendtime = x;
                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 3:
        {
            switch (indexPath.row) {
                case 0:
                {
                    XYSenderProductVC * vc = [[XYSenderProductVC alloc]initWithType:NO dataArr:self.dataModel.productArr index:0];
                    vc.block = ^(NSMutableArray <Optional,XYSenderProductModel>*arr,id y) {
            
                        [weakSelf handleDataArr:arr indexPath:indexPath];
                    };
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                default:
                {
                    XYSenderProductVC * vc = [[XYSenderProductVC alloc]initWithType:YES dataArr:self.dataModel.productArr index:indexPath.row - 1];
                    vc.block = ^(NSMutableArray <Optional,XYSenderProductModel>*arr,id y) {
                        
                        [weakSelf handleDataArr:arr indexPath:indexPath];
                    };
                    [self.navigationController pushViewController:vc animated:YES];
                    
                }
                    break;
            }
        }
            break;
        case 4:
        {
            if ([self.dataModel.photos isKindOfClass:[NSArray class]]) {
                NSArray * imageArr = self.dataModel.photos;
                [XYPhotoBrowser showPhotoBrowserWithTarget:weakSelf andMaxImageCount:(MAXCOUNT - imageArr.count) type:PhotoBrowserMultiple callBack:^(id x) {
                    if ([x isKindOfClass:[NSArray class]]) {
                        for (UIImage * image in x) {
                            [weakSelf.dataModel.photos addObject:image];
                        }
                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }
                }];
                
            }
            
        }
            break;
        default:
            break;
    }
}

- (void)handleDataArr:(NSMutableArray <Optional,XYSenderProductModel>*)arr indexPath:(NSIndexPath *)indexPath{
    self.dataModel.productArr = arr;
    NSInteger count = 0;
    for (XYSenderProductModel * model in arr) {
        count += [model.num integerValue];
    }
    self.dataModel.maxCount = [NSString stringWithFormat:@"%ld",count];
    [self.mTableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.mTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:2]] withRowAnimation:UITableViewRowAnimationAutomatic];
}
#pragma mark -- submit
- (void)submit {

    
    if (isNONE(self.dataModel.sourcePlace)) {
        [DialogUtil showDlgAlert:@"请选择批发地"];
    }else if (isNONE(self.dataModel.sendtoplace)) {
        [DialogUtil showDlgAlert:@"请选择发货地"];
    }else if (isNONE(self.dataModel.sendtime)) {
        [DialogUtil showDlgAlert:@"请选择批发货日期"];
    }else if (isNONE(self.dataModel.carnumber)) {
        [DialogUtil showDlgAlert:@"请输入车牌号"];
    }else if (isNONE(self.dataModel.driverphone)) {
        [DialogUtil showDlgAlert:@"请输入司机电话"];
    }else if (isNONE(self.dataModel.otherprice)) {
        [DialogUtil showDlgAlert:@"请输入发货地杂费"];
    }else if (self.dataModel.productArr.count == 0) {
        [DialogUtil showDlgAlert:@"请增加发货单品"];
    }
//    else if (self.dataModel.photos.count == 0) {
//        [DialogUtil showDlgAlert:@"请选择图片"];
//    }else if (self.dataModel.photos.count < 3) {
//        [DialogUtil showDlgAlert:@"图片数量不能少于3"];
//    }
    else{
        [self upload];
    }
    
    
}
- (void)upload {
    /**
     *
     token	用户唯一标示
     pid	商品id
     gid	等级id
     sendtoplace	目的地
     sendtime	发货月份
     carnumber	车牌号
     unit	件数
     price	价格
     otherprice	其他费用
     photos	图片
     provinceId	省份id
     cityid	城市id
     districtId	区县id
     spec	规格
     driverphone 司机电话
     placeofreceipt 发货地
     
     token 用户唯一标示
     wholesale_id 批发地id
     ship_id 发货地id
     car_num 车次编号
     ship_time  发货时间
     car_number_plate 车牌号
     phone 电话
     other_cost 发货地杂费
     count_num  总件数
     pics  图片详情
     productInfo 发货商品数据
     
     */
    
    NSMutableString * jsonstring = [NSMutableString stringWithString:@"["];
    NSArray * ar_temp = self.dataModel.productArr;
    NSInteger count = ar_temp.count;
    for (NSInteger i = 0 ; i < count; i ++) {
        product * model = [ar_temp safeObjectAtIndex:i];
        NSString * str = [model toJSONString];
        if (i == count - 1) {
            
            [jsonstring appendFormat:@"%@",str];
        }else{
            
            [jsonstring appendFormat:@"%@,",str];
        }
    } 
    [jsonstring appendString:@"]"];
    NSDictionary * dic = @{MTOKEN:m_token,
                           @"wholesale_id":self.dataModel.sourcePlaceID,
                           @"ship_id":self.dataModel.sendtoplaceID,
                           @"ship_time":self.dataModel.sendtime,
                           @"car_num":self.dataModel.car_num,
                           @"phone":self.dataModel.driverphone,
                           @"car_number_plate":self.dataModel.carnumber,
                           @"count_num":self.dataModel.maxCount,
                           @"other_cost":self.dataModel.otherprice,
                           @"productInfo":jsonstring,
                           @"pics":@[@""]};
    
    XYWeakSelf
    [self xy_uploadPhotoWithValues:dic Image:self.dataModel.photos modelType:nil Path:i_addShipInfo Success:^(__kindof YTKBaseRequest *request, id model) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    } failure:^(NSString *msg, id model) {
        NSLog(@"%@",msg);
    }];
}



@end
