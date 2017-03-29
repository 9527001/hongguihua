//
//  XYStandardCell.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYTableViewCell.h"


@interface XYStandardCell : XYTableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@property (nonatomic,strong ) XYMineCasesModel * model;
@end
