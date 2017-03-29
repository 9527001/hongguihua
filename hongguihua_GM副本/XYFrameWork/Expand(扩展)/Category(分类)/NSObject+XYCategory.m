//
//  NSObject+XYCategory.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/10.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "NSObject+XYCategory.h"

@implementation NSObject (XYCategory)

- (id)xy_safeObj:(id)obj
{
    if (obj == nil || obj == NULL) {
        return [NSNull null];
    } else {
        return obj;
    }
}



@end
