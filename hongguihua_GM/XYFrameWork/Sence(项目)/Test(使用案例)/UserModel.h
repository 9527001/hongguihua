//
//  login_model.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/7.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"
/**
 id 用户id
 mobile 手机号
 nickname 昵称
 gender 性别(1:男2:女)
 age 年龄
 imgUrl 图片路径
 token 用户登录唯一
 signature个性签名
 official_tel客服电话
 help_url  帮助 URL
 cid   1:国外采购;2:收货人员;3:国内高管;4:第三人

 */

#define m_userModel             [XYCenter sharedInstance].userModel

@interface UserModel : XYBaseModel
@property (nonatomic, strong) NSString <Optional>*xyid;
@property (nonatomic, strong) NSString <Optional>*cid;
//@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString <Optional>*loginname;
@property (nonatomic, strong) NSString <Optional>*gender;
@property (nonatomic, strong) NSString <Optional>*age;
@property (nonatomic, strong) NSString <Optional>*user_pic;
@property (nonatomic, strong) NSString <Optional>*photo;//头像
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString <Optional>*signature;
@property (nonatomic, strong) NSString <Optional>*official_tel;
@property (nonatomic, strong) NSString <Optional>*help_url;

//自定义参数
@property (nonatomic, strong) NSString <Optional>*isLogin;    //是否登录  @"1"已登录  其他未登录


@end
