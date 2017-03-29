//
//  XYSenderViewController.m
//  
//
//  Created by 中企互联 on 16/6/18.
//
//

#define MAXCOUNT 5
#import "XYSenderViewController.h"

#import "XYTextFieldDetailCell.h"
#import "XYTextFieldCell.h"
#import "XYSubmitCell.h"
#import "XYPhotosCell.h"

#import "XYPhotoBrowser.h"
#import "XYPickerViewModel.h"
#import "SBZCustomDistrictSelectorPickerView.h"

#import "XYProductListViewController.h"

@interface XYSenderViewController ()

@property (nonatomic,strong) NSMutableArray * titleArr;
@property (nonatomic,strong) NSMutableArray * placeHolderArr;
@property (nonatomic,strong) XYPhotoBrowser * PhotoBrowser;
@property (nonatomic,strong) XYSenderModel * dataModel;

@end

@implementation XYSenderViewController

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
    self.title = @"分装发货";
}

- (void)initUI {
    [super initUI];
 
 
    self.titleArr = [NSMutableArray arrayWithArray:@[@[@"果品",@"月份",@"批发地"],
                                                     @[@"目的地",@"发货地",@"车牌号",@"司机电话"],
                                                     @[@"果品等级"],
                                                     @[@"规格",@"发货件数(件)",@"单件成本(元)",@"杂费(元)"],
                                                     @[@"果品图片",@""],
                                                     @[@""],
                                                     ]];
    
    self.placeHolderArr = [NSMutableArray arrayWithArray:@[@[@"请选择果品种类",@"请选择发货时间",@"请选择批发地"],
                                                           @[@"请输入目的地",@"请输入发货地",@"请输入车牌号",@"请输入司机电话"],
                                                           @[@"请选择果品等级"],
                                                           @[@"请输入规格",@"请输入发货件数",@"请输入单件成本",@"请输入其他总计费用",@"请输入"],
                                                           @[@"可添加3~5张图片（可选）",@""],
                                                           @[@""],
                                                           ]];
    self.dataModel = [[XYSenderModel alloc] init];
    self.dataModel.photos = [NSMutableArray array];
    self.PhotoBrowser = [[XYPhotoBrowser alloc]init];
    
}
- (void)initData {
    [super initData];
}
- (void)initNet {
    [super initNet];
    [self xy_postWithValues:nil ModelType:[grade class] Path:i_sendgoodsinfo hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[NSArray class]]) {
            self.mData = [NSMutableArray arrayWithArray:model];
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
    if (indexPath.section == self.titleArr.count - 2 && indexPath.row == 1) {
        return [XYPhotosCell cellHeight];
    }
    return H_TABLECELLDEFAULTHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2 ||section == 4) {
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
            [cell_tf showtopline:NO bottomline:YES jiantou:YES];
            
            switch (indexPath.row ) {
                case 0:
                {
                    [cell_tf setModel:self.dataModel.pname IndexPath:indexPath callBack:nil];
                }
                    break;
                case 1:
                {
                    [cell_tf setModel:self.dataModel.sendtime IndexPath:indexPath callBack:nil];
                }
                    break;
                case 2:
                {
                    [cell_tf setModel:self.dataModel.sendtoplace IndexPath:indexPath callBack:nil];
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
            switch (indexPath.row) {
                case 0:
                {
                    [cell_tf setModel:self.dataModel.sendtoplace IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.dataModel.sendtoplace = x;
                    }];
                }
                    break;
                case 1:
                {
                    [cell_tf setModel:self.dataModel.placeofreceipt IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.dataModel.placeofreceipt = x;
                    }];
                }
                    break;
                case 2:
                {
                    [cell_tf setModel:self.dataModel.carnumber IndexPath:indexPath callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.dataModel.carnumber = x;
                    }];
                }
                    break;
                case 3:
                {
                    cell_tf.rightTextField.keyboardType = UIKeyboardTypeNumberPad;
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
            [cell_tf showtopline:NO bottomline:YES jiantou:YES];
            [cell_tf setModel:self.dataModel.gname IndexPath:indexPath callBack:nil];
            return cell_tf;
        }
            break;
        case 3:
        {
            if (indexPath.row == 0) {
                [cell_tf showtopline:YES bottomline:YES jiantou:NO];
            }else{
                [cell_tf showtopline:NO bottomline:YES jiantou:NO];
            }
            if (self.dataModel) {
                [cell_tf setModel:self.dataModel IndexPath:indexPath callBack:^(NSString* x, NSIndexPath * indexPath) {
                    switch (indexPath.row) {
                        case 0:
                        {
                            weakSelf.dataModel.spec = x ;
                        }
                            break;
                        case 1:
                        {
                            weakSelf.dataModel.unit = x ;
                        }
                            break;
                        case 2:
                        {
                            weakSelf.dataModel.price = x ;
                        }
                            break;
                        case 3:
                        {
                            weakSelf.dataModel.otherprice = x ;
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
                    XYProductListViewController * vc = [[XYProductListViewController alloc] init];
                    vc.block = ^(id x) {
                        if ([x isKindOfClass:[XYSendProductModel class]]) {
                            XYSendProductModel* model = x;
                            weakSelf.dataModel.pname = model.name;
                            weakSelf.dataModel.pid = model.pid;
                            weakSelf.dataModel.maxCount = [NSString stringWithFormat:@"%zd",[model.sum integerValue] - [model.sendunit integerValue]];
                            [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath,[NSIndexPath indexPathForRow:1 inSection:3]] withRowAnimation:UITableViewRowAnimationAutomatic];
                        }
                    };
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                case 1:
                {
                    [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title  andIndexPath:indexPath andDataArr:nil type:PickerTypeDate callBack:^(NSString * x, NSIndexPath * indexPath) {
                        weakSelf.dataModel.sendtime = x;
                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }];
                }
                    break;
                case 2:
                {
                    
                    [SBZCustomDistrictSelectorPickerView instanceWithSuperView:SELFVIEW].block = ^(id x,NSArray * dataArr,NSArray * dataCodeArr) {
                        weakSelf.dataModel.sendtoplace = [NSString stringWithFormat:@"%@%@%@",[dataArr safeObjectAtIndex:0],[dataArr safeObjectAtIndex:1],[dataArr safeObjectAtIndex:2]];
                        weakSelf.dataModel.provinceId = [dataCodeArr safeObjectAtIndex:0];
                        weakSelf.dataModel.cityid = [dataCodeArr safeObjectAtIndex:1];
                        weakSelf.dataModel.districtId = [dataCodeArr safeObjectAtIndex:2];
                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath,[NSIndexPath indexPathForRow:0 inSection:1]] withRowAnimation:UITableViewRowAnimationAutomatic];
                    };
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        { 
            if (indexPath.row == 0) {
                
                if (self.mData.count) {
                   
                    NSMutableArray * iDataArr = [NSMutableArray array];
                    for (grade * model in self.mData) {
                        XYPickerViewModel * pvModel = [[XYPickerViewModel alloc] init];
                        pvModel.xyid = model.xyid;
                        pvModel.name = model.grade;
                        [iDataArr addObject:pvModel];
                    }
                    [XYPickerView createPickerViewOnView:SELFVIEW andTitle:title andIndexPath:indexPath andDataArr:@[iDataArr] type:PickerTypeDefault XYZBlock:^(NSString * x, NSArray * idsArr, NSIndexPath * indexPath) {
                        weakSelf.dataModel.gname = x;
                        weakSelf.dataModel.gid = [idsArr firstObject];
                        [weakSelf.mTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }];
                }
                
            }else{
              
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

#pragma mark -- submit
- (void)submit {
 
    if (isNONE(self.dataModel.pid)) {
        [DialogUtil showDlgAlert:@"请选择果品种类"];
    }else if (isNONE(self.dataModel.sendtime)) {
        [DialogUtil showDlgAlert:@"请选择发货时间"];
    }else if (isNONE(self.dataModel.sendtoplace)) {
        [DialogUtil showDlgAlert:@"请选择批发地"]; 
    } else if (isNONE(self.dataModel.placeofreceipt)) {
        [DialogUtil showDlgAlert:@"请选择发货地"];
    }else if (isNONE(self.dataModel.carnumber)) {
        [DialogUtil showDlgAlert:@"请输入车牌号"];
    }else if (isNONE(self.dataModel.driverphone)) {
        [DialogUtil showDlgAlert:@"请输入司机电话"];
    }else if (isNONE(self.dataModel.gid)) {
        [DialogUtil showDlgAlert:@"请选择果品等级"];
    }else if (isNONE(self.dataModel.spec)) {
        [DialogUtil showDlgAlert:@"请输入规格"]; 
    }else if (isNONE(self.dataModel.unit)) {
        [DialogUtil showDlgAlert:@"请输入发货件数"]; 
    }else if (isNONE(self.dataModel.price)) {
        [DialogUtil showDlgAlert:@"请输入单件成本"]; 
    }else if (isNONE(self.dataModel.otherprice)) {
        [DialogUtil showDlgAlert:@"请输入其他总计费用"]; 
    }
//    else if (self.dataModel.photos.count == 0) {
//        [DialogUtil showDlgAlert:@"请选择图片"];
//        return;
//    }else if (self.dataModel.photos.count < 3) {
//        [DialogUtil showDlgAlert:@"图片数量不能少于3"];
//        return;
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

     */
    
    NSDictionary * dic = @{MTOKEN:m_token,
                           @"pid":self.dataModel.pid,
                           @"sendtoplace":self.dataModel.sendtoplace,
                           @"driverphone":self.dataModel.driverphone,
                           @"placeofreceipt":self.dataModel.placeofreceipt,
                           @"provinceId":self.dataModel.provinceId,
                           @"cityid":self.dataModel.cityid,
                           @"districtId":self.dataModel.districtId,
                           @"sendtime":self.dataModel.sendtime,
                           @"carnumber":self.dataModel.carnumber,
                           @"gid":self.dataModel.gid,
                           @"spec":self.dataModel.spec,
                           @"unit":self.dataModel.unit,
                           @"price":self.dataModel.price,
                           @"otherprice":self.dataModel.otherprice,
                           @"photos":@[@""]};
    
    XYWeakSelf
    [self xy_uploadPhotoWithValues:dic Image:self.dataModel.photos modelType:nil Path:i_sendgoods Success:^(__kindof YTKBaseRequest *request, id model) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    } failure:^(NSString *msg, id model) {
        NSLog(@"%@",msg);
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
