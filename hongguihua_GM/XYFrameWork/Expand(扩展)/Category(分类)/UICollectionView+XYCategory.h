//
//  UICollectionView+XYCategory.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/3.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (XYCategory)
/**
 *  注册cell
 */
- (void)registerNib:(NSString *)nibName;
- (void)registerClass:(NSString *)className;

@end
