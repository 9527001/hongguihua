//
//  XYReceiveTCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYReceiveTCell.h"

@interface XYReceiveTCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightDownLabel;



@property (nonatomic,strong) NSArray * statusArr;
@property (nonatomic,strong) NSArray * notesArr;

@end

@implementation XYReceiveTCell


- (void)awakeFromNib {
    [super awakeFromNib];
    self.statusArr = @[@"待确认",@"已确认"];
    self.notesArr = @[@"待审批",@"审批完成（同意）",@"审批完成（拒绝）"];
    
    
}
- (void)setModel:(XYReceiverModel *)model {
    XYReceiverModel * dataModel = model;
    [self.titleLabel setText:[NSString stringWithFormat:@"%@",dataModel.username]];
    [self.rightLabel setText:dataModel.addtime];
    NSInteger index = 0;
    switch ([dataModel.status integerValue]) {
        case -1:
            index = 0;
            break;
        case 1:
            index = 1;
            break;
            
        default:
            break;
    } 
    if (self.notesArr.count) {
        [self.notesLabel setText:[self.statusArr safeObjectAtIndex:index]];
    }
    [self.rightDownLabel setText:[NSString stringWithFormat:@"%@",model.car_num]];
}

@end
