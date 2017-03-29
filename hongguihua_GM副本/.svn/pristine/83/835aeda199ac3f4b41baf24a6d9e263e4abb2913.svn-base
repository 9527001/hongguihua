//
//  XYStandardCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYStandardCell.h"

#import "XYMessageListModel.h"
@interface XYStandardCell ()

@property (weak, nonatomic) IBOutlet UIView *seperatorLine;

@property (nonatomic,strong) NSArray * notesArr;
@property (nonatomic,strong) NSArray * statusArr;
@property (nonatomic,strong) NSArray * picsArr;
@property (nonatomic,strong) NSArray * titlesArr;
@end

@implementation XYStandardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.icon xy_setCornerRadius:5.0f];
    self.notesArr = @[@"待审批",@"审批完成（同意）",@"审批完成（拒绝）"];
    self.statusArr = @[@"待确认",@"已确认"];
    self.titlesArr = @[@"审核消息",@"请假消息",@"报销消息",@"出差消息",@"外出消息",@"转正消息",@"发货消息",@"收货消息",@"销售消息"];
    self.picsArr = @[@"message_shenhe",@"message_qingjia",@"message_baoxiao",@"message_chuchai",@"message_waichu",@"message_zhuanzheng",@"message_waichu",@"message_zhuanzheng",@"home_sale"];
}
- (void)setModel:(XYMineCasesModel *)model {
    _model = model;
    [self.icon kSetImageWithURL:m_userModel.photo placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
    [self.rightLabel setText:model.addtime];
    NSInteger index = [model.status integerValue] - 1;
    if (self.notesArr.count) {
        [self.notesLabel setText:[self.notesArr safeObjectAtIndex:index]];
    }
    [self.seperatorLine setHidden:YES];
    
}

- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block {
    [super setModel:model IndexPath:indexPath callBack:block];
    if ([model isKindOfClass:[XYMessageCaseModel class]]) {
        
        XYMessageCaseModel * dataModel = model;
        [self.icon kSetImageWithURL:m_userModel.photo placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
        [self.rightLabel setText:dataModel.name];
        NSInteger type = [dataModel.type integerValue]  - 1;
        if (self.titlesArr.count) {
            NSString * title = [self.titlesArr safeObjectAtIndex:type];
            [self.titleLabel setText:title];
        }
        if (self.picsArr.count) {
            NSString * imageStr = [self.picsArr safeObjectAtIndex:type];
            [self.icon setImage:[UIImage imageNamed:imageStr]];
        }
        if ([dataModel.type integerValue] > 6) {
            [self.notesLabel setText:[NSString stringWithFormat:@"您有%@条消息未读",dataModel.number]];
        }else{
            [self.notesLabel setText:[NSString stringWithFormat:@"您于%@申请...",dataModel.name]];
        }
    }
}

- (void)setGearalModel:(id)model {
    [super setGearalModel:model];
    if ([model isKindOfClass:[XYControlModel class]]) {
        XYControlModel * dataModel = model;
        [self.icon kSetImageWithURL:m_userModel.photo placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
        [self.rightLabel setText:dataModel.addtime];
        NSInteger index = [dataModel.status integerValue] - 1;
        if (self.notesArr.count) {
            [self.notesLabel setText:[self.notesArr safeObjectAtIndex:index]];
        }
        [self.titleLabel setText:[NSString stringWithFormat:@"%@上传的商品",dataModel.loginname]];
    }
    
    if ([model isKindOfClass:[XYReceiverModel class]]) {
        XYReceiverModel * dataModel = model;
        [self.icon kSetImageWithURL:m_userModel.photo placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
        [self.rightLabel setText:dataModel.addtime];
        NSInteger index = [dataModel.sendstatus integerValue] - 1;
        if (self.notesArr.count) {
            [self.notesLabel setText:[self.statusArr safeObjectAtIndex:index]];
        }
        [self.titleLabel setText:[NSString stringWithFormat:@"%@",dataModel.username]];
    }
    
    
}
@end
