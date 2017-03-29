//
//  XYSenderProductVC.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/21.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//



#define MAXCOUNT 5
#import "XYSenderProductVC.h"


#import "XYTextFieldDetailCell.h"
#import "XYTextFieldCell.h"
#import "XYSubmitCell.h"

#import "XYPhotoBrowser.h"
#import "XYPickerViewModel.h"
#import "XYAPInfoModel.h"
#import "SBZCustomDistrictSelectorPickerView.h"



@interface XYSenderProductVC ()

@property (nonatomic,strong) NSMutableArray * titleArr;
@property (nonatomic,strong) NSMutableArray * placeHolderArr;

@property (nonatomic,strong) XYSenderProductModel * dataModel;
@property (nonatomic,strong) NSMutableArray * dataArr;
@property (nonatomic,assign) BOOL isEdit;
@property (nonatomic,assign) BOOL isNew;
@property (nonatomic,assign) NSInteger index;
@end

@implementation XYSenderProductVC

- (instancetype)initWithType:(BOOL)isEdit dataArr:(NSMutableArray *)arr index:(NSInteger)index {
    if (self = [super init]) {
        _isEdit = isEdit;
        _dataArr = arr;
        _index = index;
        if (!isEdit) {//新增
            self.dataModel = [[XYSenderProductModel alloc] init];
        }else {
            self.dataModel = [arr safeObjectAtIndex:index];
            [self showBarButton:NAV_RIGHT title:@"删除" fontColor:COLOR_GRAY_2];
        }
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)initNavigationBar {
    [super initNavigationBar];
    self.title = @"分装发货";
}
- (void)initNet {
    [self xy_postWithValues:nil ModelType:[product class] Path:i_get_product_list hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[NSArray class]]) {
            self.mData = [NSMutableArray arrayWithArray:model];
        }
    } failure:^(NSString *msg, id model) {
        
    }];
}

- (void)initData {
    [super initData];
    
    self.titleArr = [NSMutableArray arrayWithArray:@[@[@"水果品种",@"水果等级"],
                                                     @[@"发货件数",@"单件成本"],
                                                     @[@"保存记录并返回"],
                                                     @[@"保存并新增记录"],
                                                     ]];
    
    self.placeHolderArr = [NSMutableArray arrayWithArray:@[@[@"请选择水果品种",@"请输入水果等级"],
                                                           @[@"请输入发货件数",@"请输入单件成本"],
                                                           @[@"",],
                                                           @[@""],
                                                           ]];
}

- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self frame:self.view.bounds];
    self.mTableView.showsVerticalScrollIndicator = NO;
    [self.mTableView registerNib:@"XYTextFieldCell"];
    [self.mTableView registerNib:@"XYSubmitCell"];
    
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
    
    switch (indexPath.section) {
        case 2:
        case 3:
            return 30.f;
            break;
        default:
            return H_TABLECELLDEFAULTHEIGHT;
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    switch (section) {
        case 1:
            return 30.f;
        case 2:
            return 20.f;
            break;
        default:
            return 0.1f;
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYTextFieldCell *cell_tf = [tableView dequeueReusableCellWithIdentifier:@"XYTextFieldCell"];
    XYSubmitCell *SubmitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"];
     XYWeakSelf
    NSArray * titleArr_temp = [self.titleArr safeObjectAtIndex:indexPath.section];
    NSArray * placeHolderArr_temp = [self.placeHolderArr safeObjectAtIndex:indexPath.section];
    NSString * title = [titleArr_temp safeObjectAtIndex:indexPath.row];
    NSString * placeHolder = [placeHolderArr_temp safeObjectAtIndex:indexPath.row];
    [cell_tf.leftLabel setText:title];
    [cell_tf.rightTextField setPlaceholder:placeHolder];
    
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row ) {
                case 0:
                {
                    [cell_tf showtopline:NO bottomline:YES jiantou:YES];
                    [cell_tf setModel:self.dataModel.product IndexPath:indexPath callBack:nil];
                }
                    break;
                case 1:
                {
                    cell_tf.tfType = defult;
                    [cell_tf showtopline:NO bottomline:YES jiantou:NO];
                    [cell_tf setModel:self.dataModel.level_name IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.dataModel.level_name = x;
                    }];
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
            [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            cell_tf.tfType = pureNumber;
            switch (indexPath.row) {
                case 0:
                {
                    cell_tf.tfType = pureNumber;
                    [cell_tf setModel:self.dataModel.num IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.dataModel.num = x;
                    }];
                }
                    break;
                case 1:
                {
                    cell_tf.tfType = demical;
                    [cell_tf setModel:self.dataModel.cost IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.dataModel.cost = x;
                    }];
                }
                    break;
                    
                default:
                    break;
            }
            return cell_tf;
        }
            break;
        default:
        {
            [SubmitCell setTitle:title titleColor:COLOR_WHITE backColor:COLOR_BLUE space:XY_M_SCREEN_W /3 * 0.5f enable:NO];
  
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
                    
                    if (!self.mData) {
                        return;
                    }
                    NSMutableArray * arr_temp = [NSMutableArray array];
                    for (product * model in self.mData) {
                        XYPickerViewModel * model_temp = [[XYPickerViewModel alloc]init];
                        model_temp.xyid = model.xyid;
                        model_temp.name = model.name;
                        [arr_temp addObject:model_temp];
                    }
                    
                    [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title andIndexPath:indexPath andDataArr:@[arr_temp] type:PickerTypeModelNeedIndex XYZBlock:^(id x, NSNumber * y, NSIndexPath * indexPath) {
                        weakSelf.dataModel.product = x;
                        product * model = [self.mData safeObjectAtIndex:[y integerValue]];
                        weakSelf.dataModel.product_id = model.xyid;
                        
                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath,[NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }];
                    

                }
                    break;
//                case 1:
//                {
//                    
//                    NSArray * arr = @[@"一等级",@"二等级",@"三等级",@"四等级",@"五等级"];
//                    [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title andIndexPath:indexPath andDataArr:@[arr] type:PickerTypeDefault XYZBlock:^(NSString * x, NSArray * idsArr, NSIndexPath * indexPath) {
//                        weakSelf.dataModel.level_name = x;
//                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//                    }];
//                }
//                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            //保存记录并返回
            [self submit:YES];
        }
            break;
        case 3:
        {
            
            //保存并新增记录
            [self submit:NO];
            
        }
            break;
        default:
            break;
    }
}

#pragma mark -- submit
- (void)submit:(BOOL)isBack {
    /*
     @[@[@"水果品种",@"水果等级"],
     @[@"发货件数",@"单件成本"],
     @[@"保存记录并返回"],
     @[@"保存并新增记录"],
     ]
     */
    if (isNONE(self.dataModel.product)) {
        [DialogUtil showDlgAlert:@"请选择水果品种"];
    }else if (isNONE(self.dataModel.level_name)) {
        [DialogUtil showDlgAlert:@"请选择水果等级"];
    }else if (isNONE(self.dataModel.num)) {
        [DialogUtil showDlgAlert:@"请输入发货件数"];
    }else if (isNONE(self.dataModel.cost)) {
        [DialogUtil showDlgAlert:@"请输入单件成本"];
    }
    else{
        if (_isEdit) {
            if (isBack) {
                [self.dataArr replaceObjectAtIndex:_index withObject:self.dataModel];
                if (self.block) {
                    self.block(self.dataArr,nil);
                }
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                if (self.isNew) {
                    XYSenderProductModel * model = self.dataModel;
                    [self.dataArr addObject:model];
                    self.dataModel = [[XYSenderProductModel alloc]init];
                    [self.mTableView reloadData];
                    
                }else{
                    [self.dataArr replaceObjectAtIndex:_index withObject:self.dataModel]; 
                    self.dataModel = [[XYSenderProductModel alloc]init];
                    [self.mTableView reloadData];
                    self.isNew = YES;
                }
            }
        }else{
            if (isBack) {
                [self.dataArr addObject:self.dataModel];
                if (self.block) {
                    self.block(self.dataArr,nil);
                }
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                XYSenderProductModel * model = self.dataModel;
                [self.dataArr addObject:model];
                self.dataModel = [[XYSenderProductModel alloc]init];
                [self.mTableView reloadData];
            }
        }
     
    }
}

- (void)leftButtonTouch:(UIButton *)sender {
    if (self.block) {
        self.block(self.dataArr,nil);
    }
    [super leftButtonTouch:sender];
}
- (void)rightButtonTouch:(UIButton *)sender {
    [self.dataArr removeObjectAtIndex:_index];
    self.dataModel = [[XYSenderProductModel alloc]init];
    [self.mTableView reloadData];
    
}

@end
