//
//  XYTitleCell1.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/12.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYTitleCell1.h"
@interface XYTitleCell1()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jiantouRight;
@property (nonatomic, assign) BOOL jiantou;
@property (nonatomic, assign) BOOL left;
@property (nonatomic, assign) BOOL right;
@property (nonatomic, assign) BOOL top;
@property (nonatomic, assign) BOOL bottom;


@end
@implementation XYTitleCell1

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)showLeft:(BOOL)left right:(BOOL)right topline:(BOOL)top bottomline:(BOOL)bottom jiantou:(BOOL)jiantou
{
    _left = left;
    _right = right;
    _jiantou = jiantou;
    _top = top;
    _bottom = bottom;
    _jiantouImage.hidden = !jiantou;
    _leftTitle.hidden = !left;
    _rightTitle.hidden = !right;
    _topLine.hidden = !top;
    _bottomLine.hidden = !bottom;

    if (_jiantou) {
        _jiantouRight.constant = 23;
    } else {
        _jiantouRight.constant = 2;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
