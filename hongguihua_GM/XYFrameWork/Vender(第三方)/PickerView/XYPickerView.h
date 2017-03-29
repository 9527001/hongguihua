//
//  XYPickerView.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/12.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYView.h"


typedef NS_ENUM(NSInteger, PickerType) {
    PickerTypeDefault,
    PickerTypeDate,
    PickerTypeModelNeedIndex,
};

@interface XYPickerView : XYView

@property (nonatomic,strong ) NSMutableArray * dataArr;
+ (void)createPickerViewOnView:(UIView *)view andTitle:(NSString *)title andIndexPath:(NSIndexPath *)indexPath andDataArr:(NSArray *)arr type:(PickerType )type callBack:(void(^)(id x,id y))block; 

+ (void)createPickerViewOnView:(UIView *)view andTitle:(NSString *)title andIndexPath:(NSIndexPath *)indexPath andDataArr:(NSArray *)arr type:(PickerType )type XYZBlock:(void(^)(id x,id y,id z))block;

@end
