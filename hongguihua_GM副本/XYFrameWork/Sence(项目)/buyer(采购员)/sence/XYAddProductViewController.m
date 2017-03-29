//
//  XYAddProductViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/8.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#define MAXCOUNT 5
#import "XYAddProductViewController.h"

#import "XYTextFieldDetailCell.h"
#import "XYTextFieldCell.h"
#import "XYSubmitCell.h"
#import "XYPhotosCell.h"
#import "XYTextFieldDetailCell.h"

#import "XYPhotoBrowser.h"
#import "XYPickerViewModel.h"

@interface XYAddProductViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray * titleArr;
@property (nonatomic,strong) NSArray * placeHolderArr;
@property (nonatomic,strong) XYPhotoBrowser * PhotoBrowser;
@property (nonatomic,strong) XYAddProductModel * dataModel;


@end

@implementation XYAddProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

 

- (void)initUI {
    [super initUI];
    self.titleArr = @[@[@"工厂车次"],
                      @[
//                          @"采购类型",
                        @"交付日期",@"预计发往口岸",@"预计到货日期"],
                      @[@"名称"],
                      @[@"装货明细"],
                      @[@"重量(吨)",@"数量(件)",@"总价(元)",@"采货地"],
                      @[@"果品图片",@"图片列表"],
                      @[@"提交"],
                      ];
    self.placeHolderArr = @[@[@"请输入工厂车次"],
                            @[
//                                @"请选择类型",
                              @"请选择交付日期"],
                            @[@"请选择名称"],
                            @[@"请输入装货明细"],
                            @[@"请输入重量",@"请输入数量",@"请输入总价",@"请输入采货地"],
                            @[@"可添加3~5张图片（可选）"],
                            ];
    self.dataModel = [[XYAddProductModel alloc] init];
    self.dataModel.photosArr = [NSMutableArray array];
    self.PhotoBrowser = [[XYPhotoBrowser alloc]init];
    
}
- (void)initData {
    [super initData];
}
- (void)initNet {
    [super initNet];
    [self xy_postWithValues:nil ModelType:[XYAPInfoModel class] Path:i_productinfo hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[XYAPInfoModel class]]) {
            NSLog(@"%@",model);
            XYAPInfoModel * apiModel = model;
            [self.mData addObject:apiModel.grade];
            [self.mData addObject:apiModel.product];
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
    [self.mTableView registerNib:@"XYTextFieldDetailCell"];
    
    [self.mTableView.tableFooterView setBackgroundColor:[UIColor clearColor]];
}

#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    return  self.titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    id object = [self.titleArr objectAtIndex:section];
    if ([object isKindOfClass:[NSArray class]]) {
        NSArray * arr = object;
        return arr.count;
    }
    return 0;
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == self.titleArr.count - 1 ) {
        return 40.f;
    }
    if (indexPath.section == 5 && indexPath.row == 1) {
        return [XYPhotosCell cellHeight];
    }
    if (indexPath.section == 3) {
        return 100.f;
    }
    return H_TABLECELLDEFAULTHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
 
    switch (section) {
        case 0:
        case 2:
        case 3:
            return 0.1f;
            break;
            
        default:
            return 20.f;
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYTextFieldCell *cell_tf = [tableView dequeueReusableCellWithIdentifier:@"XYTextFieldCell"];
    XYSubmitCell *SubmitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"];
    XYPhotosCell *cell_photo = [tableView dequeueReusableCellWithIdentifier:@"XYPhotosCell"];
    XYTextFieldDetailCell *cell_tfd = [tableView dequeueReusableCellWithIdentifier:@"XYTextFieldDetailCell"];
    
    XYWeakSelf
    if (self.titleArr.count&&self.placeHolderArr.count) {
        NSArray * titleArr_temp = [self.titleArr safeObjectAtIndex:indexPath.section];
        NSArray * placeHolderArr_temp = [self.placeHolderArr safeObjectAtIndex:indexPath.section];
        NSString * title = [titleArr_temp safeObjectAtIndex:indexPath.row];
        NSString * placeHolder = [placeHolderArr_temp safeObjectAtIndex:indexPath.row];
        
        [cell_tf.leftLabel setText:title];
        [cell_tf.rightTextField setPlaceholder:placeHolder];
        
        [cell_tfd.leftLabel setText:title];
        [cell_tfd.rightLabel setText:placeHolder];
    }
    switch (indexPath.section) {
        case 0:
        {
            [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            [cell_tf setModel:self.dataModel.reason IndexPath:indexPath callBack:^(NSString * str, NSIndexPath * indexPath)  {
                weakSelf.dataModel.reason = str;
            }];
            return cell_tf;
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
//                case 0:
//                {
//                    [cell_tf showtopline:NO bottomline:YES jiantou:YES];
//                    [cell_tf.rightTextField setText:self.dataModel.type];
//                }
//                    break;
                case 0:
                {
                    [cell_tf showtopline:NO bottomline:YES jiantou:YES];
                    [cell_tf.rightTextField setText:self.dataModel.date];
                }
                    break;
                case 1:
                {
                    [cell_tf showtopline:NO bottomline:YES jiantou:NO];
                    [cell_tf setModel:self.dataModel.estimatedArrivalPort IndexPath:indexPath callBack:^(NSString * str, NSIndexPath * indexPath) {
                        weakSelf.dataModel.estimatedArrivalPort = str;
                    }];
                }
                    break;
                case 2:
                {
                    [cell_tf showtopline:NO bottomline:YES jiantou:YES];
                    [cell_tf.rightTextField setText:self.dataModel.estimatedArrivalDate];
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
            [cell_tf showtopline:YES bottomline:YES jiantou:YES];
            [cell_tf.rightTextField setText:self.dataModel.name];
            return cell_tf;
        }
            break;
        case 3:
        {
            
            [cell_tfd showtopline:NO bottomline:YES];
            [cell_tfd setModel:self.dataModel.specifications  IndexPath:indexPath callBack:^(NSString* x, NSIndexPath * indexPath) {
                weakSelf.dataModel.specifications = x;
            }];
            return cell_tfd;
        }
            break;
            
        case 4:
        {
            [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            if (self.dataModel) {
                [cell_tf setModel:self.dataModel IndexPath:indexPath callBack:^(NSString* x, NSIndexPath * indexPath) {
                    switch (indexPath.row) {
                        case 0:  {
                            weakSelf.dataModel.weight = x;
                        }
                            break;
                        case 1: {
                            weakSelf.dataModel.unit = x;
                        }
                            break;
                        case 2: {
                            weakSelf.dataModel.price = x;
                        }
                            break;
                        case 3:  {
                            weakSelf.dataModel.sourcing = x;
                        }
                            break;
                        default:
                            break;
                    }
                    
                }];
            }
            
            return cell_tf;
        }
            break;
        case 5:
        {
            if (indexPath.row == 0) {
                [cell_tf showtopline:YES bottomline:YES jiantou:YES];
                return cell_tf;
            }else{
                
                if ([self.dataModel.photosArr isKindOfClass:[NSArray class]]) {
                    NSArray * imageArr = self.dataModel.photosArr; 
                    [cell_photo setModel:imageArr IndexPath:indexPath callBack:^(NSMutableArray * arr, NSIndexPath *indexPath) {
                        [XYPhotoBrowser showPhotoBrowserWithTarget:weakSelf andMaxImageCount:(MAXCOUNT - arr.count) type:PhotoBrowserMultiple callBack:^(id x) {
                            if ([x isKindOfClass:[NSArray class]]) {
                                for (UIImage * image in x) {
                                    [weakSelf.dataModel.photosArr addObject:image];
                                }
                                [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                            }
                        }];
                    } deleteBlock:^(id x,  NSIndexPath *indexPath) {
                        [weakSelf.dataModel.photosArr removeObjectAtIndex:indexPath.row];
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
        case 1:
        {
//           
//            if (indexPath.row == 0) {
//                
//                if ([[self.mData firstObject] isKindOfClass:[NSArray class]]) {
//                    NSArray * dataArr = [self.mData firstObject];
//                    NSMutableArray * iDataArr = [NSMutableArray array];
//                    for (grade * model in dataArr) {
//                        XYPickerViewModel * pvModel = [[XYPickerViewModel alloc] init];
//                        pvModel.xyid = model.xyid;
//                        pvModel.name = model.grade;
//                        [iDataArr addObject:pvModel];
//                    }
//                    
//                    [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title andIndexPath:indexPath andDataArr:@[iDataArr] type:PickerTypeDefault XYZBlock:^(NSString * x, NSArray * idsArr, NSIndexPath * indexPath) {
//                        weakSelf.dataModel.type = x;
//                        if ([idsArr isKindOfClass:[NSArray class]]) {
//                            weakSelf.dataModel.typeID = [idsArr firstObject];
//                        }
//                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//                    }];
//                }
//                
//            }else
                if(indexPath.row == 0 ||
                     indexPath.row == 2){
                [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title  andIndexPath:indexPath andDataArr:nil type:PickerTypeDate callBack:^(NSString * x, NSIndexPath * indexPath) {
                    if (indexPath.row == 0) {
                        
                        weakSelf.dataModel.date = x;
                    }else if (indexPath.row == 2){
                        
                        weakSelf.dataModel.estimatedArrivalDate = x;
                    }else{
                        //...
                    }
                    [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                }];
            }
            
        }
            break;
        case 2:
        {
            
            if ([[self.mData lastObject] isKindOfClass:[NSArray class]]) {
                NSArray * dataArr = [self.mData lastObject];
                NSMutableArray * iDataArr = [NSMutableArray array];
                for (product * model in dataArr) {
                    XYPickerViewModel * pvModel = [[XYPickerViewModel alloc] init];
                    pvModel.xyid = model.xyid;
                    pvModel.name = model.name;
                    [iDataArr addObject:pvModel];
                }
                
                [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title andIndexPath:indexPath andDataArr:@[iDataArr] type:PickerTypeDefault XYZBlock:^(NSString * x, NSArray * idsArr, NSIndexPath * indexPath) {
                    weakSelf.dataModel.name = x;
                    if ([idsArr isKindOfClass:[NSArray class]]) {
                        weakSelf.dataModel.nameID = [idsArr firstObject];
                    }
                    [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                }];
            }
 
        }
            break;
            
        case 5:
        { 
            if ([self.dataModel.photosArr isKindOfClass:[NSArray class]]) {
                NSArray * imageArr = self.dataModel.photosArr;
                
                    [XYPhotoBrowser showPhotoBrowserWithTarget:weakSelf andMaxImageCount:(MAXCOUNT - imageArr.count) type:PhotoBrowserMultiple callBack:^(id x) {
                        if ([x isKindOfClass:[NSArray class]]) {
                            for (UIImage * image in x) {
                                [weakSelf.dataModel.photosArr addObject:image];
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

#pragma mark -- submit
- (void)submit {
    if (isNONE(self.dataModel.reason)) {
        [DialogUtil showDlgAlert:@"请输入工厂车次"];
        return;
    }
//    else if (isNONE(self.dataModel.typeID)) {
//        [DialogUtil showDlgAlert:@"请选择采购类型"];
//        return;
//    }
    else if (isNONE(self.dataModel.date)) {
        [DialogUtil showDlgAlert:@"请选择交付日期"];
        return;
    }
    else if (isNONE(self.dataModel.estimatedArrivalPort)) {
        [DialogUtil showDlgAlert:@"请输入预计发往口岸"];
        return;
    }else if (isNONE(self.dataModel.estimatedArrivalDate)) {
        [DialogUtil showDlgAlert:@"请选择预计到货日期"];
        return;
    }
    else if (isNONE(self.dataModel.nameID)) {
        [DialogUtil showDlgAlert:@"请选择名称"];
        return;
    }else if (isNONE(self.dataModel.specifications)) {
        [DialogUtil showDlgAlert:@"请输入装货明细"];
        return;
    }else if (isNONE(self.dataModel.weight)) {
        [DialogUtil showDlgAlert:@"请输入重量"];
        return;
    }else if (isNONE(self.dataModel.unit)) {
        [DialogUtil showDlgAlert:@"请输入单位"];
        return;
    }
//    else if (isNONE(self.dataModel.price)) {
//        [DialogUtil showDlgAlert:@"请输入总价"];
//        return;
//    }
    else if (isNONE(self.dataModel.sourcing)) {
        [DialogUtil showDlgAlert:@"请输入采货地"];
        return;
    }
//    else if (self.dataModel.photosArr.count == 0) {
//        [DialogUtil showDlgAlert:@"请选择图片"];
//        return;
//    }else if (self.dataModel.photosArr.count < 3) {
//        [DialogUtil showDlgAlert:@"图片数量不能少于3"];
//        return;
//    }
    else{
    
        NSDictionary * dic = @{@"token":m_token,
                               @"reasons":self.dataModel.reason,
//                               @"gid":self.dataModel.typeID,
                               @"gid":@"1",//该字段已被弃用
                               @"arrivetime":self.dataModel.date,
                               @"toplace":self.dataModel.estimatedArrivalPort,
                               @"totime":self.dataModel.estimatedArrivalDate,
                               @"pid":self.dataModel.nameID,
                               @"spek":self.dataModel.specifications,
                               @"number":self.dataModel.weight,
                               @"unit":self.dataModel.unit,
                               @"price":(self.dataModel.price.length > 0 ? self.dataModel.price : @"0"),
                               @"sendplace":self.dataModel.sourcing,
                               @"photos":@[@""]};
        
        XYWeakSelf
  
        
        [self xy_uploadPhotoWithValues:dic Image:self.dataModel.photosArr modelType:nil Path:i_productadd Success:^(__kindof YTKBaseRequest *request, id model) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        } failure:^(NSString *msg, id model) {
            NSLog(@"%@",msg);
        }];
        
 
    }
 

}

@end
