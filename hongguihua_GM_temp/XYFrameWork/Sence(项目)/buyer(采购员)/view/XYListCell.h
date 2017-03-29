//
//  XYLIstCell.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/8.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYTableViewCell.h"

@interface XYListCell : XYTableViewCell
 
- (void)confirgModel:(id )dataModel anditemCellWidth:(CGFloat )itemWidth andSpecialLoacation:(CGFloat)specialLocation  indexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block;
@end
