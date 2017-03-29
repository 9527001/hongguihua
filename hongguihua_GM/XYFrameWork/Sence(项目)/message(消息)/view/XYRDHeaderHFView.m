//
//  XYRDHeaderHFView.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/8/26.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYRDHeaderHFView.h"

@interface XYRDHeaderHFView ()
@property (weak, nonatomic) IBOutlet UILabel *tiltleLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrow;

@end

@implementation XYRDHeaderHFView

- (void)awakeFromNib {
    [super awakeFromNib];
    [_statusLabel xy_setCornerRadius:CGRectGetMidX(_statusLabel.bounds)];
    [self.contentView setBackgroundColor:COLOR_WHITE];
}

- (void)setModel:(XYRDModel *)model {
    _model = model;
    [_tiltleLabel setText:model.addtime];
    //status  显示类型1: 未读；2：已读;
    if ([@"1" isEqualToString:model.status]) {
        [_statusLabel setBackgroundColor:COLOR_RED];
    }else if ([@"2" isEqualToString:model.status]){
        [_statusLabel setBackgroundColor:COLOR_GRAY_2];
    }else{
        NSLog(@"数据异常");
    }
    if ([@"1" isEqualToString:_model.isClick]) { 
        _arrow.transform = CGAffineTransformMakeRotation(0);
    }else if ([@"2" isEqualToString:_model.isClick]){
        _arrow.transform = CGAffineTransformMakeRotation(1.5);
        
    }else{
        
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.block) {
  
        self.block(_section);
    }
}
@end
