//
//  XYCollectionViewCell.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/3.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CallBack)(id x,id y );

@interface XYCollectionViewCell : UICollectionViewCell

@property (nonatomic,copy) CallBack block;

@property (nonatomic,strong ) NSIndexPath * indexPath;
- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:( void(^)(id x,id y))block;

@end
