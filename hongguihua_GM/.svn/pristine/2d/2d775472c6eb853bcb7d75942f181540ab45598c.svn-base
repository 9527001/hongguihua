//
//  UICollectionView+XYCategory.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/3.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "UICollectionView+XYCategory.h"

@implementation UICollectionView (XYCategory)

- (void)registerNib:(NSString *)nibName
{
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:nibName];
}

- (void)registerClass:(NSString *)className
{
    [self registerClass:NSClassFromString(className) forCellWithReuseIdentifier:className];
}

@end
