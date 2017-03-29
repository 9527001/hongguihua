//
//  XYTableViewCell.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/3.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYTableViewCell.h"

@implementation XYTableViewCell


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone; 
//    [self quse];
}
- (void)quse {
        self.layer.masksToBounds = YES;
        self.contentView.layer.masksToBounds = YES;
    
        /**
         去掉选中颜色变化方案
         所有的空间颜色赋值代码，转移到layoutsubviews中
         */
        self.selectedBackgroundView = [[UIView alloc]initWithFrame:self.frame];
        self.selectedBackgroundView.backgroundColor = [UIColor clearColor];

}


/**
 *
 *
 *  @param selected <#selected description#>
 *  @param animated <#animated description#>
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setGearalModel:(id)model{
    
}
- (void)setModel:(id)model type:(NSInteger )type IndexPath:(NSIndexPath *)indexPath callBack:( void(^)(id x,id y))block {
    self.indexPath = indexPath;
}
- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:( void(^)(id x,id y))block {
    self.indexPath = indexPath;
}

- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:( void(^)(id x,id y))block deleteBlock:( void(^)(id x,id y))deleteBlock {
    self.indexPath = indexPath;
}
@end
