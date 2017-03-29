//
//  XYMineCasesDetailModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/14.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"

@interface XYMineCasesDetailModel : XYBaseModel
/**
 *  请假详情
 *
 id     请假id
 cid   所在部门(1:国外采购;2:收货人员;3:国内高管)
 starttime 开始时间
 endtime  结束时间
 content   请假事由
 status  审核状态（1:待审批;2:同意；3拒绝）
 */

@property (nonatomic,copy) NSString <Optional>* xyid;
@property (nonatomic,copy) NSString <Optional>* cid;
@property (nonatomic,copy) NSString <Optional>* starttime;
@property (nonatomic,copy) NSString <Optional>* endtime;
@property (nonatomic,copy) NSString <Optional>* content;
@property (nonatomic,copy) NSString <Optional>* status;

/**
 *  报销详情
 *
 id     报销id
 cid   所在部门(1:国外采购;2:收货人员;3:国内高管)
 price  报销金额
 type  报销类别
 content费用明细
 status  审核状态（1:待审批;2:同意；3拒绝）
 */
@property (nonatomic,copy) NSString <Optional>* price;
@property (nonatomic,copy) NSString <Optional>* type;

/**
 *  外出详情
 *
 id     外出id
 cid   所在部门(1:国外采购;2:收货人员;3:国内高管)
 starttime 开始时间
 endtime  结束时间
 content   请假事由
 status  审核状态（1:待审批;2:同意；3拒绝）
 */


/**
 *  转正详情
 *
 id     转正id
 cid   所在部门(1:国外采购;2:收货人员;3:国内高管)
 content 使用总结
 opinion  意见建议
 content   请假事由
 status  审核状态（1:待审批;2:同意；3拒绝）
 */
@property (nonatomic,copy) NSString <Optional>* opinion;
@property (nonatomic,copy) NSString <Optional>* entrytime;

/**
 *  出差详情
 *
 id     出差id
 cid   所在部门(1:国外采购;2:收货人员;3:国内高管)
 price  报销金额
 type  报销类别
 content费用明细
 status  审核状态（1:待审批;2:同意；3拒绝）
 
 cid = 1;
 content = "\U4e16\U754c\U8fd9\U4e48\U5927.\U6211\U60f3\U53bb\U770b\U770b";
 id = 8;
 numberday = "41.5";
 place = "";
 status = 1;
 */
@property (nonatomic,copy) NSString <Optional>* place;
@property (nonatomic,copy) NSString <Optional>* numberday;




@end
