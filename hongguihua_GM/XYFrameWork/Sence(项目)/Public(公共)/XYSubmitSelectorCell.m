//
//  XYSubmitSelectorCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/17.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYSubmitSelectorCell.h"

@interface XYSubmitSelectorCell ()

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftBtnTrailling;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightBtnLeading;
@end

@implementation XYSubmitSelectorCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.leftBtn xy_setCornerRadius:5.f];
    [self.rightBtn xy_setCornerRadius:5.f];
    XYWeakSelf
    [self.leftBtn bk_whenTapped:^{
        weakSelf.block(@"2",self.indexPath);
    }];
    [self.rightBtn bk_whenTapped:^{
        weakSelf.block(@"1",self.indexPath);
    }];
}
- (void)setTextLeft:(NSString *)left textRight:(NSString *)right BGCLeft:(UIColor *)colorL BGC:(UIColor *)colorR space:(CGFloat)sapce indexPaht:(NSIndexPath *)indexPath callBlock:(void (^)(id x,id y))block {
    self.block = block;
    self.indexPath = indexPath;
    [_leftBtn setTitle:left forState:UIControlStateNormal];
    [_rightBtn setTitle:right forState:UIControlStateNormal];
    [_leftBtn setBackgroundColor:colorL];
    [_rightBtn setBackgroundColor:colorR];
    _leftBtnTrailling.constant = sapce;
    _rightBtnLeading.constant = sapce;
    [self setNeedsLayout];
    
}
@end
