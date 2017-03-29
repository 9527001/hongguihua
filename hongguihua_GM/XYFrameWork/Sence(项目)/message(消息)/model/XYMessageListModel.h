//
//  XYMessageListModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/7.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"

@interface XYMessageListDetailModel : XYBaseModel
/**
 *
 addtime 提交审核时间
 name   商品名称
 status   审核状态1：审核中；2:已通过；3：未通过;
 
 addtime = "2016-06-20 18:48:18";
 name = "\U8292\U679c";
 status = 1;
 
 */
@property (nonatomic,copy) NSString <Optional>* status;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* addtime;

@end
@interface XYMessageCaseModel : XYBaseModel
/**
 *  
 addtime   提交时间
 type  1:商品审核;2:请假;3:报销；4：出差；5：外出；6：转正 7:发货消息；8：收货消息；
number 未读消息数
 */
@property (nonatomic,copy) NSString <Optional>* type;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* number;
@property (nonatomic,strong) NSArray <Optional>* photosArr;
@property (nonatomic,strong) NSString <Optional>* status;

@end
@interface XYMessageListModel : XYBaseModel
/**
 *
 id     列表id
 photos 商品图片
 addtime提交时间
 name  商品名称
 reasons 事由
 */
@property (nonatomic,copy) NSString <Optional>* xyid;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* addtime;
@property (nonatomic,copy) NSString <Optional>* reasons;
@property (nonatomic,strong) NSString <Optional>* photos;

@end
