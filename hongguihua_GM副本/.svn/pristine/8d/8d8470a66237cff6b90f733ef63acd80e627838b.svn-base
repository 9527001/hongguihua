//
//  XYSaleRecordsModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/8/25.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"

@interface HeaderViewModel : XYBaseModel

/*
 @[@"发货杂费",
 @"到货杂费",
 @"货柜利润",
 @"剩余总件数",
 @"到货日期",
 @"最近更新日期",
 
 @"品种",
 @"等级",
 @"到货件数",
 @"单件成本",
 @"已售件数",
 @"已售金额",
 @"平均售价",
 @"剩余件数",
 
 @"销售状态",]
 */
@property (nonatomic,copy) NSString <Optional>* placeofreceipt;
@property (nonatomic,copy) NSString <Optional>* cars;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* grade;
@property (nonatomic,copy) NSString <Optional>* gunit;

@property (nonatomic,copy) NSString <Optional>* addtime;
@property (nonatomic,copy) NSString <Optional>* sunit;
@property (nonatomic,copy) NSString <Optional>* stock;
@property (nonatomic,copy) NSString <Optional>* send_price;
@property (nonatomic,copy) NSString <Optional>* price;
@property (nonatomic,copy) NSString <Optional>* pricesum;

@end

@protocol Base <NSObject> @end
@interface Base : XYBaseModel

@property (nonatomic,copy) NSString <Optional>* addtime;
@property (nonatomic,copy) NSString <Optional>* sunit;
@property (nonatomic,copy) NSString <Optional>* stock;
@property (nonatomic,copy) NSString <Optional>* send_price;
@property (nonatomic,copy) NSString <Optional>* price;
@property (nonatomic,copy) NSString <Optional>* pricesum;

@end

@interface XYSaleRecordsModel : XYBaseModel
/**
 *  
 placeofreceipt   发货地
 cars           车次
 name          品项
 grade          等级
 gunit           到货件数
 base
 {
 addtime         销售日期
 sunit            销售件数
 stock            剩余库存
 price             售价
 send_price        成本
 pricesum         累计售价
 
 }

 

 */

@property (nonatomic,copy) NSString <Optional>* placeofreceipt;
@property (nonatomic,copy) NSString <Optional>* cars;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* grade;
@property (nonatomic,copy) NSString <Optional>* gunit;
@property (nonatomic,copy) NSArray  <Optional,Base>* base;

@end
