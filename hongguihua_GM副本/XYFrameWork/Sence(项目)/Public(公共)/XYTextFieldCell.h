//
//  XYTextFieldCell.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/27.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    defult,
    pureNumber,
    demical,
} TextFieldType;

@interface XYTextFieldCell : XYTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UITextField *rightTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLineLeading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineLeading;
@property (weak, nonatomic) IBOutlet UIView *topLine;
@property (weak, nonatomic) IBOutlet UIView *bottomLine;
@property (weak, nonatomic) IBOutlet UIImageView *jiantou;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightTextFieldTrailing;


- (void)showtopline:(BOOL)top bottomline:(BOOL)bottom jiantou:(BOOL)jiantou;


@property (nonatomic,assign) TextFieldType  tfType;
@property (nonatomic,assign) BOOL isMax;
@property (nonatomic,assign) NSInteger  maxCount;


@end
