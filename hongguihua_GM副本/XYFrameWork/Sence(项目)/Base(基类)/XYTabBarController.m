////
////  XYTabBarController.m
////  XYFrameWork
////
////  Created by xiaoyao on 16/4/14.
////  Copyright © 2016年 xiaoyao. All rights reserved.
////
//
#import "XYTabBarController.h"

#import "XYNavigationController.h"
#import "XYHomeViewController.h"
#import "XYAddressBookViewController.h"
#import "XYMessageViewController.h"
#import "XYMineViewController.h"

#import "XYCenter.h"
//#import "DWTabBar.h"

//#import "MenuLabel.h"
//#import "HyPopMenuView.h"
//#import <POP.h>

//#define Objs @[[MenuLabel CreatelabelIconName:@"tabbar_compose_idea" Title:@"文字"],[MenuLabel CreatelabelIconName:@"tabbar_compose_photo" Title:@"相册"],[MenuLabel CreatelabelIconName:@"tabbar_compose_camera" Title:@"拍摄"],[MenuLabel CreatelabelIconName:@"tabbar_compose_lbs" Title:@"签到"],[MenuLabel CreatelabelIconName:@"tabbar_compose_review" Title:@"点评"],[MenuLabel CreatelabelIconName:@"tabbar_compose_more" Title:@"更多"],]

#pragma mark -
#pragma mark - Life Cycle
@interface XYTabBarController ()

@property (nonatomic,strong) UITabBarItem * messageBarItem;

@end

@implementation XYTabBarController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    // 设置CGRectZero从导航栏下开始计算
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    // 设置 TabBarItemTestAttributes 的颜色。
    [self setUpTabBarItemTextAttributes];
    
    // 设置子控制器
    [self setUpChildViewController];
    
    // 处理tabBar，使用自定义 tabBar 添加 发布按钮
    //    [self setUpTabBar];
    
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    //    WS(weakSelf);
    //    //注册通知
    //    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:NOTIFICATION_MORE object:nil] subscribeNext:^(NSNotification *notification) {
    //        [weakSelf ShowMenu:notification];
    //    }];
    
    
}

#pragma mark -
#pragma mark - Private Methods
/**
 *  点击tabbar加号按钮
 */
- (void)ShowMenu:(id)sender
{
    //    CGFloat x,y,w,h;
    //    x = CGRectGetWidth(self.view.bounds)/2 - 213/2;
    //    y = CGRectGetHeight([UIScreen mainScreen].bounds)/2 * 0.3f;
    //    w = 213;
    //    h = 57;
    //    //自定义的头部视图
    //    UIImageView *topView = [[ImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    //    topView.image = [UIImage imageNamed:@"compose_slogan"];
    //    topView.contentMode = UIViewContentModeScaleAspectFit;
    //
    //    NSMutableDictionary *AudioDictionary = [NSMutableDictionary dictionary];
    //
    //    //添加弹出菜单音效
    //    [AudioDictionary setObject:@"composer_open" forKey:kHyPopMenuViewOpenAudioNameKey];
    //    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewOpenAudioTypeKey];
    //    //添加取消菜单音效
    //    [AudioDictionary setObject:@"composer_close" forKey:kHyPopMenuViewCloseAudioNameKey];
    //    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewCloseAudioTypeKey];
    //    //添加选中按钮音效
    //    [AudioDictionary setObject:@"composer_select" forKey:kHyPopMenuViewSelectAudioNameKey];
    //    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewSelectAudioTypeKey];
    //
    //    [HyPopMenuView CreatingPopMenuObjectItmes:Objs TopView:topView /*nil*/OpenOrCloseAudioDictionary:AudioDictionary /*nil*/ SelectdCompletionBlock:^(MenuLabel *menuLabel, NSInteger index) {
    //        NSLog(@"index:%ld ItmeNmae:%@",index,menuLabel.title);
    //    }];
}

- (BOOL)prefersStatusBarHidden

{
    
    return YES;
    
}

/**
 *  利用 KVC 把 系统的 tabBar 类型改为自定义类型。
 */
//- (void)setUpTabBar{
//
//    [self setValue:[[DWTabBar alloc] init] forKey:@"tabBar"];
//}


/**
 *  tabBarItem 的选中和不选中文字属性
 */
- (void)setUpTabBarItemTextAttributes{
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateHighlighted];
    
}


/**
 *  添加子控制器，我这里值添加了4个，没有占位自控制器
 */
- (void)setUpChildViewController{
    XYViewController *firstViewController = [[XYHomeViewController alloc] init];
    XYNavigationController *nav1 = [[XYNavigationController alloc] initWithRootViewController:firstViewController];
    
    XYViewController *secondViewController = [[XYAddressBookViewController alloc] init];
    XYNavigationController *nav2 = [[XYNavigationController alloc] initWithRootViewController:secondViewController];
    XYViewController *thirdViewController = [[XYMessageViewController alloc] init];
    
    XYNavigationController *nav3 = [[XYNavigationController alloc] initWithRootViewController:thirdViewController];
    _messageBarItem = nav3.tabBarItem;
//    XYViewController *fouthViewController = [[XYViewController alloc] init];
//    XYNavigationController *nav4 = [[XYNavigationController alloc] initWithRootViewController:fouthViewController];
    
    XYViewController *fifthViewController = [[XYMineViewController alloc] init];
//    fifthViewController.NavBarHidden = YES;
    XYNavigationController *nav5 = [[XYNavigationController alloc] initWithRootViewController:fifthViewController];
    [self addOneChildViewController:nav1
                          WithTitle:@"首页"
                          imageName:@"home_首页_首页-1"
                  selectedImageName:@"home_首页_首页"];
    
    [self addOneChildViewController:nav2
                          WithTitle:@"通讯录"
                          imageName:@"home_通讯录"
                  selectedImageName:@"home_通讯录-1"];
    
    
    [self addOneChildViewController:nav3
                          WithTitle:@"消息"
                          imageName:@"home_消息"
                  selectedImageName:@"home_消息-1"];
    
    
//    [self addOneChildViewController:nav4
//                          WithTitle:@"购物车"
//                          imageName:@"tab-购物车"
//                  selectedImageName:@"tab-购物车1"];
    
    [self addOneChildViewController:nav5
                          WithTitle:@"我的"
                          imageName:@"home_我的"
                  selectedImageName:@"home_我的-1"];
    
    if ([XYCenter checkIsLogin]) {
        [self xy_postWithValues:@{@"token":m_token} ModelType:[XYMessageCaseModel class] Path:i_ismessage hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
            if ([model isKindOfClass:[XYMessageCaseModel class]]) {
                //status 1:有未读；2：没有未读；
                XYMessageCaseModel * newMessageModel = model;
                if ([@"1" isEqualToString:newMessageModel.status] ) {
                    _messageBarItem.badgeValue = @"new";
                }else{
                    _messageBarItem.badgeValue = nil;
                }
            }
        } failure:^(NSString *msg, id model) {
            
        }];
    }
}

/**
 *  添加一个子控制器
 *
 *  @param viewController    控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 选中图片
 */

- (void)addOneChildViewController:(UIViewController *)viewController WithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    
    //    viewController.view.backgroundColor     = APP_MainColor;
    viewController.tabBarItem.title         = title;
 
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=[UIColor blackColor];
    [viewController.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *textAttrs1 = [NSMutableDictionary dictionary];
    textAttrs1[NSForegroundColorAttributeName]=COLOR_BLUE;
    [viewController.tabBarItem setTitleTextAttributes:textAttrs1 forState:UIControlStateSelected];
    
    viewController.tabBarItem.image         = [UIImage imageNamed:imageName];
    UIImage *image = [UIImage imageNamed:selectedImageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = image;
    [self addChildViewController:viewController];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    

}
 


@end
