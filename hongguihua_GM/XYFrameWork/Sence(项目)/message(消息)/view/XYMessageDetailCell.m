//
//  XYMessageDetailCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/7.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYMessageDetailCell.h"

#import "YDEdgeSetsLabel.h"
@interface XYMessageDetailCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet YDEdgeSetsLabel *nameLabel;
@property (nonatomic,strong) UIView * customBackGroundView;

@property (weak, nonatomic) IBOutlet UIView *titleView;

@property (weak, nonatomic) IBOutlet UIView *moreView;

@property (nonatomic,strong) NSArray * statusArr;
@end

@implementation XYMessageDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.statusArr = @[@"审核中",@"已通过",@"未通过"];
}
- (void)setGearalModel:(id)model {
    [super setGearalModel:model];
    if ([model isKindOfClass:[XYMessageListDetailModel class]]) {
        XYMessageListDetailModel * dataModel = model;
        [_nameLabel setText:dataModel.name];
        [_titleLabel setText:[NSString stringWithFormat:@"您于%@提交的审核",dataModel.addtime]];
        [_statusLabel setText:[self.statusArr safeObjectAtIndex:([dataModel.status integerValue] - 1)]];
        [_timeLabel setText:[NSString stringWithFormat:@"申请时间%@",dataModel.addtime]];
    }
    [self extra];
}
- (void)extra {
    if(!self.customBackGroundView){
        self.customBackGroundView = [[UIView alloc] init];
        [self.customBackGroundView setBackgroundColor:COLOR_WHITE];
        
        [self.contentView insertSubview: self.customBackGroundView atIndex:0 ];
    }
    [self.customBackGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.titleView).offset(-2);
        make.right.mas_equalTo(self.titleView).offset(2);
        make.bottom.mas_equalTo(self.moreView.mas_bottom).offset(2);
    }];
    [self.customBackGroundView xy_setCornerRadius:5.0f];
    [self.customBackGroundView xy_setBorder:1.0f Color:COLOR_TableLine];
    
    
}
@end
