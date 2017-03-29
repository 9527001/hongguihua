//
//  SBZCustomDistrictSelectorPickerView.h
//  saibaiz
//
//  Created by 中企互联 on 15/12/11.
//  Copyright © 2015年 中企互联. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SBZCustomDistrictSelectorPickerViewBlock)(id x,NSArray * dataArr,NSArray * dataCodeArr);

@interface SBZCustomDistrictSelectorPickerView : UIView

+ (instancetype)instanceWith;
+ (instancetype)instanceWithSuperView:(UIView *)superView;

@property (nonatomic,copy) SBZCustomDistrictSelectorPickerViewBlock block;//

- (void)selectIndexZero:(NSInteger)row;

@end
