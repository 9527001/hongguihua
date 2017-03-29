//
//  XYMineCasesModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/14.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"


@interface XYReceiverModel : XYBaseModel

/**
 *
 id        列表id
 sendstatus 发货状态 1：在途；2：已收货；
 addtime   发货时间
 username  上传人姓名
 
 
 id  发货数据id
 car_num  车次编号
 ship_time  发货时间
 car_number_plate  车牌号
 phone  电话
 count_num 总件数
 other_cost  发货杂费
 status 状态：-1在途，1：已收货
 sname  发货地
 */
@property (nonatomic,copy) NSString <Optional>* xyid;
@property (nonatomic,copy) NSString <Optional>* addtime;
@property (nonatomic,copy) NSString <Optional>* sendstatus;
@property (nonatomic,copy) NSString <Optional>* username;

@property (nonatomic,copy) NSString <Optional>* sname;
@property (nonatomic,copy) NSString <Optional>* status;
@property (nonatomic,copy) NSString <Optional>* ship_time;
@property (nonatomic,copy) NSString <Optional>* car_num;

@end

@interface XYControlModel : XYBaseModel

/**
 *
 id       列表id
 addtime  采购员上传时间
 status    1：审核中；2:已通过；3：未通过;
 loginname  采购员姓名
 */
@property (nonatomic,copy) NSString * xyid;
@property (nonatomic,copy) NSString * addtime;
@property (nonatomic,copy) NSString * status;
@property (nonatomic,copy) NSString <Optional>* loginname;

@end


@interface XYMineCasesModel : XYBaseModel

/**
 *
 id     请假id
 addtime 申请时间
 status  审核状态（1:待审批;2:同意；3拒绝）
 logo   显示的图片
 */
@property (nonatomic,copy) NSString <Optional>* xyid;
@property (nonatomic,copy) NSString <Optional>* addtime;
@property (nonatomic,copy) NSString <Optional>* status;
@property (nonatomic,copy) NSString <Optional>* logo;

@end
