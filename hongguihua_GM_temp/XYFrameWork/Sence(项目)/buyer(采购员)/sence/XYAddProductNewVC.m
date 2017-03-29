//
//  XYAddProductNewVC.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/21.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#define MAXCOUNT 5
#import "XYAddProductNewVC.h"

#import "XYTextFieldDetailCell.h"
#import "XYTextFieldCell.h"
#import "XYSubmitCell.h"
#import "XYPhotosCell.h"

#import "XYPhotoBrowser.h"
#import "XYPickerViewModel.h"

@interface XYAddProductNewVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray * titleArr;
@property (nonatomic,strong) NSArray * placeHolderArr;
@property (nonatomic,strong) XYPhotoBrowser * PhotoBrowser;
@property (nonatomic,strong) XYAddProductModel * dataModel;


@end

@implementation XYAddProductNewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)initNavigationBar {
    [super initNavigationBar];
    self.title = @"新增商品";
}

- (void)initUI {
    [super initUI];
    self.titleArr = @[@[@"申请事由"],
                      @[@"采购类型",@"交付日期",@"预计发往口岸",@"预计到货日期"],
                      @[@"名称"],
                      @[@"规格",@"重量(吨)",@"数量(件)",@"单价(元)",@"采货地"],
                      @[@"果品图片",@"图片列表"],
                      @[@"提交"],
                      ];
    self.placeHolderArr = @[@[@"请输入申请事由"],
                            @[@"请选择类型",@"请选择交付日期"],
                            @[@"请选择名称"],
                            @[@"请输入规格",@"请输入重量",@"请输入数量",@"请输入单价",@"请输入采货地"],
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
    
    if (indexPath.section == 5 ) {
        return 40.f;
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
    XYSubmitCell *SubmitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"];
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
            [cell_tf setModel:self.dataModel.reason IndexPath:indexPath callBack:^(NSString * str, NSIndexPath * indexPath) {
                weakSelf.dataModel.reason = str;
            }];
            return cell_tf;
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [cell_tf showtopline:NO bottomline:YES jiantou:YES];
                    [cell_tf.rightTextField setText:self.dataModel.type];
                }
                    break;
                case 1:
                {
                    [cell_tf showtopline:NO bottomline:YES jiantou:YES];
                    [cell_tf.rightTextField setText:self.dataModel.date];
                }
                    break;
                case 2:
                {
                    [cell_tf showtopline:NO bottomline:YES jiantou:NO];
                    [cell_tf setModel:self.dataModel.estimatedArrivalPort IndexPath:indexPath callBack:^(NSString * str, NSIndexPath * indexPath) {
                        weakSelf.dataModel.estimatedArrivalPort = str;
                    }];
                }
                    break;
                case 3:
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
            [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            if (self.dataModel) {
                [cell_tf setModel:self.dataModel IndexPath:indexPath callBack:^(NSString* x, NSIndexPath * indexPath) {
                    switch (indexPath.row) {
                        case 0: {
                            weakSelf.dataModel.specifications = x;
                        }
                            break;
                        case 1:  {
                            weakSelf.dataModel.weight = x;
                        }
                            break;
                        case 2: {
                            weakSelf.dataModel.unit = x;
                        }
                            break;
                        case 3: {
                            weakSelf.dataModel.price = x;
                        }
                            break;
                        case 4:  {
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
        case 4:
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
            
            if (indexPath.row == 0) {
                
                if ([[self.mData firstObject] isKindOfClass:[NSArray class]]) {
                    NSArray * dataArr = [self.mData firstObject];
                    NSMutableArray * iDataArr = [NSMutableArray array];
                    for (grade * model in dataArr) {
                        XYPickerViewModel * pvModel = [[XYPickerViewModel alloc] init];
                        pvModel.xyid = model.xyid;
                        pvModel.name = model.grade;
                        [iDataArr addObject:pvModel];
                    }
                    
                    [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title andIndexPath:indexPath andDataArr:@[iDataArr] type:PickerTypeDefault XYZBlock:^(NSString * x, NSArray * idsArr, NSIndexPath * indexPath) {
                        weakSelf.dataModel.type = x;
                        if ([idsArr isKindOfClass:[NSArray class]]) {
                            weakSelf.dataModel.typeID = [idsArr firstObject];
                        }
                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }];
                }
                
            }else if(indexPath.row == 1 ||
                     indexPath.row == 3){
                [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title  andIndexPath:indexPath andDataArr:nil type:PickerTypeDate callBack:^(NSString * x, NSIndexPath * indexPath) {
                    if (indexPath.row == 1) {
                        
                        weakSelf.dataModel.date = x;
                    }else if (indexPath.row == 3){
                        
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
            
        case 4:
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
        [DialogUtil showDlgAlert:@"请输入申请事由"];
        return;
    }else if (isNONE(self.dataModel.typeID)) {
        [DialogUtil showDlgAlert:@"请选择采购类型"];
        return;
    }else if (isNONE(self.dataModel.date)) {
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
        [DialogUtil showDlgAlert:@"请输入规格"];
        return;
    }else if (isNONE(self.dataModel.weight)) {
        [DialogUtil showDlgAlert:@"请输入重量"];
        return;
    }else if (isNONE(self.dataModel.unit)) {
        [DialogUtil showDlgAlert:@"请输入单位"];
        return;
    }else if (isNONE(self.dataModel.price)) {
        [DialogUtil showDlgAlert:@"请输入单价"];
        return;
    }else if (isNONE(self.dataModel.sourcing)) {
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
                               @"gid":self.dataModel.typeID,
                               @"arrivetime":self.dataModel.date,
                               @"toplace":self.dataModel.estimatedArrivalPort,
                               @"totime":self.dataModel.estimatedArrivalDate,
                               @"pid":self.dataModel.nameID,
                               @"spek":self.dataModel.specifications,
                               @"number":self.dataModel.weight,
                               @"unit":self.dataModel.unit,
                               @"price":self.dataModel.price,
                               @"sendplace":self.dataModel.sourcing,
                               @"photos":@[@""]};
        
        XYWeakSelf
        
        
        [self xy_uploadPhotoWithValues:dic Image:self.dataModel.photosArr modelType:nil Path:i_productadd Success:^(__kindof YTKBaseRequest *request, id model) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        } failure:^(NSString *msg, id model) {
            NSLog(@"%@",msg);
        }];
        
        //        NSDictionary * dic = @{@"token":@"token=MzQ5NjNlNmEwMWU3MDIxNGY3ZjNjMTQ2NDM1ZTBlZmU=",
        //                               @"reasons":self.dataModel.reason,
        //                               @"gid":self.dataModel.typeID,
        //                               @"arrivetime":self.dataModel.date,
        //                               @"pid":self.dataModel.nameID,
        //                               @"spek":self.dataModel.specifications,
        //                               @"number":self.dataModel.weight,
        //                               @"unit":self.dataModel.unit,
        //                               @"price":self.dataModel.price,
        //                               @"sendplace":self.dataModel.sourcing,
        //                               @"pics":@[@""]};
        //        [self xy_uploadPhotoWithValues:dic Image:self.dataModel.photosArr modelType:nil Path:@"personal" Success:^(__kindof YTKBaseRequest *request, id model) {
        //            [weakSelf.navigationController popViewControllerAnimated:YES];
        //        } failure:^(NSString *msg, id model) {
        //            NSLog(@"%@",msg);
        //        }];
    }
    
    
}

@end

