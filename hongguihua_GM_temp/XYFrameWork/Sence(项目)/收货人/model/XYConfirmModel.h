//
//  XYConfirmModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"

@interface XYConfirmModel : XYBaseModel
/**
 *  
 token	用户唯一标示
 sid	列表id
 unit	实际到货件数
 otherprice	杂费
 arrivetime	到货日期
 weight	重量
 */
@property (nonatomic,copy) NSString <Optional>* sid;
@property (nonatomic,copy) NSString <Optional>* unit;
@property (nonatomic,copy) NSString <Optional>* cell;//单位
@property (nonatomic,copy) NSString <Optional>* otherprice;
@property (nonatomic,copy) NSString <Optional>* arrivetime;
@property (nonatomic,copy) NSString <Optional>* weight;

@end
