//
//  XYAddressBookViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYAddressBookViewController.h"

#import "ContactModel.h"
@interface XYAddressBookViewController () 

@end

@implementation XYAddressBookViewController

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
    self.title = @"通讯录";
}
- (void)initData {
    [super initData];

}
- (void)initNet {
    [super initNet];
    XYWeakSelf
    [self xy_postWithValues:nil ModelType:[XYAddressBookModel class] Path:i_directory hud:@"加载成功" Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[NSArray class]]) {
            NSMutableArray * dataArr = [NSMutableArray array];
            for (XYAddressBookModel * abmodel in model) {
                ContactModel * cModel = [[ContactModel alloc]init];
                cModel.portrait = abmodel.mobile;
                cModel.name = abmodel.username;
                [dataArr addObject:cModel];
            }
            weakSelf.dataArr = dataArr; 
        }
    } failure:^(NSString *msg, id model) {
        
    }];
 
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (XY_IS_PAD) {
        if (XY_IS_IOS7_BEFORE) {
            [DialogUtil showDlgAlert:@"当前版本不是iOS8.0及以上版本，不支持电话功能"];
            return;
        }
        
    }
    ContactModel *model=_rowArr[indexPath.section][indexPath.row];
//    [SysTool PhoneCall:model.portrait];
    
    [SysTool makePhoneCall:model.portrait type:back];
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
