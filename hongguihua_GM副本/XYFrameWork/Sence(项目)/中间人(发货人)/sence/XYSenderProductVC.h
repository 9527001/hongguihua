//
//  XYSenderProductVC.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/21.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYViewController.h"

typedef void(^XYSenderProductBlock)(id x,id y);
@interface XYSenderProductVC : XYViewController

- (instancetype)initWithType:(BOOL)isEdit dataArr:(NSMutableArray *)arr index:(NSInteger)index;
@property (nonatomic,copy) XYSenderProductBlock block;

@end
