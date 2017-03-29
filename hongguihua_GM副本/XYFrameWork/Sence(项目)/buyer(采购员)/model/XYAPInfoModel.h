//
//  XYAPInfoModel.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/15.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"


@protocol grade
@end
@protocol product
@end


@interface grade : XYBaseModel

@property (nonatomic,copy) NSString * xyid;
@property (nonatomic,copy) NSString * grade;

@end


@interface product : XYBaseModel

@property (nonatomic,copy) NSString <Optional>* xyid;
@property (nonatomic,copy) NSString <Optional>* name;
@property (nonatomic,copy) NSString <Optional>* addtime;

@end


@interface XYAPInfoModel : XYBaseModel
@property (nonatomic,strong) NSArray <grade   > * grade;
@property (nonatomic,strong) NSArray <product > * product;

@end
