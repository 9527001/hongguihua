//
//  XYAskForLeaveViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/8.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYAskForLeaveViewController.h"

#import "XYTextFieldDetailCell.h"
#import "XYTextFieldCell.h"
#import "XYSubmitCell.h"

@interface XYAskForLeaveViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray * titleArr;
@property (nonatomic,strong) NSArray * placeHolderArr;
@property (nonatomic,strong) NSMutableArray * dataArr;
@property (nonatomic,strong) NSArray * typeArr;



@end

@implementation XYAskForLeaveViewController

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
    self.titleArr = @[@[@"请假类型",@"开始时间",@"结束时间"],@[@"请假天数"],@[@"请假事由"]];
    self.placeHolderArr = @[@[@"如：病假，事假（必填）",@"请选择开始时间（必填）",@"请选择结束时间（必填）"],@[@"请输入请假天数"],@[@"请输入请假事由（必填）"]];
    self.typeArr = @[@[@"事假",@"病假",@"年假",@"调休",@"婚假",@"产假",@"陪产假",@"路程假",@"其他"]];
}

- (void)initData {
    [super initData];
    NSMutableArray * arrUp = [NSMutableArray arrayWithArray:@[@"",@"",@""]];
    NSMutableArray * arrMiddle = [NSMutableArray arrayWithArray:@[@""]];
    NSMutableArray * arrDown = [NSMutableArray arrayWithArray:@[@""]];
    self.dataArr = [NSMutableArray arrayWithArray:@[arrUp,arrMiddle,arrDown]];
}

- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self frame:self.view.bounds];
    [self.mTableView registerNib:@"XYTextFieldDetailCell"];
    [self.mTableView registerNib:@"XYTextFieldCell"];
    [self.mTableView registerNib:@"XYSubmitCell"];
    [self.mTableView.tableFooterView setBackgroundColor:[UIColor clearColor]];
}

#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3 + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 3;
            break;
            
        default:
            return 1;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return 80.f;
    }
    if (indexPath.section == 3) {
        return 50.f;
    }
    return H_TABLECELLDEFAULTHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0||section == 2) {
        return 20.f;
    }
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYWeakSelf
    XYTextFieldCell *cell_tf = [tableView dequeueReusableCellWithIdentifier:@"XYTextFieldCell"];
    XYTextFieldDetailCell *cell_tfd = [tableView dequeueReusableCellWithIdentifier:@"XYTextFieldDetailCell"];
    XYSubmitCell *SubmitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"];
    
    if (self.titleArr.count && self.placeHolderArr.count) {
        [cell_tf.leftLabel setText:[[self.titleArr safeObjectAtIndex:indexPath.section] safeObjectAtIndex:indexPath.row]];
        [cell_tfd.leftLabel setText:[[self.titleArr safeObjectAtIndex:indexPath.section] safeObjectAtIndex:indexPath.row]];
        [cell_tf.rightTextField setPlaceholder:[[self.placeHolderArr safeObjectAtIndex:indexPath.section] safeObjectAtIndex:indexPath.row]];
        [cell_tfd.rightLabel setText:[[self.placeHolderArr safeObjectAtIndex:indexPath.section] safeObjectAtIndex:indexPath.row]];
    }
   
    
    if (self.dataArr.count) {
        NSString * str = [[self.dataArr safeObjectAtIndex:indexPath.section] safeObjectAtIndex:indexPath.row];
        [cell_tf setModel:str IndexPath:indexPath callBack:^(NSString* x, NSIndexPath * indexPath) {
            id obj = [weakSelf.dataArr safeObjectAtIndex:indexPath.section];
            if ([obj isKindOfClass:[NSArray class]]) {
                [obj replaceObjectAtIndex:indexPath.row withObject:x];
            }
        }];
        
         [cell_tfd setModel:str IndexPath:indexPath callBack:^(NSString* x, NSIndexPath * indexPath) {
            id obj = [weakSelf.dataArr safeObjectAtIndex:indexPath.section];
            if ([obj isKindOfClass:[NSArray class]]) {
                [obj replaceObjectAtIndex:indexPath.row withObject:x];
            }
        }];
    }
    switch (indexPath.section) {
        case 0:
        {
            [cell_tf showtopline:NO bottomline:YES jiantou:YES];
            return cell_tf;
        }
            break;
        case 1:
        {
            [cell_tf showtopline:YES bottomline:YES jiantou:NO];
            cell_tf.tfType = demical;
            cell_tf.rightTextField.keyboardType = UIKeyboardTypeDecimalPad;
            return cell_tf;
        }
            break;
        case 2:
        {
            [cell_tfd showtopline:NO bottomline:YES];
            return cell_tfd;
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
    
    XYWeakSelf
    if (indexPath.section == 0) {
        [self.view endEditing:YES];
        switch (indexPath.row) {
            case 0:
            {
                [XYPickerView createPickerViewOnView:SELFVIEW andTitle:@"请选择请假类型" andIndexPath:indexPath andDataArr:self.typeArr type:PickerTypeDefault XYZBlock:^(NSString * x, NSArray * idsArr, NSIndexPath * indexPath) {
                    id obj = [weakSelf.dataArr safeObjectAtIndex:indexPath.section];
                    if ([obj isKindOfClass:[NSArray class]]) {
                        [obj replaceObjectAtIndex:indexPath.row withObject:x];
                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }
                }];
            }
                break;
            case 1:
            {
                [XYPickerView createPickerViewOnView:SELFVIEW andTitle:@"请选择开始时间" andIndexPath:indexPath andDataArr:nil type:PickerTypeDate XYZBlock:^(NSString * x, NSArray * idsArr, NSIndexPath * indexPath) {
                    id obj = [weakSelf.dataArr safeObjectAtIndex:indexPath.section];
                    if ([obj isKindOfClass:[NSArray class]]) {
                        [obj replaceObjectAtIndex:indexPath.row withObject:x];
                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }
                }];
            }
                break;
            case 2:
            {
                [XYPickerView createPickerViewOnView:SELFVIEW andTitle:@"请选择结束时间" andIndexPath:indexPath andDataArr:nil type:PickerTypeDate XYZBlock:^(NSString * x, NSArray * idsArr, NSIndexPath * indexPath) {
                    id obj = [weakSelf.dataArr safeObjectAtIndex:indexPath.section];
                    if ([obj isKindOfClass:[NSArray class]]) {
                        [obj replaceObjectAtIndex:indexPath.row withObject:x];
                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }
                }];
            }
                break;
                
            default:
                break;
        }
     
    }
    
}

#pragma mark -- tool
- (void)submit {
    if (self.dataArr.count) {
 
        NSString * leavetype = [[self.dataArr safeObjectAtIndex:0] safeObjectAtIndex:0];
        NSString *starttime = [[self.dataArr safeObjectAtIndex:0] safeObjectAtIndex:1];
        NSString *endtime = [[self.dataArr safeObjectAtIndex:0] safeObjectAtIndex:2];
        NSString *numberday = [[self.dataArr safeObjectAtIndex:1] safeObjectAtIndex:0];
        NSString *content = [[self.dataArr safeObjectAtIndex:2] safeObjectAtIndex:0]; ;
        if (isNONE(leavetype)) {
            [DialogUtil showDlgAlert:@"请输入请假类型"];
            return;
        }else if (isNONE(starttime)){
            [DialogUtil showDlgAlert:@"请选择开始时间"];
            return;
        }else if (isNONE(endtime)){
            [DialogUtil showDlgAlert:@"请选择结束时间"];
            return;
        }else if (isNONE(numberday)){
            [DialogUtil showDlgAlert:@"请输入请假天数"];
            return;
        }else if (isNONE(content)){
            [DialogUtil showDlgAlert:@"请输入请假事由"];
            return;
        }else{
            NSDictionary * dic = @{@"token":m_token,
                                   @"leavetype":leavetype,
                                   @"starttime":starttime,
                                   @"endtime":endtime,
                                   @"numberday":numberday,
                                   @"content":content,};
            XYWeakSelf
            [self xy_postWithValues:dic ModelType:nil Path:i_leave hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
                [weakSelf.navigationController popViewControllerAnimated:YES];
            } failure:^(NSString *msg, id model) {
                
            }];
        }
       
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
