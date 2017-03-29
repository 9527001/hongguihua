//
//  XYMineCasesDetailCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYMineCasesDetailCell.h"

@interface XYMineCasesDetailCell ()
@property (nonatomic,strong) NSMutableArray * contentArr;
@property (nonatomic,strong) NSArray * departmentArr;
@property (nonatomic,strong) NSArray * statusArr;
@end

@implementation XYMineCasesDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
     
    self.departmentArr = @[@"国外采购",@"中间人",@"国内高管",@"第三人"];
    self.statusArr = @[@"待审批",@"同意",@"拒绝"];
}
- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block {
    [super setModel:model IndexPath:indexPath callBack:block];
    self.dataModel = model;
}
-(void)setModel:(id)model type:(NSInteger)type IndexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block {
    [super setModel:model type:type IndexPath:indexPath callBack:block];
    if ([model isKindOfClass:[XYMineCasesDetailModel class]]) {
        XYMineCasesDetailModel * mcdModel = model;
        NSString * department = [self.departmentArr safeObjectAtIndex:([mcdModel.cid integerValue] - 1)];
        NSString * status = [self.statusArr safeObjectAtIndex:([mcdModel.status integerValue] - 1)];
        /**
         *  
         AskForLeave, //请假
         SubmitAnExpenseAccount, //报销
         Out, //外出
         Positive, //转正
         OnABusinessTrip, //出差
         */
        switch (type) {
            case 0:
            {
                self.contentArr = [NSMutableArray arrayWithArray:@[department,mcdModel.starttime,mcdModel.endtime,mcdModel.content,status]];
            }
                break;
            case 1:
            {
                self.contentArr = [NSMutableArray arrayWithArray:@[department,mcdModel.price,mcdModel.type,mcdModel.content,status]];
            }
                break;
            case 2:
            {
                self.contentArr = [NSMutableArray arrayWithArray:@[department,mcdModel.starttime,mcdModel.endtime,mcdModel.content,status]];
            }
                break;
            case 3:
            {
                self.contentArr = [NSMutableArray arrayWithArray:@[department,mcdModel.entrytime,mcdModel.content,mcdModel.opinion,status]];
            }
                break;
            case 4:
            {
                self.contentArr = [NSMutableArray arrayWithArray:@[department,mcdModel.place,mcdModel.numberday,mcdModel.content,status]];
            }
                break;


            default:
                break;
        }
    }
    if (indexPath.row == 4) {
        [self.notesLabel setTextColor:COLOR_RED];
    }else{
        [self.notesLabel setTextColor:COLOR_GRAY_2];
    }
    [self.notesLabel setText:[self.contentArr safeObjectAtIndex:indexPath.row]];
   
}
- (void)setDataModel:(XYMineCasesDetailModel *)dataModel {
    _dataModel = dataModel;
    
    
}
@end
