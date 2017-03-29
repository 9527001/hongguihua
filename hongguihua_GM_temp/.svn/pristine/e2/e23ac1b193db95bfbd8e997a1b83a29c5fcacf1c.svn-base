//
//  XYPhotoBrowser.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/16.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, PhotoBrowserType){
    PhotoBrowserSingle,
    PhotoBrowserMultiple
};
@interface XYPhotoBrowser : NSObject

@property (nonatomic, strong) UIViewController *controller;

+ (void)showPhotoBrowserWithTarget:(UIViewController *)controller type:(PhotoBrowserType)type callBack:(XYBlock)block;
+ (void)showPhotoBrowserWithTarget:(UIViewController *)controller andMaxImageCount:(NSInteger)maxCount type:(PhotoBrowserType)type callBack:(XYBlock)block;
@end
