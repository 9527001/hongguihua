//
//  DeviceMacro.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/27.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#ifndef DeviceMacro_h
#define DeviceMacro_h

/*********************************************************
 *
 *  自定义宏区域
 *
 *********************************************************/
/**
 *  是否登录
 */
#define xy_isLogin ([XYCenter checkIsLogin])














/*********************************************************
 *
 *  常用宏区域（固定）
 *
 *********************************************************/
/** 主屏幕的高度 */
#define XY_M_SCREEN_H [[UIScreen mainScreen] bounds].size.height
/** 主屏幕的宽度 */
#define XY_M_SCREEN_W  [[UIScreen mainScreen] bounds].size.width

#define XY_M_SCREEN_MIN MIN(XY_M_SCREEN_W, XY_M_SCREEN_H)
#define XY_M_SCREEN_MAX MAX(XY_M_SCREEN_W, XY_M_SCREEN_H)

/** 主屏幕的高度比例 */
#define XY_M_SCREEN_H_SCALE (M_SCREEN_H/640)
/** 主屏幕的宽度比例 */
#define XY_M_SCREEN_W_SCALE (M_SCREEN_W/320)

/** 判断屏幕方向 */
//#define XY_DEVICE_isPortrait [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait ||[[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown ||[[UIDevice currentDevice] orientation] ==UIDeviceOrientationUnknown

/** 判断屏幕方向 */
#define XY_DEVICE_isPortrait [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait ||[[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown
#define XY_DEVICEIO_isPortrait(x) x == UIInterfaceOrientationPortrait ||x == UIInterfaceOrientationPortraitUpsideDown
#define XY_DEVICEIO_CURRENTORIENTATION [[UIApplication sharedApplication] statusBarOrientation]

/** 屏幕的分辨率 当结果为1时，显示的是普通屏幕，结果为2时，显示的是Retian屏幕 */
#define XY_M_SCREEN_SCALE [[UIScreen mainScreen] scale]

/** 除去信号区的屏幕的frame */
#define XY_APP_FRAME  [[UIScreen mainScreen] applicationFrame]
/** 应用程序的屏幕高度 */
#define XY_APP_FRAME_H   [[UIScreen mainScreen] applicationFrame].size.height
/** 应用程序的屏幕宽度 */
#define XY_APP_FRAME_W    [[UIScreen mainScreen] applicationFrame].size.width


/** 系统控件的默认高度 */
#define XY_D_STATUS_BAR_H   (20.f)
#define XY_D_TOP_BAR_H      (44.f)
#define XY_D_BOTTOM_BAR_H   (49.f)
#define XY_D_CELL_H (44.f)

/** 中英状态下键盘的高度 */
#define XY_ENG_KEY_BOARD_H  (216.f)
#define XY_CHN_KEY_BOARD_H  (252.f)

/** 系统的版本号 */
#define XY_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define XY_IS_IOS6 (SYSTEM_VERSION >= 6.0 && SYSTEM_VERSION < 7)
#define XY_IS_IOS7 (SYSTEM_VERSION >= 7.0 && SYSTEM_VERSION < 8.0)
#define XY_IS_IOS8 (SYSTEM_VERSION >= 8.0 && SYSTEM_VERSION < 9.0)
#define XY_IS_IOS9 (SYSTEM_VERSION >= 9.0 && SYSTEM_VERSION < 10.0)

#define XY_IS_IOS7_BEFORE XY_SYSTEM_VERSION < 8.0

/** 设备判断 */
#define XY_IS_IPHONE [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define XY_IS_PAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** iPhone的型号 */
#define XY_IS_IPHONE4 ([[UIScreen mainScreen] bounds].size.height == 480)
#define XY_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define XY_IS_IPHONE6 ([[UIScreen mainScreen] bounds].size.height == 667)
#define XY_IS_IPHONE6_PLUS ([[UIScreen mainScreen] bounds].size.height == 736)


/** APP版本号 */
#define XY_APP_VERSION  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/** APP BUILD 版本号 */
#define XY_APP_BUILD_VERSION  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/** APP名字 */
#define XY_APP_DISPLAY_NAME  [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]

/** 当前语言 */
#define XY_LOCAL_LANGUAGE [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode]

/** 当前国家 */
#define XY_LOCAL_COUNTRY [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]

/** 当前使用Xcode iPhone OS SDK 的版本
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0
NSLog(@"当前使用Xcode iPhone OS SDK 8.0 以后版本的处理");
#else
NSLog(@"当前使用Xcode iPhone OS SDK 8.0 之前版本的处理");
#endif
*/

/** 判断设备室真机还是模拟器 */
#if TARGET_OS_IPHONE
#endif

#if TARGET_IPHONE_SIMULATOR
#endif

/** 判断系统为64位还是32位
#if __LP64__
NSLog(@"64");
#else
NSLog(@"32");
#endif
*/

#endif /* DeviceMacro_h */
