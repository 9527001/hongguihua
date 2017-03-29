//
//  NSDictionary+XYBaseRequest.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "NSDictionary+XYBaseRequest.h"


@implementation NSDictionary (XYBaseRequest)

- (void)xy_getWithModelType:(Class)modelType
                       Path:(NSString *)path
                        hud:(NSString *)hudText
                    Success:(XYRequestCompletionBlock)success
                    failure:(XYRequestFailureBlock)failure
{
    XYBaseRequest *requestapi = [[XYBaseRequest alloc] initWithRequsetParameters:self Path:path ModelType:modelType image:nil];
    __block MBProgressHUD *hud;
    dispatch_async(dispatch_get_main_queue(), ^{
        hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window]  animated:YES];
        hud.minShowTime = 1.2;
        if (!hudText || hudText.length==0) {
            hud.labelText = @"成功";
        } else {
            hud.labelText = hudText;
        }
    });
    [requestapi getWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request, id model) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
        success(request, model);
    } failure:^(NSString *msg, id model) {
        hud.labelText = NSLocalizedString(msg,@"");
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES afterDelay:1.5];
        });

    }];
    
}

- (void)xy_postWithModelType:(Class)modelType
                       Path:(NSString *)path
                        hud:(NSString *)hudText
                    Success:(XYRequestCompletionBlock)success
                    failure:(XYRequestFailureBlock)failure
{
    XYBaseRequest *requestapi = [[XYBaseRequest alloc] initWithRequsetParameters:self Path:path ModelType:modelType image:nil];
    __block MBProgressHUD *hud;
    dispatch_async(dispatch_get_main_queue(), ^{
        hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window]  animated:YES];
        hud.minShowTime = 1.2;
        if (!hudText || hudText.length==0) {
            hud.labelText = @"成功";
        } else {
            hud.labelText = hudText;
        }
    });
    [requestapi postWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request, id model) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
        success(request, model);
    } failure:^(NSString *msg, id model) {
        hud.labelText = NSLocalizedString(msg,@"");
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES afterDelay:1.5];
        });
        
    }];
}

- (void)xy_uploadImageWithImage:(UIImage *)image
                      modelType:(Class)modelType
                           Path:(NSString *)path
                        Success:(XYRequestCompletionBlock)success
                        failure:(XYRequestFailureBlock)failure
{
    XYBaseRequest *requestapi = [[XYBaseRequest alloc] initWithRequsetParameters:self Path:path ModelType:modelType image:image];
    __block MBProgressHUD *hud;
    dispatch_async(dispatch_get_main_queue(), ^{
        hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window]  animated:YES];
    });
    [requestapi postWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request, id model) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
        success(request, model);
    } failure:^(NSString *msg, id model) {
        hud.labelText = NSLocalizedString(msg,@"");
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES afterDelay:1.5];
        });
        
    }];
}

@end
