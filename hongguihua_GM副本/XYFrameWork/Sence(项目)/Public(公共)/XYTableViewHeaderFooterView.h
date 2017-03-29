//
//  XYableViewHeaderFooterView.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/7.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface XYTableViewHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic,strong ) UILabel * titleLabel;

+ (void)registerClass:(UITableView *)tableView;


- (void)confirgDataArr:(NSArray *)dataArr andItemWidth:(CGFloat)itemWidth;
- (void)confirgDataArr:(NSArray *)dataArr andBackGroundColor:(UIColor *)color andItemWidth:(CGFloat)itemWidth;


@end
