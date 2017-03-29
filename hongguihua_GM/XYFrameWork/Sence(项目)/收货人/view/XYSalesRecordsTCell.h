//
//  XYSalesRecordsTCell.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/8/25.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYTableViewCell.h"

#import "XYSenderModel.h"
@interface XYSalesRecordsTCell : XYTableViewCell

- (void)confirgModel:(id )dataModel anditemCellWidth:(CGFloat )itemWidth andSpecialLoacation:(CGFloat)specialLocation  indexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block;

- (void)confirgManageWithModel:(XYSenderProductModel * )dataModel anditemCellWidth:(CGFloat )itemWidth andSpecialLoacation:(CGFloat)specialLocation  indexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block;

- (void)dataArr:(NSMutableArray *)dataArr anditemCellWidth:(CGFloat )itemWidth andSpecialLoacation:(CGFloat)specialLocation;


@end
