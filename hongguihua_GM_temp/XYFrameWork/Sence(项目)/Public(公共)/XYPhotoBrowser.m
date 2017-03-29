//
//  XYPhotoBrowser.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/16.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYPhotoBrowser.h"
#import "ZLPhotoPickerViewController.h"
#import "UIImage+ZLPhotoLib.h"
#import "ZLPhoto.h"
@interface XYPhotoBrowser () <ZLPhotoPickerBrowserViewControllerDelegate>

//@property (nonatomic , strong) NSMutableArray *assets;
//@property (nonatomic, copy) XYBlock block;

@end
@implementation XYPhotoBrowser


+ (void)showPhotoBrowserWithTarget:(UIViewController *)controller andMaxImageCount:(NSInteger)maxCount type:(PhotoBrowserType)type callBack:(XYBlock)block {
    switch (type) {
        case PhotoBrowserSingle:
        {
            
        }
            break;
        case PhotoBrowserMultiple:
        {
            [self photoSelectet:controller andMaxImageCount:maxCount callBack:block];
        }
            break;
        default:
            break;
    }
}
+ (void)showPhotoBrowserWithTarget:(UIViewController *)controller type:(PhotoBrowserType)type callBack:(XYBlock)block
{
    switch (type) {
        case PhotoBrowserSingle:
        {
            
        }
            break;
            case PhotoBrowserMultiple:
        {
            [self photoSelectet:controller callBack:block];
        }
            break;
        default:
            break;
    }
}


#pragma mark - 选择图片

+ (void)photoSelectet:(UIViewController *)controller  andMaxImageCount:(NSInteger)maxCount  callBack:(XYBlock)block {
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
    // MaxCount, Default = 9
    pickerVc.maxCount = maxCount;
    // Jump AssetsVc
    pickerVc.status = PickerViewShowStatusCameraRoll;
    // Filter: PickerPhotoStatusAllVideoAndPhotos, PickerPhotoStatusVideos, PickerPhotoStatusPhotos.
    pickerVc.photoStatus = PickerPhotoStatusPhotos;
    // Recoder Select Assets
    //    pickerVc.selectPickers = self.assets;
    // Desc Show Photos, And Suppor Camera
    pickerVc.topShowPhotoPicker = YES;
    pickerVc.isShowCamera = YES;
    // CallBack
    pickerVc.callBack = ^(NSArray<ZLPhotoAssets *> *status){
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:status.count];
        for (id obj in status) {
            
            // 如果是本地ZLPhotoAssets就从本地取，否则从网络取
            if ([obj isKindOfClass:[ZLPhotoAssets class]]) {
                [arr addObject:[obj thumbImage]];
            }else if ([obj isKindOfClass:[ZLCamera class]]){
                [arr addObject:[obj thumbImage]];
            }else if ([obj isKindOfClass:[NSString class]]){
                [arr addObject:[UIImage imageWithUrl:obj]];
            }
        }
        if (block) {
            block(arr);
        }
    };
    [pickerVc showPickerVc:controller];
}
+ (void)photoSelectet:(UIViewController *)controller callBack:(XYBlock)block{
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
    // MaxCount, Default = 9
    pickerVc.maxCount = 5;
    // Jump AssetsVc
    pickerVc.status = PickerViewShowStatusCameraRoll;
    // Filter: PickerPhotoStatusAllVideoAndPhotos, PickerPhotoStatusVideos, PickerPhotoStatusPhotos.
    pickerVc.photoStatus = PickerPhotoStatusPhotos;
    // Recoder Select Assets
//    pickerVc.selectPickers = self.assets;
    // Desc Show Photos, And Suppor Camera
    pickerVc.topShowPhotoPicker = YES;
    pickerVc.isShowCamera = YES;
    // CallBack
    pickerVc.callBack = ^(NSArray<ZLPhotoAssets *> *status){
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:status.count];
        for (id obj in status) {
            
            // 如果是本地ZLPhotoAssets就从本地取，否则从网络取
            if ([obj isKindOfClass:[ZLPhotoAssets class]]) {
                [arr addObject:[obj thumbImage]];
            }else if ([obj isKindOfClass:[ZLCamera class]]){
                [arr addObject:[obj thumbImage]];
            }else if ([obj isKindOfClass:[NSString class]]){
                [arr addObject:[UIImage imageWithUrl:obj]];
            }
        }
        if (block) {
            block(arr);
        }
    };
    [pickerVc showPickerVc:controller];
}


@end
