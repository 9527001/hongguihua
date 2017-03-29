//
//  XYAPInfoModel.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/15.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYAPInfoModel.h"
  
@implementation grade
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"xyid"}];
}
@end

@implementation product
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"xyid"}];
}
@end

@implementation XYAPInfoModel


@end
