//
//  XYCenter.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYCenter.h"

#define XYCenterUsers @"XYCenterUsers"

@implementation XYCenter

DEF_SINGLETON( XYCenter )

- (instancetype)init
{
    if (self = [super init]) {
        NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
        _tmcache = [[TMCache alloc] initWithName:XYCenterUsers rootPath:path];

    }
    return self;
}


/*!
 *	@brief	保存登录Model到本地和内存
 *
 *	@return	void
 */
+ (void)saveLoginData:(UserModel *)model{
    //默认保存登录数据时，设为已登录
    model.isLogin = @"1";
    //保存disk
    NSDictionary *dic;
    @try {
        dic = [model toDictionary];
    } @catch (NSException *exception) {
        DLog(@"Error:saveLoginData");
    }
    if (dic) {
        [[XYCenter sharedInstance].tmcache setObject:dic forKey:XYCenterUsers];
    }
    //保存到memory
    [XYCenter sharedInstance].userModel = model;
}

/*!
 *	@brief	清空本地和内存登录数据
 *
 *	@return	NSString
 */
+ (void)removeAllLoginData{
    [[XYCenter sharedInstance].tmcache removeObjectForKey:XYCenterUsers];
    [XYCenter sharedInstance].userModel = nil;
}

/**
 *  登录状态
 */
+  (BOOL)checkIsLogin
{
    if ([@"1" isEqualToString : [XYCenter sharedInstance].userModel.isLogin]) return true;
    return false;
}

- (UserModel *)userModel
{
    NSDictionary *data = [[XYCenter sharedInstance].tmcache objectForKey:XYCenterUsers];
    NSMutableDictionary * dataDic = [NSMutableDictionary dictionaryWithDictionary:data];
    for (NSString * key in dataDic.allKeys) {
        if ([key isEqualToString:@"photo"]&&
            _userModel.photo.length > 0) {
            [dataDic setValue:_userModel.photo forKey:@"photo"];
        }
    }
    
    @try {
        _userModel = [[UserModel alloc]initWithDictionary:dataDic error:nil];
    } @catch (NSException *exception) {
        DLog(@"Error:userModel");
    }
    if (!_userModel) {
        _userModel = [[UserModel alloc] init];
    }
    return _userModel;
}

/**
 *  关闭whc
 */
+ (void)close_whc
{
    [XYCenter sharedInstance].whc_open = YES;
}
@end

