//
//  SBZHomeModelNew.h
//  saibaiz
//
//  Created by xiaoyao on 16/4/28.
//  Copyright © 2016年 中企互联. All rights reserved.
//


/**
 recommend{
 id 轮播图id
 pic 轮播图片
 }
 miaosha{
 id 秒杀id
 pid 商品id
 beginTime 开始时间（格式:12:00:00）
 endTime
 name:商品名称
 nowprice:商品现价
 oldprice:商品原价
 pic  :商品图片
 说明：商品列表按照结束时间升序 第一个是最先结束秒杀的商品
 }
 proAll {
 title : 广告位名称
 ad_pic: 广告位图片
 {
 name :商品名称
 pic :   商品图片
 nowprice : 商品现价
 oldprice: 商品原价
 }
 }
 }

 */

@protocol recommendModel
@end
@protocol miaoshaModel
@end
@protocol proAllModel
@end
@protocol baseModel
@end

@interface recommendModel : JSONModel
@property (nonatomic, assign) int id;//轮播图id
@property (nonatomic, strong) NSString *pic;//轮播图
@end
@interface miaoshaModel : JSONModel
@property (nonatomic, assign) int id;// 秒杀id
@property (nonatomic, strong) NSString *pid;// 商品id
@property (nonatomic, strong) NSString *beginTime;// 开始时间（格式:12:00:00）
@property (nonatomic, strong) NSString *endTime;//
@property (nonatomic, strong) NSString *name;//:商品名称
@property (nonatomic, strong) NSString *nowprice;//:商品现价
@property (nonatomic, strong) NSString *oldprice;//:商品原价
@property (nonatomic, strong) NSString *pic;//  :商品图片
@end

@interface baseModel : JSONModel
@property (nonatomic, strong) NSString *name;// :商品名称
@property (nonatomic, strong) NSString *pic;// :   商品图片
@property (nonatomic, strong) NSString *nowprice;// : 商品现价
@property (nonatomic, strong) NSString *oldprice;//: 商品原价
@end

@interface proAllModel : JSONModel
@property (nonatomic, strong) NSString *title;// : 广告位名称
@property (nonatomic, strong) NSString *ad_pic;//: 广告位图片
@property (strong, nonatomic) NSArray<baseModel>* base;
@end



@interface XYHomeModelNew : JSONModel
@property (strong, nonatomic) NSArray<miaoshaModel>* miaosha;
@property (strong, nonatomic) NSArray<proAllModel>* proAll;
@property (strong, nonatomic) NSArray<recommendModel>* recommend;
@end



