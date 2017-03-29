//
//  XYLoginXYView.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/4.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYLoginXYView.h"

@interface XYLoginXYView ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstant;

@end


@implementation XYLoginXYView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.login xy_setCornerRadius:5.0f];
    [self.icon xy_setCornerRadius:5.0f];
    if (XY_IS_IPHONE) {
        _widthConstant.constant = XY_M_SCREEN_MIN;
    }else{
        _widthConstant.constant = XY_M_SCREEN_MIN/2;
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
    [self.code setReturnKeyType:UIReturnKeyJoin];
    
}
- (IBAction)handle:(id)sender {
    if (self.block) {
        self.block(self.name.text,self.code.text, 0);
    }
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@" "]) {
        return NO;
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.name) {
        [textField resignFirstResponder];
        [self.code becomeFirstResponder];
    }
    if (textField == self.code) {
        [self.code resignFirstResponder];
        if (self.block) {
            self.block(self.name.text,self.code.text, 0);
        }
    }
    
    return YES;
    
}
@end
