//
//  UIImage+XYBaseRequest.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "UIImage+XYBaseRequest.h"

@implementation UIImage (XYBaseRequest)
- (void)xy_uploadWithModelType:(Class)modelType Path:(NSString *)path Success:(XYRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure
{
    XYBaseRequest *requestapi = [[XYBaseRequest alloc] initWithImage:self];
    [requestapi uploadImageWithWithSuccess:^(__kindof YTKBaseRequest *request, id model) {
        success(request, model);
    } failure:^(__kindof YTKBaseRequest *request) {
        failure(request);
    }];
}
@end
