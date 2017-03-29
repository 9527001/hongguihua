//
//  XYSendProductModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/18.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"
@interface XYSaleProductModel : XYBaseModel
/**
 *
 username   用户名
 id          收货列表id
 
 gunit       收货总件数
 name       商品名称
 sellnumbers  售出的总件数
 
 spec        规格
 cars        车次
 carnumber   车牌号
 */
@property (nonatomic,copy) NSString <Optional>* username;
@property (nonatomic,copy) NSString <Optional>* xyid;
@property (nonatomic,copy) NSString <Optional>* gunit;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* sellnumbers;
@property (nonatomic,copy) NSString <Optional>* spec;
@property (nonatomic,copy) NSString <Optional>* cars;
@property (nonatomic,copy) NSString <Optional>* carnumber;

@end
@interface XYSendProductModel : XYBaseModel
/**
 *  
 id         商品id
 name     商品名称
 sum       商品总库存
 sendunit    发出的件数
 */
@property (nonatomic,copy) NSString <Optional>* xyid;
@property (nonatomic,copy) NSString <Optional>* pid;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* sum;
@property (nonatomic,copy) NSString <Optional>* sendunit;

@end
