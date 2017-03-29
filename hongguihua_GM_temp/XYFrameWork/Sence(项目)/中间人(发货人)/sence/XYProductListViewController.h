//
//  XYProductListViewController.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/18.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYViewController.h"

typedef void(^CallBlock)(id x);  
@interface XYProductListViewController : XYViewController

@property (nonatomic,copy) CallBlock block;

@end
