//
//  XYSaleModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"

#import "XYSenderModel.h"

@interface XYSaleModel : XYBaseModel

/**
 *
 name	名称
 spec	规格
 stock	库存
 carNumber	车次
 id     收货列表id
 price	出售价格
 sunit	出售件数
 */
@property (nonatomic,strong) NSString <Optional>* name;
@property (nonatomic,strong) NSString <Optional>* spec;
@property (nonatomic,strong) NSString <Optional>* stock;//单位
@property (nonatomic,strong) NSString <Optional>* carNumber;
@property (nonatomic,strong) NSString <Optional>* xyid;
@property (nonatomic,strong) NSString <Optional>* price;
@property (nonatomic,strong) NSString <Optional>* sunit;

/**
 id  发货数据id
 car_num  车次编号
 receiver_time  到货时间
 shipment_detail {
 id  发货详情id
 product_id  商品id
 pname 商品名称
 level_name  等级
 num  发货件数
 cost  成本价格
 current_num  已售数量
 }*/

@property (nonatomic,strong) NSString <Optional>* car_num;
@property (nonatomic,strong) NSString <Optional>* receiver_time;
@property (nonatomic,strong) NSMutableArray <Optional,XYSenderProductModel>* shipment_detail;


@end
