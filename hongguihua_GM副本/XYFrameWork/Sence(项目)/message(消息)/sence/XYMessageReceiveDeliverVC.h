//
//  XYMessageReceiveDeliverVC.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/8/26.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYViewController.h"

typedef enum : NSUInteger {
    receiveType = 0,
    develiverType = 1,
    saleType = 2,
} RDType;
@interface XYMessageReceiveDeliverVC : XYViewController

- (instancetype)initWithType:(RDType)type;
@end
