//
//  XYCenter.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface XYCenter : NSObject

AS_SINGLETON( XYCenter )

@property (nonatomic, assign) BOOL whc_open;

@property (nonatomic, assign) BOOL isWifi;

//当前登录的user
@property (nonatomic, strong) UserModel *userModel;

//缓存
@property (nonatomic, strong) TMCache *tmcache;

/*!
 *	@brief	保存登录数据
 *
 *	@return	void
 */
+ (void)saveLoginData:(UserModel *)model;

/*!
 *	@brief	清空登录数据
 *
 *	@return	NSString
 */
+ (void)removeAllLoginData;

/**
 *  获取登录状态
 */
+ (BOOL)checkIsLogin;

/**
 *  关闭whc
 */
+ (void)close_whc;


@end