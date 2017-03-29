//
//  UIView+XYCategory.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/3.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, UIViewLineType){
    UIViewLineTop,
    UIViewLineBottom,
    UIViewLineLeft,
    UIViewLineRight,
    UIViewLineCenter
};
@interface UIView (XYCategory)
/**
 *  设置圆角
 */
- (void)xy_setCornerRadius:(CGFloat)cr;
- (void)xy_cornerRadiusDefault;
/**
 *  设置边框
 */
- (void)xy_setBorder:(CGFloat)bw Color:(UIColor *)bwColor;
/**
 *  设置默认边框,borderwith = 0.5
 */
- (void)xy_setBorderColor:(UIColor *)borderColor radius:(CGFloat)cr;
/**
 *  中间加线
 */
- (void)xy_addLine:(UIViewLineType)lineType color:(UIColor *)color space:(CGFloat)space;
/**
 *  从xib加载view
 */
+ (instancetype)xy_xib;
/**
 *  从xib加载索引view
 */
+ (instancetype)xy_xibAtIndex:(NSInteger)index;

@end
