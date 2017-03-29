//
//  Aspect-appearance.m
//  mcapp
//
//  Created by zhuchao on 14/12/16.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//




#import "AppDelegate.h"
#import <XAspect/XAspect.h>

#import <AliHotFix/AliHotFix.h>

#define AtAspect  UMengConfig 
#define AtAspectOfClass AppDelegate
@classPatchField(AppDelegate)
AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions)
{
    
    // 1. appid
    NSString * appid = @"98572-2";
    
    // 2. appid
    NSString * secret = @"9d3c858923c4f5c7fc7660bc76241647";
    // 3.私钥
    NSString * privateKey = @"MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCBXzvRrLnQWiJfBMAtVb3JlV9AQFRak3TFJE69aQrtBWxpPpP2VWoSPnVOI21vD4WdV0CZOoH3dfXtGq7h+y6pkFRnEOgrEdq7w4K/VeKF7g3W9imq95J18/Rro0DeUOKdEE+2hUHRPffzljBEYXv8fc0rqo6SymzyYqAcMJCRhAD7rl7UsZzFEeq1qtCIjncnCfEMRdeLHoYfYfwWtlgdrt+b5RtPTpimoCL7akTpN+eECQWgq7d8OfWeKjj3siThOeyWpwBjAdvLyhPzozTEjsZc8SJNNMN0Z0uuKeYmfswlY/0PCqMowFFDCGL8h8eNVHClrK7zf7esy/9cXmBBAgMBAAECggEAdvD0kUApEZpcsVkvyj5jH5s6GFtMcn3RRJKt5cxWZDWxR01mQXqj66QKu00tBoeRw2d9l6LH7JhCAryeflstum1ce+l6Wmau4CPO6FRwz8teY/yrsGiu+czRMcjFEd/xiI9/igIX0eUUOpohRC0QDcInSHclX2XGJk5wf5pSv8T61bsziiNhB+U9J+54eqUutKuXvZCpq0h1+BGqr6i1jF2iTK/ZIjviEgNAVBnef8z97frWdJh+Iz5Hp6BOcjyqI+Eg2+2fz1vI+VKPUHfmRGUOGwb4MDGeMERB7cIun0C1j58uvmjbARgpkJE+WAFP/DzkkGS22cGAASe7zu9y8QKBgQDBZz+QiyvtyziGHJ5sSUezyi6yQKw4b2pll3cC+MKWfo5kDROeaciUnzevkwfSS1GXGJas2/mAkMdNqVvO5Rt/p2szA0vu6Fq41qRUnBNsDrzSYTKPRJ2epUC83sLi8kjG+y0EXaVQGFuqbn/wLFA7XxBHQc1WqG8rTcc/9xVj1QKBgQCrPpC/eGlpXhWnHH9zRTAYNOd2hFr1vqazL+O4topGpToxea0HtQlj3CZtkp3GVNLES8geYmj2g5bx8cXaUWw6gNzMQdMLrfzuH7nmD4+4rsUkFUiJ9Ao+vWORr76WDlG6IWvAjCT6yKB2efAM5+9aU+o6rVUIxYd2oKVXkxb8vQKBgQCIxQU0qNbWASLl5JM8LM5iHJbNQ+MGvfPWCDkHhvfFCZaUtpKrMk/Amp/8r9OWKeF3ItJbR+y3uKrZBu1/8JFzwueSWcB3ISYXFON9Wip5/ioV9NqWaoW0zVRsvHPBnmlNHg+FyNvBOpiIfEBJjmzmr6GJYsVdhRuo2gYP/CHKSQKBgQCXo7Wl98jQh4IBE1lBB/mI1gBJkPbDOmp/rl6nCO31lQatHSQ9+PAxv5c/3F9ea2qgbMLvNRHhibE22nPr2cJPJCFhtsBeTVn2u51wvkL0tb7ZLwenMbWIzUjIj6njUxbIDiROw0tT0ClYAK6znwbzI+/8udTdCZ3lTGhd3mCyuQKBgACxWkRdI8S5nUQBzr9gr49o7fMMLk+ZWn7XcQ67VLdino/MwWJRiEWXLj41z8MVch0zIepUN7Go+JSHM7YAr/4OOwzYzI+S9/Ah2C3EeTXT16QwHIoxzpKLg3vA4xus/hu2Re+A/QTuDMt6UYNpLNQUqanV7J5VI3CvqCMkpLsG";
    
    
    
    // 5. 本地加密patch密钥 加解密补丁文件的密钥(该密钥已加密)
    char aesEncryptKeyBytes[] = {-70,49,-67,34,111,111,89,-52,-6,36,-98,71,59,110,67,32};
    NSData *aesEncryptKeyData = [NSData dataWithBytes:aesEncryptKeyBytes length:sizeof(aesEncryptKeyBytes)];
    
     // 4. 本地自签名证书RSA公钥
    char rsaPublicDerBytes[]={48,-126,2,89,48,-126,1,-62,2,9,0,-6,-59,-10,-18,37,-7,54,50,48,13,6,9,42,-122,72,-122,-9,13,1,1,5,5,0,48,113,49,11,48,9,6,3,85,4,6,19,2,67,72,49,11,48,9,6,3,85,4,8,19,2,66,74,49,11,48,9,6,3,85,4,7,19,2,84,90,49,11,48,9,6,3,85,4,10,19,2,90,81,49,12,48,10,6,3,85,4,11,19,3,76,83,74,49,11,48,9,6,3,85,4,3,19,2,90,68,49,32,48,30,6,9,42,-122,72,-122,-9,13,1,9,1,22,17,49,53,48,56,53,55,52,49,49,52,64,113,113,46,99,111,109,48,30,23,13,49,55,48,51,48,55,48,57,48,52,52,49,90,23,13,50,55,48,51,48,53,48,57,48,52,52,49,90,48,113,49,11,48,9,6,3,85,4,6,19,2,67,72,49,11,48,9,6,3,85,4,8,19,2,66,74,49,11,48,9,6,3,85,4,7,19,2,84,90,49,11,48,9,6,3,85,4,10,19,2,90,81,49,12,48,10,6,3,85,4,11,19,3,76,83,74,49,11,48,9,6,3,85,4,3,19,2,90,68,49,32,48,30,6,9,42,-122,72,-122,-9,13,1,9,1,22,17,49,53,48,56,53,55,52,49,49,52,64,113,113,46,99,111,109,48,-127,-97,48,13,6,9,42,-122,72,-122,-9,13,1,1,1,5,0,3,-127,-115,0,48,-127,-119,2,-127,-127,0,-96,89,-115,88,-124,11,68,-76,12,0,32,-72,85,-49,-81,-102,108,85,49,-48,-59,14,-79,126,-94,-23,-114,-124,82,15,-14,30,29,121,-110,17,16,15,35,-115,-21,-73,67,35,112,-33,-41,-70,-36,109,112,-92,-86,-44,-81,103,-127,21,-45,93,-19,53,-83,118,-28,29,23,121,53,68,29,-114,-22,56,-37,-118,50,-109,-119,97,-57,-67,-12,-9,83,74,76,125,-88,-68,-87,20,76,14,111,5,118,72,66,-93,-98,-82,27,12,103,-2,-24,-111,-37,-35,-84,-26,105,41,-45,-73,43,-41,-36,81,-47,58,-120,-89,-96,-95,28,-39,2,3,1,0,1,48,13,6,9,42,-122,72,-122,-9,13,1,1,5,5,0,3,-127,-127,0,-111,-16,-88,-57,-80,42,-44,15,63,-40,28,-121,-128,43,-38,-30,-45,80,107,123,-23,14,29,85,-16,-84,-128,21,103,-99,-38,-78,96,29,104,64,30,-100,111,-98,-37,-76,123,68,27,19,-25,-29,79,-102,-89,-24,-58,-86,-104,65,-61,-13,126,70,-8,-33,33,60,73,-61,-125,0,88,-56,39,-86,13,54,-79,100,-98,-110,-79,106,77,-50,90,-79,120,-110,-86,-98,95,92,-46,103,59,5,-81,41,-102,46,95,-10,22,73,38,69,96,-34,4,122,110,-100,26,-38,-4,-40,80,25,4,-117,108,-21,86,100,-76,-115,-25,61,-118,121};
    NSData *rsaPublicDerData = [NSData dataWithBytes:rsaPublicDerBytes length:sizeof(rsaPublicDerBytes)];
    

    
    // 百川平台申请的appid,secret,rsaKey.以及本地打包自签证书的RSA公钥&本地加密patch密钥
    [AliHotFix startWithAppID:appid secret:secret privateKey:privateKey publicKey:rsaPublicDerData encryptAESKey:aesEncryptKeyData];

    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}

AspectPatch(-, void, applicationWillEnterForeground:(UIApplication *)application )
{
    //为使接入方更方便灵活的检测patch更新,以及有效控制检测patch更新的请求次数，AliHotFixSDK默认只会在客户端启动时主动检测一次是否有Patch要更新。如果用户希望能够自己主动检查Patch更新可调用sync方法(建议程序在前后台切换时调用sync方法检测patch是否要更新):
    //在进入前台时主动检测一次
    [AliHotFix sync];
return XAMessageForward(applicationWillEnterForeground:application );
}



@end
#undef AtAspectOfClass
#undef AtAspect




//
/**
 *  集成hotfix
 *  1.pod
 *  2.文件中导入AliHotFix.framework,AliHotFixDeubg.framework（上线删掉） 文件
 *  3.在Aspect-UmengConfig.m文件编辑代码
 */
