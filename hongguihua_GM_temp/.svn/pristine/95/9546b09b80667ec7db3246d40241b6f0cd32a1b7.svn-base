//
//  XYSubmitCell.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/17.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYSubmitCell.h"
@interface XYSubmitCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnleading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btntraling;

@end
@implementation XYSubmitCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.btn xy_setCornerRadius:10];
}


- (void)setTitle:(NSString *)title titleColor:(UIColor *)titleColor  backColor:(UIColor *)backColor space:(CGFloat)space enable:(BOOL)enable
{
    [self.btn setTitle:title forState:UIControlStateNormal];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.btn.backgroundColor = backColor;
    self.backgroundColor = [UIColor clearColor];
    [self.btn setTitleColor:titleColor forState:UIControlStateNormal];
    self.btnleading.constant = space;
    self.btntraling.constant = space;
    
    [self.btn setEnabled:enable];
}

- (IBAction)clickCellBtn:(UIButton *)sender {
    if (_clickCellBtnBlock) {
        _clickCellBtnBlock(sender);
    }
}
- (void)setTitle:(NSString *)title titleColor:(UIColor *)titleColor  backColor:(UIColor *)backColor space:(CGFloat)space enable:(BOOL)enable callBack:(void(^)(id x))block{
    _clickCellBtnBlock = block;
    [self.btn setTitle:title forState:UIControlStateNormal];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.btn.backgroundColor = backColor;
    self.backgroundColor = [UIColor clearColor];
    [self.btn setTitleColor:titleColor forState:UIControlStateNormal];
    self.btnleading.constant = space;
    self.btntraling.constant = space;
    
    [self.btn setEnabled:enable];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
