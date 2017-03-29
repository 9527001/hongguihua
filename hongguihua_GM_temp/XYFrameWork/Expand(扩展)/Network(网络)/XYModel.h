//
//  XYModel.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/11.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseModel.h"

@interface XYModel : XYBaseModel
@property (nonatomic, strong) NSString <Optional>*code;
@property (nonatomic, strong) NSString <Optional>*message;
@property (nonatomic, strong) NSObject <Optional>*resultCode;
@end
