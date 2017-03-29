//
//  YDEdgeSetsLabel.m
//  qihaoduobao
//
//  Created by 中企互联 on 16/6/2.
//  Copyright © 2016年 中企互联. All rights reserved.
//

#import "YDEdgeSetsLabel.h"

@implementation YDEdgeSetsLabel



- (void)drawTextInRect:(CGRect)rect {
//    CGFloat x = CGRectGetMinX(rect);
//    CGFloat y = CGRectGetMinY(rect);
//    CGFloat w = CGRectGetWidth(rect);
//    CGFloat h = CGRectGetHeight(rect);
    UIEdgeInsets insets = {5, 10, 5, 10};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}


@end
