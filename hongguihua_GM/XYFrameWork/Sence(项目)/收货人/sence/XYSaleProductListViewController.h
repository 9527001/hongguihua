//
//  XYSaleProductListViewController.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYViewController.h"


typedef void(^CallBlock)(id x);

@interface XYSaleProductListViewController : XYViewController

@property (nonatomic,copy) CallBlock block;

@end

