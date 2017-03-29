//
//  XYNavigationController.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/27.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYNavigationController.h"

@interface XYNavigationController ()

@end

@implementation XYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.navigationBar setTitleTextAttributes:@{
                                                                      
                                                                      NSFontAttributeName:XY_S_BOLD_FONT(18.0f),
                                                                      NSForegroundColorAttributeName:COLOR_GRAY_1
                                                                      }];
    [self.navigationBar setBarTintColor:COLOR_WHITE];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        [self setPopItem:viewController];
    }
    else{
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:animated];
}

/**
 *  设置返回按钮
 */
- (void)setPopItem:(UIViewController *)c
{
    UIButton *button = [[UIButton alloc] initNavigationButton:[UIImage imageNamed:@"nav-返回"]];
    [button addTarget:self action:@selector(leftButtonTouch:) forControlEvents:UIControlEventTouchUpInside];
    c.navigationItem.leftBarButtonItem = nil;
    UIBarButtonItem * leftBarButon = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    left.width = -30;
    c.navigationItem.leftBarButtonItems = @[left, leftBarButon];
    
    if (IOS7_OR_LATER) {
        c.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    
}

 
- (void)leftButtonTouch:(id)sender
{
    XYViewController *c = (XYViewController *)(self.visibleViewController);
    if (c && [c isKindOfClass:[XYViewController class]]) {
        [c leftButtonTouch:sender];
    }
    //    [self popViewControllerAnimated:YES];
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
