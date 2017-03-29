//
//  XYSenderModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"

@protocol XYSenderProductModel <NSObject>
@end
@interface XYSenderProductModel : XYBaseModel

/*
 name	品种
 spec	等级
 num	件数
 price	成本
 
 //new
 product_id 商品id
 level_name  等级
 num  件数
 cost  成本
 
 
 id  发货详情id
 product_id  商品id
 pname 商品名称
 level_name  等级
 num  发货件数
 cost  成本价格
 totalprice  单件货品总成本
 current_num  已售数量
 current_money  已售金额
 
 */

@property (nonatomic,copy) NSString <Optional>* xyid;
@property (nonatomic,copy) NSString <Optional>* current_num;
@property (nonatomic,copy) NSString <Optional>* realNum;
@property (nonatomic,copy) NSString <Optional>* product_id;
@property (nonatomic,copy) NSString <Optional>* product;
@property (nonatomic,copy) NSString <Optional>* pname;
@property (nonatomic,copy) NSString <Optional>* level_name;
//@property (nonatomic,copy) NSString <Optional>* num;
@property (nonatomic,copy) NSString <Optional>* cost;
@property (nonatomic,copy) NSString <Optional>* current_money;



@property (nonatomic,copy) NSString <Optional>* pid;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* spec;
@property (nonatomic,copy) NSString <Optional>* gid;

@property (nonatomic,copy) NSString <Optional>* num;
@property (nonatomic,copy) NSString <Optional>* price;
@property (nonatomic,copy) NSString <Optional>* totalprice;

@end

@interface XYSenderModel : XYBaseModel
/**
 *
 sourcePlace 货源地
 placeofreceipt 发货地
 sendtoplace	目的地
 provinceId	省份id
 cityid	城市id
 districtId	区县id
 sendtime	发货日期
 
 carnumber	车牌号
 driverphone 司机电话
 
 otherprice	其他费用
 maxCount 最大发货量
 
 productArr 货品
 imageArr 货品
 
 token 用户唯一标示
 wholesale_id 批发地id
 ship_id 发货地id
 car_num 车次编号
 ship_time  发货时间
 car_number_plate 车牌号
 phone 电话
 other_cost 发货地杂费
 count_num  总件数
 pics  图片详情
 productInfo 发货商品数据

 
 */
@property (nonatomic,strong) NSString * sourcePlaceID;
@property (nonatomic,copy) NSString <Optional>* sourcePlace;
@property (nonatomic,copy) NSString <Optional>* car_num;

@property (nonatomic,copy) NSString <Optional>* placeofreceipt;
@property (nonatomic,copy) NSString <Optional>* provinceId;
@property (nonatomic,copy) NSString <Optional>* cityid;
@property (nonatomic,copy) NSString <Optional>* districtId;
@property (nonatomic,copy) NSString <Optional>* sendtoplaceID;
@property (nonatomic,copy) NSString <Optional>* sendtoplace;
@property (nonatomic,copy) NSString <Optional>* sendtime;

@property (nonatomic,copy) NSString <Optional>* driverphone;
@property (nonatomic,copy) NSString <Optional>* carnumber;

@property (nonatomic,copy) NSString <Optional>* otherprice;
@property (nonatomic,copy) NSString <Optional>* maxCount;

@property (nonatomic,strong) NSMutableArray <Optional>* photos;
@property (nonatomic,strong) NSMutableArray <Optional,XYSenderProductModel>* productArr;

 

@property (nonatomic,copy) NSString <Optional>* pname;
@property (nonatomic,copy) NSString <Optional>* gname;
@property (nonatomic,copy) NSString <Optional>* spec;
@property (nonatomic,copy) NSString <Optional>* unit;
@property (nonatomic,copy) NSString <Optional>* price;
@property (nonatomic,copy) NSString <Optional>* pid;
@property (nonatomic,copy) NSString <Optional>* gid;


@end
