//
//  XYToolBarView.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/10.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYToolBarView.h"
@interface XYToolBarView()
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UITextField *textFiled;

@end
@implementation XYToolBarView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.frame = CGRectMake(0, XY_M_SCREEN_H-30, XY_M_SCREEN_W, 30);
}
- (IBAction)clickToolBarBtn:(UIButton *)sender {
    
    if (_clickToolBarBlock) {
        self.clickToolBarBlock(_textFiled.text);
    }
}

@end
