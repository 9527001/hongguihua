//
//  YDProductTCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/21.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "YDProductTCell.h"

@interface YDProductTCell ()

@property (weak, nonatomic) IBOutlet UIView *upLineView;
@property (weak, nonatomic) IBOutlet UIView *downLineView;



@end


@implementation YDProductTCell
- (void)awakeFromNib {
    [super awakeFromNib];
    [self.upLineView setBackgroundColor:XY_HEX_RGB(0xEFEFF4)];
    [self.downLineView setBackgroundColor:XY_HEX_RGB(0xEFEFF4)];
    [self.arrowImageView setHidden:YES];
}

- (void)showUp:(BOOL)up down:(BOOL)down {
    [self.upLineView setHidden:!up];
    [self.downLineView setHidden:!down];
}
@end
