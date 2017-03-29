//
//  XYPhotoSheet.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/9.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYPhotoSheet : NSObject

- (void)xy_showActionSheetInView:(UIView *)view taget:(UIViewController *)controller title1:(NSString *)title1 title2:(NSString *)title2 cancel:(NSString *)cancel success:(XYBlock)success;


@end
