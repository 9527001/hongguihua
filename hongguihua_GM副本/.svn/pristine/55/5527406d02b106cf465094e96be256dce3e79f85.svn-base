//
//  XYTextFieldDetailCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/8.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYTextFieldDetailCell.h"

@interface XYTextFieldDetailCell ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *upLine;
@property (weak, nonatomic) IBOutlet UIView *downLine;

@end

@implementation XYTextFieldDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self confirg];
}
- (void)confirg {
    _upLine.hidden = YES;
    _downLine.hidden = YES;
    
    
}

#pragma mark -- 用一个label做textView的placeHolder
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (textView.text.length > 0) {
        [self.rightLabel setHidden:YES];
    }else{
        [self.rightLabel setHidden:NO];
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        [self.rightLabel setHidden:YES];
    }else{
        [self.rightLabel setHidden:NO];
    }
    if (self.block) {
        self.block(textView.text,self.indexPath);
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length > 0) {
        [self.rightLabel setHidden:YES];
    }else{
        [self.rightLabel setHidden:NO];
    }
}

- (void)showtopline:(BOOL)top bottomline:(BOOL)bottom {
    _upLine.hidden = !top;
    _downLine.hidden = !bottom;
 
}



- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block {
    [super setModel:model IndexPath:indexPath callBack:block];
      self.block = block;
    if ([model isKindOfClass:[NSString class]]) {
        [self.contentTextView setText:model];
        if (self.contentTextView.text.length > 0){
            [self.rightLabel setHidden:YES];
        }else{
            [self.rightLabel setHidden:NO];
        }
    }
}

@end
