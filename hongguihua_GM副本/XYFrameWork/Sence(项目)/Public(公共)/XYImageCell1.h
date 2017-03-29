//
//  XYImageCell1.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/26.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYImageCell1 : XYTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIView *toLine;
@property (weak, nonatomic) IBOutlet UIView *bottomLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLineLeading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineLeading;

@end
