//
//  XYProductListModel.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/17.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYProductListModel.h"


@implementation XYManagementModel
- (void)setSendtime:(NSString<Optional> *)sendtime {
    if (sendtime) {
        NSArray * strArr = [sendtime componentsSeparatedByString:@"-"];
        NSString * result = [NSString stringWithFormat:@"%@.%@",[strArr firstObject],[strArr safeObjectAtIndex:1]];
        _sendtime = result;
    }
}

@end

@implementation XYProductListModel


@end
