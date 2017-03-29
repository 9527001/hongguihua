//
//  XYProductListModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/17.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"

@interface XYManagementModel : XYBaseModel //三个权限共用一个表
/**
 *
 "id         发货列表id
 getgoodsid 收货列表id
 name      商品名
 sendtime   发货月份
 carnumber  车牌号
 
 cars       车次
 unit       发货总件数
 杂费{
 otherprice   发货产生的杂费
 gotherprice  收货产生的杂费
 }
 sendtoplace   批发地
 
 sendstatus    发货状态1：在途；2：已收货；
 gunit       收货总件数
 grade       等级
 price       发货成本/件
 username   收货人
 
 sellprice    售出总价格
 
 sprice  售价/件
 profit  利润
 allprice 成本
 otherp    杂费
 */
@property (nonatomic,copy) NSString <Optional>* xyid;
@property (nonatomic,copy) NSString <Optional>* getgoodsid;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* sendtime;
@property (nonatomic,copy) NSString <Optional>* carnumber;

@property (nonatomic,copy) NSString <Optional>* cars;
@property (nonatomic,copy) NSString <Optional>* unit;
@property (nonatomic,copy) NSString <Optional>* otherprice;
@property (nonatomic,copy) NSString <Optional>* gotherprice;
@property (nonatomic,copy) NSString <Optional>* sendtoplace;

@property (nonatomic,copy) NSString <Optional>* sendstatus;
@property (nonatomic,copy) NSString <Optional>* gunit;
@property (nonatomic,copy) NSString <Optional>* grade;
@property (nonatomic,copy) NSString <Optional>* price;
@property (nonatomic,copy) NSString <Optional>* username;

@property (nonatomic,copy) NSString <Optional>* sellprice;
@property (nonatomic,copy) NSString <Optional>* sprice;
@property (nonatomic,copy) NSString <Optional>* profit;
@property (nonatomic,copy) NSString <Optional>* allprice;
@property (nonatomic,copy) NSString <Optional>* otherp;

@end

@interface XYProductListModel : XYBaseModel//采购员的商品列表
/**
 *   
 id:采购物品id
 name:商品名称
 spek:规格
 price：价格
 number：数量
 username:发货人
 sendplace：发货地
 status：审批状态（1：待审批；2：通过;3：未通过）
 */
@property (nonatomic,copy) NSString <Optional>* xyid;
@property (nonatomic,copy) NSString <Optional>* reasons;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* username;
@property (nonatomic,copy) NSString <Optional>* price;
@property (nonatomic,copy) NSString <Optional>* number;
@property (nonatomic,copy) NSString <Optional>* sendplace;
@property (nonatomic,copy) NSString <Optional>* status;
@property (nonatomic,copy) NSString <Optional>* spek;
@property (nonatomic,strong ) NSMutableArray <Optional>* dataArr;

@end
