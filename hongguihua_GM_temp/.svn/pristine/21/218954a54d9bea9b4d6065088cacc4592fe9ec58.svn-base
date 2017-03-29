//
//  Aspect_TingyunApp.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/9/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "AppDelegate.h"

#import <XAspect/XAspect.h>
#define AtAspect  TingYunAppConfig
#define AtAspectOfClass AppDelegate
@classPatchField(AppDelegate)
AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions)
{
    
    [NBSAppAgent startWithAppID:@"04fa6c27779a4e79bd5c16ca94948d42"];
    
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}


@end
#undef AtAspectOfClass
#undef AtAspect