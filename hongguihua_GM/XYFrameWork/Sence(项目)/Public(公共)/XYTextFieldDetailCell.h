//
//  XYTextFieldDetailCell.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/8.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYTableViewCell.h"

@interface XYTextFieldDetailCell : XYTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

- (void)showtopline:(BOOL)top bottomline:(BOOL)bottom;
@end
