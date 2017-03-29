//
//  XYManagementNewModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/30.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"

#import "XYSenderModel.h"

@interface XYManagementNewModel : XYBaseModel
/**
 //发货列表
 id  发货数据id
 car_num  车次编号
 ship_time  发货时间
 car_number_plate  车牌号
 phone  电话
 count_num 总件数
 other_cost  发货杂费
 status 状态：-1在途，1：已收货
 sname  发货地
 wname  收货地
 username  发货人
 
 shipment_detail {  详情
 id  发货详情id
 product_id  商品id
 pname 商品名称
 level_name  等级
 num  发货件数
 cost  成本价格
 current_num  已售数量
 }
 
 receiver_time  到货时间
 //销售列表
 
 id  发货数据id
 car_num  车次编号
 ship_time  发货时间
 car_number_plate  车牌号
 count_num 总件数
 current_all_num  已售总件数
 other_cost  发货地杂费
 wholesale_other_cost  批发地杂费
 profit_money  货柜利润
 addtime  更新时间
 shipment_detail {  详情
 id  发货详情id
 product_id  商品id
 pname 商品名称
 level_name  等级
 num  发货件数
 cost  成本价格
 current_num  已售数量
 current_money  已售金额
 }
 */
@property (nonatomic,strong ) NSString <Optional> * xyid;
@property (nonatomic,strong ) NSString <Optional> * car_num;
@property (nonatomic,strong ) NSString <Optional> * ship_time;
@property (nonatomic,strong ) NSString <Optional> * car_number_plate;
@property (nonatomic,strong ) NSString <Optional> * phone;
@property (nonatomic,strong ) NSString <Optional> * count_num;
@property (nonatomic,strong ) NSString <Optional> * other_cost;
@property (nonatomic,strong ) NSString <Optional> * status;//-1在途，1：已收货
@property (nonatomic,strong ) NSString <Optional> * sname;
@property (nonatomic,strong ) NSString <Optional> * wname;
@property (nonatomic,strong ) NSString <Optional> * username;
@property (nonatomic,strong ) NSMutableArray <Optional,XYSenderProductModel> * shipment_detail;

@property (nonatomic,strong ) NSString <Optional> * receiver_time;

@property (nonatomic,strong ) NSString <Optional> * current_all_num;
@property (nonatomic,strong ) NSString <Optional> * wholesale_other_cost;
@property (nonatomic,strong ) NSString <Optional> * profit_money;
@property (nonatomic,strong ) NSString <Optional> * addtime;
@property (nonatomic,strong ) NSString <Optional> * saleStatus;// 1.售罄 2销售中




@property (nonatomic,strong ) NSString <Optional> * xyid_item;
@property (nonatomic,strong ) NSString <Optional> * product_id;
@property (nonatomic,strong ) NSString <Optional> * pname;
@property (nonatomic,strong ) NSString <Optional> * level_name;
@property (nonatomic,strong ) NSString <Optional> * num;
@property (nonatomic,strong ) NSString <Optional> * cost;
@property (nonatomic,strong ) NSString <Optional> * current_num;
@property (nonatomic,strong ) NSString <Optional> * current_money;


@property (nonatomic,strong ) NSString <Optional> * totalCost;//总成本


@end
