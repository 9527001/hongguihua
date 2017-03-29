//
//  XYManagementNewModel.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/30.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYManagementNewModel.h"

@implementation XYManagementNewModel

- (NSString<Optional> *)saleStatus {
    NSInteger count = [self.count_num integerValue] - [self.current_all_num integerValue];
    return (count > 0 ? @"2" : @"1");
}
- (NSString<Optional> *)totalCost {
    CGFloat cost = 0.f;
    if ([_shipment_detail isKindOfClass:[NSArray class]]) {
        for (XYSenderProductModel * model in _shipment_detail) {
            CGFloat cost_temp = [model.totalprice floatValue];
            cost += cost_temp;
        }
    }
 
    return [NSString stringWithFormat:@"%.2lf",cost];
}
@end
