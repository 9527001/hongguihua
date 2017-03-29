//
//  XYTableViewCell.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/3.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CallBack)(id x,id y );
typedef void(^DeleteBlock)(id x,id y );

@interface XYTableViewCell : UITableViewCell

@property (nonatomic,copy) CallBack block;
@property (nonatomic,copy) DeleteBlock deleteBlock;


- (void)setGearalModel:(id)model;
@property (nonatomic, strong) NSIndexPath *indexPath;
- (void)setModel:(id)model type:(NSInteger )type IndexPath:(NSIndexPath *)indexPath callBack:( void(^)(id x,id y))block;
- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:( void(^)(id x,id y))block;
- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:( void(^)(id x,id y))block deleteBlock:( void(^)(id x,id y))deleteBlock;

@end
