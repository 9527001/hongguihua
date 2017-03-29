//
//  UILabel+XYCategory.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/19.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "UILabel+XYCategory.h"

@implementation UILabel (XYCategory)

- (void)setText:(NSString *)text lineType:(NSUnderlineStyle)lineType
{
    if (self && self.text.length>0) {
        NSDictionary *attribtDic;
        if (lineType) {
            attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:lineType]};
        } else {
            attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        }
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:text attributes:attribtDic];
        self.attributedText = attribtStr;
    }
}

- (int)showLine{
    if (self && self.text.length>0) {
        [self setText:self.text lineType:NSUnderlineStyleSingle];
        return YES;
    }
    return NO;
}

- (void)test:(NSInteger )space {
    CGRect rect = self.frame;
    [self drawTextInRect: UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(space, space, space, space))];
}

@end
