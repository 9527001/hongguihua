//
//  XYRDModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/8/26.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"



@interface XYRDDetailOtherDataModel : XYBaseModel

//car_num 车次
//status 状态 -1：在途，1：已收货
//ship_time 发货时间
//receiver_time  到货时间
//wname  批发地名称
//shname 发货地名称
//wholesale_name 发货人
//receiver_name  收货人
@property (nonatomic,strong) NSString <Optional> * car_num;
@property (nonatomic,strong) NSString <Optional> * receiver_name;
@property (nonatomic,strong) NSString <Optional> * receiver_time;
@property (nonatomic,strong) NSString <Optional> * ship_time;
@property (nonatomic,strong) NSString <Optional> * shname;
@property (nonatomic,strong) NSString <Optional> * status;
@property (nonatomic,strong) NSString <Optional> * wholesale_name;
@property (nonatomic,strong) NSString <Optional> * wname;

@end


@interface XYRDDetailModel : XYBaseModel


//addtime = "2016-12-30 17:21:31";
//"goods_id" = 3;
//id = 3;
//otherData =         {
//    "car_num" = "\U5317\U4eac\U65b0\U53d1\U573020165";
//    "receiver_name" = "<null>";
//    "receiver_time" = "<null>";
//    "ship_time" = "2016-12-30";
//    shname = "\U5e7f\U897f\U6d66\U5be8";
//    status = "-1";
//    "wholesale_name" = 2a;
//    wname = "\U5317\U4eac\U65b0\U53d1\U5730";
//};
//status = 2;
//type = 1;
//uid = 72;

//id  消息id
//status  显示类型1: 未读；2：已读;
//type  1：发货消息；2：收货消息
//@property (nonatomic,strong) NSString <Optional> * xyid;
//@property (nonatomic,strong) NSString <Optional> * status;
//@property (nonatomic,strong) NSString <Optional> * addtime;
@property (nonatomic,strong) NSString <Optional> * type;
@property (nonatomic,strong) NSString <Optional> * goods_id;
@property (nonatomic,strong) NSString <Optional> * uid;
@property (nonatomic,strong) XYRDDetailOtherDataModel <Optional> * otherData;


/**
 *
 id  消息列表id
 status  显示类型1: 未读；2：已读;
 addtime  发货时间
 cars      车次
 name     果品名称
 placeofreceipt 发货地
 sendtoplace   发往地
 sendstatus    收货状态1：在途；2：已收货；
 */
@property (nonatomic,strong) NSString <Optional> * xyid;
@property (nonatomic,strong) NSString <Optional> * status;
@property (nonatomic,strong) NSString <Optional> * addtime;
@property (nonatomic,strong) NSString <Optional> * cars;
@property (nonatomic,strong) NSString <Optional> * name;
@property (nonatomic,strong) NSString <Optional> * placeofreceipt;
@property (nonatomic,strong) NSString <Optional> * sendtoplace;
@property (nonatomic,strong) NSString <Optional> * sendstatus;

/**
 *  
 id    消息列表id
 status 显示类型1: 未读；2：已读;
 addtime  发货时间
 cars      车次
 name      果品名称
 placeofreceipt 发货地
 sendtoplace   收货地
 sendstatus   收货状态1：在途；2：已收货；
 getgoodstime 收货时间
 username 收货人
 senduser  发货人
 */

@property (nonatomic,strong) NSString <Optional> * getgoodstime;
@property (nonatomic,strong) NSString <Optional> * username;
@property (nonatomic,strong) NSString <Optional> * senduser;


@end


@interface XYRDModel : XYBaseModel

/**
 *
 id  消息列表id
 status  显示类型1: 未读；2：已读;
 addtime  发货时间
 */
@property (nonatomic,strong) NSString <Optional> * xyid;
@property (nonatomic,strong) NSString <Optional> * status;
@property (nonatomic,strong) NSString <Optional> * addtime;

@property (nonatomic,strong) NSString <Optional > *isClick;//点击 yes

@end
