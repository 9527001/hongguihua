//
//  XYBaseRequest.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "YTKBaseRequest.h"

typedef void(^XYRequestCompletionBlock)(__kindof YTKBaseRequest *request, id model);
typedef void(^XYRequestFailureBlock)(NSString *msg, id model);
@interface XYBaseRequest : YTKBaseRequest

- (id)initWithRequsetParameters:(NSDictionary *)parameters Path:(NSString *)path ModelType:(Class)modelType image:(id )image;


- (void)getWithCompletionBlockWithSuccess:(XYRequestCompletionBlock)success
                                    failure:(XYRequestFailureBlock)failure;

- (void)postWithCompletionBlockWithSuccess:(XYRequestCompletionBlock)success
                                    failure:(XYRequestFailureBlock)failure;

@end
