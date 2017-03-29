//
//  UITableView+XYCategory.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/3.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "UITableView+XYCategory.h"

@implementation UITableView (XYCategory)

/**
 *  注册cell
 */
- (void)registerNib:(NSString *)nibName
{
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil]   forCellReuseIdentifier:nibName];
}

- (void)registerClass:(NSString *)className
{
    [self registerClass:NSClassFromString(className) forCellReuseIdentifier:className];
}
- (void)registerClassHeaderFooterView:(NSString *)className {
    
    [self  registerClass:NSClassFromString(className) forHeaderFooterViewReuseIdentifier:className];
}
- (void)registerNibHeaderFooterView:(NSString *)nibName
{
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil]   forCellReuseIdentifier:nibName];
}
@end
