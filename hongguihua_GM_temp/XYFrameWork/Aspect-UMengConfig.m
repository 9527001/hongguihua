//
//  Aspect-appearance.m
//  mcapp
//
//  Created by zhuchao on 14/12/16.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "AppDelegate.h"
#import <XAspect/XAspect.h>
#import "MobClick.h"

#define CHANNEL_ID @"pgyer"

#define UMAppKey @"53f8902ffd98c585ba02a156"
#define UmengAppKey @""

#define WXAPPID @""
#define WXAPPsecret @""
#define WXUrl   @""

#define AtAspect  UMengConfig 
#define AtAspectOfClass AppDelegate
@classPatchField(AppDelegate)
AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions)
{
    
    //设置AppKey
    [CoreUMeng umengSetAppKey:UmengAppKey];
    //集成新浪
    [CoreUMeng umengSetSinaSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    //集成微信
    [CoreUMeng umengSetWXAppId:WXAPPID appSecret:WXAPPsecret url:WXUrl];
    //集成QQ
    [CoreUMeng umengSetQQAppId:@"100424468" appSecret:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.qq.com/"];
    //集成淘宝
#warning TobeContinued
    // Override point for customization after application launch.
    
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}


@end
#undef AtAspectOfClass
#undef AtAspect