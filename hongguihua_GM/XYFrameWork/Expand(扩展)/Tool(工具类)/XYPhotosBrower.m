//
//  XYPhotosBrower.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYPhotosBrower.h"

@implementation XYPhotosBrower


+ (void)photoBrowerWithData:(NSArray *)dataArr {
    [XYPhotosBrower photoBrowerWithData:dataArr index:0];
}

+ (void)photoBrowerWithData:(NSArray *)dataArr index:(NSInteger )index{
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:dataArr.count];
 
    for (NSInteger i = 0; i < dataArr.count; i ++) {
        ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
        id object = [dataArr safeObjectAtIndex:i];
        if ([object isKindOfClass:[NSString class]]) {
            if (![object hasPrefix:@"http"]) {
                object = [NSString stringWithFormat:@"%@%@",ImageUrl,object];
            }
        }
        photo.photoObj = object;
        [arr addObject:photo];
    }
    [XYPhotosBrower photoBrower:arr index:index endit:NO];
}

+ (void)photoBrowerWithData:(NSArray *)dataArr index:(NSInteger )index imagesArr:(NSMutableArray *)imageViewArr {
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:dataArr.count];
    for (NSInteger i = 0; i < dataArr.count; i ++) {
        ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
        id object = [dataArr safeObjectAtIndex:i];
        if ([object isKindOfClass:[NSString class]]) {
            if (![object hasPrefix:@"http"]) {
                object = [NSString stringWithFormat:@"%@%@",ImageUrl,object];
            }
        }
        photo.photoObj = object;
        photo.toView = [imageViewArr safeObjectAtIndex:i];
        [arr addObject:photo];
    }
    [XYPhotosBrower photoBrower:arr index:index endit:NO];
}

+ (void)photoBrower:(NSArray *)arr index:(NSInteger)index endit:(BOOL)endit{
    // 图片游览器
    ZLPhotoPickerBrowserViewController *pickerBrowser = [[ZLPhotoPickerBrowserViewController alloc] init];
    // 淡入淡出效果
    pickerBrowser.status = UIViewAnimationAnimationStatusZoom;
    // 数据源/delegate
    pickerBrowser.photos = arr;
    pickerBrowser.currentIndex = index;
    pickerBrowser.editing = endit;
    // 能够删除
    // 当前选中的值
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [pickerBrowser showPickerVc:window.rootViewController];
}
@end
