//
//  XYCheckListDetailModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/17.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"

#import "XYSenderModel.h"
@interface XYReceiversDetailModel : XYBaseModel
/**
 *
 id        列表id
 grade     水果等级
 addtime   发货时间
 
 name     名称
 spec      规格
 unit      数量
 unit_real      实收数量
 price      价格
 photos    图片
 cars      车次
 carnumber 车牌号
 
 id  发货数据id
 car_num  车次编号
 ship_time  发货时间
 car_number_plate  车牌号
 phone  电话
 count_num 总件数
 other_cost  发货杂费
 status 状态：-1在途，1：已收货
 sname  发货地
 
 shipment_detail {
 product_id  商品id
 pname  商品名称
 level_name  等级
 num 发货数量
 cost  成本价格
 }
 */
@property (nonatomic,copy) NSString <Optional>* xyid;
//@property (nonatomic,copy) NSString <Optional>* reasons;//发货
@property (nonatomic,copy) NSString <Optional>* grade;
@property (nonatomic,copy) NSString <Optional>* addtime;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* spec;
@property (nonatomic,copy) NSString <Optional>* unit;
@property (nonatomic,copy) NSString <Optional>* price;
@property (nonatomic,copy) NSString <Optional>* photos;
@property (nonatomic,copy) NSString <Optional>* cars;
@property (nonatomic,copy) NSString <Optional>* carnumber;


@property (nonatomic,strong) NSString <Optional>* unit_real;
@property (nonatomic,strong) NSString <Optional>* date_real;
@property (nonatomic,strong) NSString <Optional>* otherprice;
@property (nonatomic,strong) NSMutableArray <Optional>* productArr;


//@property (nonatomic,strong) NSString <Optional>* xyid;
@property (nonatomic,strong) NSString <Optional>* car_num;
@property (nonatomic,strong) NSString <Optional>* sname;
@property (nonatomic,strong) NSString <Optional>* ship_time;
@property (nonatomic,strong) NSString <Optional>* count_num;
@property (nonatomic,strong) NSMutableArray <Optional,XYSenderProductModel>* shipment_detail;
@property (nonatomic,strong) NSString <Optional>* img_detail;


@end

@interface XYCheckListDetailModel : XYBaseModel
/**
 *  
 id        商品id
 reasons   事由
 grade     采购类型
 arrivetime  交付时间
 name      名称
 spek       规格
 number    数量
 unit       单位
 price       价格
 photos      图片
 */
@property (nonatomic,copy) NSString <Optional>* xyid;
@property (nonatomic,copy) NSString <Optional>* reasons;
@property (nonatomic,copy) NSString <Optional>* grade;
@property (nonatomic,copy) NSString <Optional>* arrivetime;


/**
 *  预计发往口岸
 */
@property (nonatomic,strong) NSString <Optional>* estimatedArrivalPort;
/**
 *  预计到货日期
 */
@property (nonatomic,strong) NSString <Optional>* estimatedArrivalDate;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* spek;
@property (nonatomic,copy) NSString <Optional>* number;
@property (nonatomic,copy) NSString <Optional>* unit; 
@property (nonatomic,copy) NSString <Optional>* price;
@property (nonatomic,copy) NSString <Optional>* photos;
@property (nonatomic,strong) NSMutableArray <Optional>* photosArr;


@end
