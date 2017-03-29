//
//  XYTitleCell.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/8.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYTableViewCell.h"

@interface XYTitleCell : XYTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (void)showBottom:(BOOL)show;
@end
