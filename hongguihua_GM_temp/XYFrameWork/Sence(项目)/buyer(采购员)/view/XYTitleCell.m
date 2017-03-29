//
//  XYTitleCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/8.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYTitleCell.h"
#import "XYProductListModel.h"

@interface XYTitleCell ()
@property (nonatomic,strong) UIView * rightLine;
@property (nonatomic,strong) UIView * bottomLine;
@end

@implementation XYTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.titleLabel setText:@"加载中..."];
    
    //右侧线
    UIView * rightLine = [[UIView alloc] init];
    [self.contentView addSubview:rightLine];
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(1);
        make.right.equalTo(self.contentView.mas_right).offset(0);
    }];
    [rightLine setBackgroundColor:COLOR_SEPERATORLINE];
    self.rightLine = rightLine;
    
    
    //底部线
    UIView * bottomLine = [[UIView alloc] init];
    [self.contentView addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1); 
    }];
    [bottomLine setBackgroundColor:COLOR_SEPERATORLINE];
    self.bottomLine = bottomLine;

}
- (void)showBottom:(BOOL)show {
    [self.bottomLine setHidden:!show];
}
- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block {
    [super setModel:model IndexPath:indexPath callBack:block];
    self.block = block;
    if ([model isKindOfClass:[XYProductListModel class]]) {
        XYProductListModel * dataModel = model;
        [self.titleLabel setText:dataModel.reasons];
    }
    if ([model isKindOfClass:[XYManagementModel class]]) {
        XYManagementModel * dataModel = model;
        [self.titleLabel setText:dataModel.name];
    }
}

@end
