//
//  XYConfirmReceiveViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYConfirmReceiveViewController.h"

#import "XYTextFieldDetailCell.h"
#import "XYTextFieldCell.h"
#import "XYSubmitCell.h"
#import "XYPhotosCell.h"
#import "XYSubmitSelectorCell.h"

#import "XYPickerViewModel.h"
#import "XYConfirmModel.h"

@interface XYConfirmReceiveViewController ()

@property (nonatomic,strong) NSArray * titleArr;
@property (nonatomic,strong) NSArray * placeHolderArr;
@property (nonatomic,strong) XYConfirmModel * dataModel;

@end

@implementation XYConfirmReceiveViewController

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
    self.title = @"实际收货";
}

- (void)initUI {
    [super initUI];
    self.titleArr = @[@[@"名称",@"规格"],
                      @[@"收货件数"],
                      @[@"图片",@""],
                      @[@"杂费(元)"],
                      @[@"车次"],
                      @[@"到货日期"],
                      @[@"到货重量(吨)"],
                      @[@""],
                      ];
//    self.placeHolderArr = @[@[@"请输入申请事由",@""],
//                            @[@"请输入收货件数"],
//                            @[@""],
//                            @[@"请输入其他费用"],
//                            @[@"请输入车次"],
//                            @[@"请选择发货时间"],
//                            @[@"请输入实际到货重量"],
//                            ];
    
    self.placeHolderArr = @[@[@"请输入申请事由",@""],
                            @[[NSString stringWithFormat:@"发货件数为%@",self.lModel.unit]],
                            @[@""],
                            @[@"请输入其他费用"],
                            @[@"请输入车次"],
                            @[@"请选择发货时间"],
                            @[@"请输入实际到货重量"],
                            ];
    self.dataModel = [[XYConfirmModel alloc] init];
    
}
- (void)initData {
    [super initData];
}
- (void)initNet {
    [super initNet];
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
        return 55.f;
    }
    if (indexPath.section == 2 && indexPath.row == 1) {
        return [XYPhotosCell cellHeight];
    }
    return H_TABLECELLDEFAULTHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2 ||section == self.titleArr.count -2) {
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
            switch (indexPath.row) {
                case 0:
                {
                    [cell_tf.rightTextField setText:self.lModel.name];
                }
                    break;
                case 1:
                {
                    [cell_tf.rightTextField setText:self.lModel.spec];
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
            cell_tf.rightTextField.keyboardType = UIKeyboardTypeNumberPad;
            cell_tf.tfType = pureNumber;
            [cell_tf setModel:self.dataModel.unit IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * y) {
                weakSelf.dataModel.unit = x;
            }];
            return cell_tf;
        }
            break;
        case 2:
        {
            if (indexPath.row == 0) {
                [cell_tf showtopline:NO bottomline:YES jiantou:NO];
                return cell_tf;
            }else{
                if ([self.lModel.photos isKindOfClass:[NSString class]]) {
                    NSArray * arr = [self.lModel.photos componentsSeparatedByString:@","]; 
                    [cell_photo setModel:arr IndexPath:indexPath callBack:nil];
                }
                return cell_photo;
            }
        }
            break;
        case 3:
        {
            [cell_tf showtopline:YES bottomline:YES jiantou:NO];
            cell_tf.rightTextField.keyboardType = UIKeyboardTypeDecimalPad;
            cell_tf.tfType = demical;
            if (self.dataModel) {
                [cell_tf setModel:self.dataModel.otherprice IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                    weakSelf.dataModel.otherprice = x;
                }];
            }
            return cell_tf;
        }
            break;
        case 4:
        {
            [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            NSString * mode = [NSString stringWithFormat:@"%@-%@",self.lModel.cars,self.lModel.carnumber];
            [cell_tf setModel:mode IndexPath:indexPath callBack:nil];
            [cell_tf.rightTextField endEditing:YES];
            return cell_tf;
            
        }
            break;
        case 5:
        {
            [cell_tf showtopline:NO bottomline:YES jiantou:YES];
            [cell_tf setModel:self.dataModel.arrivetime IndexPath:indexPath callBack:nil];
            return cell_tf;
            
        }
            break;
        case 6:
        {
            [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            cell_tf.rightTextField.keyboardType = UIKeyboardTypeDecimalPad;
            cell_tf.tfType = demical;
            [cell_tf setModel:self.dataModel.weight IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                weakSelf.dataModel.weight = x;
            }];
            return cell_tf;
            
        }
            break;
        default:
        {
            [submitCell setTitle:@"确认" titleColor:COLOR_WHITE backColor:COLOR_BLUE space:50 enable:YES callBack:^(id x) {
                
                [weakSelf submit:nil];
                
            }];
            
            return submitCell;
        }
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    XYWeakSelf
    NSString * title = [[self.placeHolderArr safeObjectAtIndex:indexPath.section] safeObjectAtIndex:indexPath.row];
    switch (indexPath.section) {
           
        case 5:
        {
            [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title  andIndexPath:indexPath andDataArr:nil type:PickerTypeDate callBack:^(NSString * x, NSIndexPath * indexPath) {
                weakSelf.dataModel.arrivetime = x;
                [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }];
        }
            break;
        default:
            break;
    }
}
#pragma mark -- tool
-(void)submit:(NSString *)status {
    if (self.dataModel &&self.lModel) {
        if (isNONE(self.lModel.xyid)) {
            [DialogUtil showDlgAlert:@"网络异常"];
            [self.navigationController popViewControllerAnimated:YES];
            return;
        }else if (isNONE(self.dataModel.unit)) {
            [DialogUtil showDlgAlert:@"请输入实际到货件数"];
            return;
        }else if (isNONE(self.dataModel.otherprice)) {
            [DialogUtil showDlgAlert:@"请输入杂费"];
            return;
        } else if (isNONE(self.dataModel.arrivetime)) {
            [DialogUtil showDlgAlert:@"请输入到货日期"];
            return;
        }else if (isNONE(self.dataModel.weight)) {
            [DialogUtil showDlgAlert:@"请到货重量"];
            return;
        }else {
            [self upload];
            
        }
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
     */
    
    NSDictionary * dic = @{MTOKEN:m_token,
                           @"sid":self.lModel.xyid,
                           @"unit":self.dataModel.unit,
                           @"otherprice":self.dataModel.otherprice,
                           @"arrivetime":self.dataModel.arrivetime,
                           @"weight":self.dataModel.weight,
                           };
    
    XYWeakSelf
    [self xy_postWithValues:dic ModelType:nil Path:i_getgoods hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        
        NSArray * arr =  weakSelf.navigationController.viewControllers;
        [weakSelf.navigationController popToViewController:[arr safeObjectAtIndex:arr.count - 3] animated:YES];
    } failure:^(NSString *msg, id model) {
        
    }];
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
