//
//  YDAddressModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/29.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"

@protocol YDAddressDetailModel <NSObject> @end
@interface YDAddressDetailModel : XYBaseModel
/*
 id  批发地id
 name  批发地
 current_no  当前车次号
 addtime  添加时间
 */
@property (nonatomic,strong ) NSString <Optional> * xyid;
@property (nonatomic,strong ) NSString <Optional> * name;
@property (nonatomic,strong ) NSString <Optional> * current_no;
@property (nonatomic,strong ) NSString <Optional> * addtime;

@end


@interface YDAddressModel : XYBaseModel

@property (nonatomic,strong) NSMutableArray <YDAddressDetailModel,Optional>* wholesale;//批发地数据
@property (nonatomic,strong) NSMutableArray <YDAddressDetailModel,Optional>* ship;//  发货地

@end
