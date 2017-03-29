//
//  XYSubmitCell.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/17.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYSubmitCell : XYTableViewCell
@property (nonatomic, copy) XYBlock clickCellBtnBlock;
@property (weak, nonatomic) IBOutlet UIButton *btn;
- (void)setTitle:(NSString *)title titleColor:(UIColor *)titleColor  backColor:(UIColor *)backColor space:(CGFloat)space enable:(BOOL)enable;
- (void)setTitle:(NSString *)title titleColor:(UIColor *)titleColor  backColor:(UIColor *)backColor space:(CGFloat)space enable:(BOOL)enable callBack:(void(^)(id x))block;
    
@end
