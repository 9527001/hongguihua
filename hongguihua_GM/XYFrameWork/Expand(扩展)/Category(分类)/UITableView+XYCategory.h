//
//  UITableView+XYCategory.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/3.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (XYCategory)
/**
 *  注册cell
 */
- (void)registerNib:(NSString *)nibName;
- (void)registerClass:(NSString *)className;

- (void)registerNibHeaderFooterView:(NSString *)nibName;
- (void)registerClassHeaderFooterView:(NSString *)className;

@end
