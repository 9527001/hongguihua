//
//  UIView+XYCategory.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/3.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "UIView+XYCategory.h"

@implementation UIView (XYCategory)

/**
 *  设置圆角
 */
- (void)xy_setCornerRadius:(CGFloat)cr{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cr;
}

- (void)xy_cornerRadiusDefault {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = CGRectGetWidth(self.frame)/2.f;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.layer.borderWidth = 0.1f;
}
/**
 *  设置边框
 *
 *  @param bw      宽度
 *  @param bwColor 颜色
 */
- (void)xy_setBorder:(CGFloat)bw Color:(UIColor *)bwColor{
    self.layer.borderColor = bwColor.CGColor;
    self.layer.borderWidth = bw;
    self.layer.masksToBounds = YES;
}
/**
 *  设置默认边框 with = 0.5
 */
- (void)xy_setBorderColor:(UIColor *)borderColor radius:(CGFloat)cr
{
    [self xy_setBorder:0.5 Color:borderColor];
    [self xy_setCornerRadius:cr];
}
/**
 *  加线
 */
- (void)xy_addLine:(UIViewLineType)lineType color:(UIColor *)color space:(CGFloat)space
{
    switch (lineType) {
        case UIViewLineLeft:
        {
            
        }
            break;
        case UIViewLineRight:
        {
            
        }
            break;
        case UIViewLineTop:
        {
            UIView *line = [[UIView alloc] init];
            [self addSubview:line];
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(space);
                make.right.equalTo(self).offset(space);
                make.height.offset(1);
                make.top.equalTo(self);
            }];
        }
            break;
        case UIViewLineBottom:
        {
            
        }
            break;
        case UIViewLineCenter:
        {
            UIView *line = [[UIView alloc] init];
            [self addSubview:line];
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(space);
                make.right.equalTo(self).offset(space);
                make.height.offset(1);
                make.centerY.equalTo(self);
            }];
            
        }
            break;
        default:
            break;
    }
}

+ (instancetype)xy_xib
{
    //获得nib视图数组
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    //得到第一个UIView
    return nib.firstObject;
}

+ (instancetype)xy_xibAtIndex:(NSInteger)index
{
    //获得nib视图数组
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    //得到第一个UIView
    return [nib safeObjectAtIndex:index];
}
@end
