//
//  XYPorductCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/18.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYPorductCell.h"

@interface XYPorductCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageview;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightUpLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftDownLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightDownLabel;

@end


@implementation XYPorductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.iconImageview xy_setCornerRadius:5.0f];
}
- (void)setGearalModel:(id)model {
    [super setGearalModel:model];
    if ([model isKindOfClass:[XYSendProductModel class]]) {//发货列表
        [self.rightUpLabel setHidden:YES];
        XYSendProductModel * dataModel = model;
        [self.iconImageview setImage:PLACEHOLDERDEFAULTICONIMAGE];
        [self.titleLabel setText:dataModel.name];
        
        [self.leftDownLabel setText:[NSString stringWithFormat:@"发货总数：%@件",dataModel.sendunit]];
        [self.rightDownLabel setHidden:YES];
         
    }
    if ([model isKindOfClass:[XYSaleProductModel class]]) {//出售列表
        [self.rightUpLabel setHidden:NO];
        XYSaleProductModel * dataModel = model;
        [self.iconImageview setImage:PLACEHOLDERDEFAULTICONIMAGE];
        [self.titleLabel setText:[NSString stringWithFormat:@"%@发出的%@",dataModel.username,dataModel.name]];
        [self.rightUpLabel setText:dataModel.name];
        [self.rightUpLabel setHidden:YES];
        
        [self.leftDownLabel setText:[NSString stringWithFormat:@"已发出：%@件",dataModel.sellnumbers]];
        NSInteger sum = [dataModel.gunit integerValue];
        NSInteger send = [dataModel.sellnumbers integerValue];
        [self.rightDownLabel setText:[NSString stringWithFormat:@"剩余：%zd件",sum - send]];
    }
 
}

@end
