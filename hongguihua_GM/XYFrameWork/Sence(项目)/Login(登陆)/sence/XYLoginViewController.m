//
//  XYLoginViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/3.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYLoginViewController.h"

#import "XYLoginXYView.h"
#import "XYNavigationController.h"

@interface XYLoginViewController ()

@property (nonatomic,assign) BOOL isPresent;
@end

@implementation XYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNavigationBar {
    [super initNavigationBar];
    self.title = @"登陆";
}

- (void)initUI {
    [super initUI];
//    UIScrollView * scr = [[UIScrollView alloc]init];
//    [self.view addSubview:scr];
//    [scr mas_makeConstraints:^(MASConstraintMaker *make) {
//         make.edges.equalTo(self.view);
//    }];
   XYLoginXYView * login = [XYLoginXYView xy_xib];
    [self.view addSubview:login];
    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    XYWeakSelf
    login.block = ^(NSString *name ,NSString * code ,id z){
        
        [weakSelf login:name password:code];
    };
   
}

- (void)login:(NSString *)account password:(NSString *)password {
    if (isNONE(account)) {
        [DialogUtil showDlgAlert:@"请输入账号"];
        return;
    }else if (isNONE(password)) {
        [DialogUtil showDlgAlert:@"请输入密码"];
        return;
    }else {
        NSDictionary *dic = @{@"loginname":account,@"passwd":password };
        XYWeakSelf
        [self xy_postWithValues:dic ModelType:[UserModel class] Path:i_login hud:@"登陆中..." Success:^(__kindof YTKBaseRequest *request, id model) {
            [weakSelf loginSuccess:model];
        } failure:^(NSString *msg, id model) {
            
        }];
    }
  
}

- (void)loginSuccess:(id)model {
    [XYCenter saveLoginData:model];
    if (self.isPresent) {
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else{
        
        XYTabBarController *c = [[XYTabBarController alloc] init];
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        [window setRootViewController:c];
        [self removeFromParentViewController];
    }
    
    
}

+ (void)login {
    
    XYLoginViewController * vc = [[XYLoginViewController alloc] init];
    XYNavigationController * nav = [[XYNavigationController alloc] initWithRootViewController:vc];
    UIWindow * widow = [[UIApplication sharedApplication] keyWindow];
    [widow.rootViewController presentViewController:nav animated:YES completion:nil];
    
}

@end
