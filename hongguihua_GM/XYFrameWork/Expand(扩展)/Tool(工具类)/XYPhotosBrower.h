//
//  XYPhotosBrower.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYPhotosBrower : NSObject
 
+ (void)photoBrowerWithData:(NSArray *)dataArr;
+ (void)photoBrowerWithData:(NSArray *)dataArr index:(NSInteger )index;
+ (void)photoBrowerWithData:(NSArray *)dataArr index:(NSInteger )index imagesArr:(NSMutableArray *)imageViewArr; 
+ (void)photoBrower:(NSArray *)arr index:(NSInteger)index endit:(BOOL)endit;

@end
