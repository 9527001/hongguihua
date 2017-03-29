//
//  XYSaleViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYSaleViewController.h"

#import "XYTextFieldCell.h"
#import "XYSubmitCell.h"

#import "XYSaleProductListViewController.h"
@interface XYSaleViewController ()

@property (nonatomic,strong) NSArray * titleArr;
@property (nonatomic,strong) NSArray * placeHolderArr;
@property (nonatomic,strong) XYSaleModel * dataModel;

@end

@implementation XYSaleViewController

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
    self.title = @"出售消息";
}

- (void)initUI {
    [super initUI];
    self.titleArr = @[@[@"名称",@"规格"],
                      @[@"单价(元)",@"件数"],
                      @[@"剩余库存(件)"],
                      @[@"车次"],
                      @[@""],
                      ];
    self.placeHolderArr = @[@[@"请选择商品",@""],
                            @[@"请输入价格",@"请输入件数"],
                            @[@"",@""], 
                            ];
    
    self.dataModel = [[XYSaleModel alloc] init];
    
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
    return H_TABLECELLDEFAULTHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == self.titleArr.count -2 ) {
        return 30.f;
    }
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYTextFieldCell *cell_tf = [tableView dequeueReusableCellWithIdentifier:@"XYTextFieldCell"];
    XYSubmitCell *submitCell = [tableView dequeueReusableCellWithIdentifier:@"XYSubmitCell"]; 
    XYWeakSelf
    if (self.titleArr.count&&self.placeHolderArr.count) {
        [cell_tf.leftLabel setText:[[self.titleArr safeObjectAtIndex:indexPath.section] safeObjectAtIndex:indexPath.row]];
        [cell_tf.rightTextField setPlaceholder:[[self.placeHolderArr safeObjectAtIndex:indexPath.section] safeObjectAtIndex:indexPath.row]];
    }
    switch (indexPath.section) {
        case 0:
        {
            [cell_tf showtopline:NO bottomline:YES jiantou:YES];
            switch (indexPath.row) {
                case 0:
                {
                    [cell_tf.rightTextField setText:self.dataModel.name];
                }
                    break;
                case 1:
                {
                    [cell_tf.rightTextField setText:self.dataModel.spec];
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
            switch (indexPath.row) {
                case 0:
                {
                    cell_tf.rightTextField.keyboardType = UIKeyboardTypeDecimalPad;
                    cell_tf.tfType = demical;
                    [cell_tf setModel:self.dataModel.price IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * y) {
                        weakSelf.dataModel.price = x;
                    }];
                }
                    break;
                case 1:
                {
                    [cell_tf setModel:self.dataModel IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * y) {
                        weakSelf.dataModel.sunit = x;
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
            [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            [cell_tf setModel:self.dataModel.stock IndexPath:indexPath callBack:nil];
            [cell_tf.rightTextField setEnabled:NO];
            return cell_tf;
        }
            break;
        case 3:
        {
            [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            [cell_tf setModel:self.dataModel.carNumber IndexPath:indexPath callBack:nil];
            [cell_tf.rightTextField setEnabled:YES];
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
     XYWeakSelf
    switch (indexPath.section) {
            
        case 0:
        {
            XYSaleProductListViewController * vc = [[XYSaleProductListViewController alloc] init];
            vc.block = ^(id x) {
                if ([x isKindOfClass:[XYSaleProductModel class]]) {
                    XYSaleProductModel* model = x;
                    weakSelf.dataModel.xyid = model.xyid;
                    weakSelf.dataModel.name = model.name;
                    weakSelf.dataModel.spec = model.spec;
                    weakSelf.dataModel.stock = [NSString stringWithFormat:@"%zd",[model.gunit integerValue] - [model.sellnumbers integerValue]];
                    weakSelf.dataModel.carNumber = [NSString stringWithFormat:@"%@-%@",model.cars,model.carnumber];
                    [weakSelf.mTableView reloadData];
                }
            };
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}
#pragma mark -- tool
-(void)submit:(NSString *)status {
    
    if (self.dataModel) {
        if (isNONE(self.dataModel.xyid)) {
            [DialogUtil showDlgAlert:@"请选择商品"];
            return;
        }else if (isNONE(self.dataModel.price)) {
            [DialogUtil showDlgAlert:@"请输入价格"];
            return;
        }else if (isNONE(self.dataModel.sunit)) {
            [DialogUtil showDlgAlert:@"请输入件数"];
            return;
        } else {
            [self upload];

        }
    }
    
}
- (void)upload {
    /**
     *
     token	用户唯一标示
     id	收货列表id
     price	出售价格
     sunit	出售件数
     */
    
    NSDictionary * dic = @{MTOKEN:m_token,
                           @"id":self.dataModel.xyid,
                           @"price":self.dataModel.price,
                           @"sunit":self.dataModel.sunit,
                           };
    
    XYWeakSelf
    [self xy_postWithValues:dic ModelType:nil Path:i_sellgoods hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        
        [weakSelf.navigationController popViewControllerAnimated:YES];
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
