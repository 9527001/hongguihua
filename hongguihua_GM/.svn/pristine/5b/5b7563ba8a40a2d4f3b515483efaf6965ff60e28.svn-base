//
//  NSDictionary+XYBaseRequest.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (XYBaseRequest)

- (void)xy_getWithModelType:(Class)modelType
                       Path:(NSString *)path
                        hud:(NSString *)hudText
                    Success:(XYRequestCompletionBlock)success
                    failure:(XYRequestFailureBlock)failure;

- (void)xy_postWithModelType:(Class)modelType
                        Path:(NSString *)path
                        hud:(NSString *)hudText
                     Success:(XYRequestCompletionBlock)success
                     failure:(XYRequestFailureBlock)failure;

- (void)xy_uploadImageWithImage:(UIImage *)image
                   modelType:(Class)modelType
                        Path:(NSString *)path
                     Success:(XYRequestCompletionBlock)success
                     failure:(XYRequestFailureBlock)failure;

@end
