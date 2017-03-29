//
//  YDProductTCell.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/21.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYTableViewCell.h"

@interface YDProductTCell : XYTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
- (void)showUp:(BOOL)up down:(BOOL)down;

@end
