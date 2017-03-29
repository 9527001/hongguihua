//
//  XYBaseRequest.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//
#define uploadPhotos @"pics[]"
#define uploadPhoto @"photo"

#import "XYBaseRequest.h"
#import "XYModel.h"

@interface XYBaseRequest()
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, assign) Class modelType;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSArray *imagesArr;
@property (nonatomic, assign) YTKRequestMethod requestMethod;
@end
@implementation XYBaseRequest


- (id)initWithRequsetParameters:(NSDictionary *)parameters Path:(NSString *)path ModelType:(Class)modelType image:(id )image
{
    if (self = [super init]) {
        _parameters = parameters;
        _path = path;
        _modelType = modelType;
        if ([image isKindOfClass:[NSArray class]]) {
            _imagesArr = image;
        }
        if ([image isKindOfClass:[UIImage class]]) {
            _image = image;
        }
    }
    return self;
}

- (id)initWithImage:(UIImage *)image{
    if (self = [super init]) {
        _image = image;
    }
    return self;
}

- (void)getWithCompletionBlockWithSuccess:(XYRequestCompletionBlock)success failure:(XYRequestFailureBlock)failure{
    _requestMethod = YTKRequestMethodGet;
    NSMutableString *logstr = [NSMutableString string];
    NSArray *keys = _parameters.allKeys;
    for (NSString *key in keys) {
        [logstr appendString:key];
        [logstr appendString:@"="];
        [logstr appendString:[_parameters xy_objectForKey:key]];
        if (![key isEqualToString:keys.lastObject]) {
            [logstr appendString:@"&"];
        }
    }
    DLog(@"\n<<<<<<<<<<<<< .GET请求URL\n%@index.php?mod=%@%@\nend.>>>>>>>>>>>>>\n",ServerURL, _path,logstr);
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        JSONModelError* err = nil;
        DLog(@"\nGET(%@)请求结果:\n%@", _path, request.responseString.xy_toDictionary);
        XYModel *obj = [[XYModel alloc] initWithString:request.responseString error:&err];
        if (!obj) {
            success(request, request.responseString);
        } else {
            /**
             code 10000:成功,20000:失败,30000:其他
             message
             */
            id model = obj.resultCode;
            if ([model isKindOfClass:[NSDictionary class]]) {
                model = [[_modelType alloc] initWithDictionary:model error:nil];
            } else if ([model isKindOfClass:[NSArray class]]) {
                NSMutableArray *arr = [NSMutableArray arrayWithCapacity:((NSArray *)model).count];
                for (NSDictionary *dic in model) {
                    id m = [[_modelType alloc] initWithString:dic.xy_toJsonString error:nil];
                    [arr addObject:m];
                }
                model = arr;
            }
            
            if ([@"10000" isEqualToString:obj.code]) {
                success(request, model);
            } else {
                failure(obj.message, obj);
            }
            
        }
    } failure:^(__kindof YTKBaseRequest *request) {
        failure(@"网络异常", nil);
    }];
}

- (void)postWithCompletionBlockWithSuccess:(XYRequestCompletionBlock)success failure:(XYRequestFailureBlock)failure{
    _requestMethod = YTKRequestMethodPost;
    NSMutableString *logstr = [NSMutableString string];
    NSArray *keys = _parameters.allKeys;
    for (NSString *key in keys) {
        [logstr appendString:[NSString stringWithFormat:@"&%@=",key]]; 
        if ([[_parameters xy_objectForKey:key] isKindOfClass:[NSArray class]]) {
            NSArray * arr = [_parameters xy_objectForKey:key];
            [logstr appendString:[NSString stringWithFormat:@"图片数组:%zd",arr.count]];
        }else{
            [logstr appendString:[_parameters xy_objectForKey:key]];
        }
    }
    DLog(@"\n<<<<<<<<<<<<< .POST请求URL\n%@index.php?mod=%@%@\nend.>>>>>>>>>>>>>\n",ServerURL, _path,logstr);
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        JSONModelError* err = nil;
        DLog(@"\nPOST(%@)请求结果:\n%@", _path, request.responseString.xy_toDictionary);
        XYModel *obj = [[XYModel alloc] initWithString:request.responseString error:&err];
        if (!obj) {
            success(request, request.responseString);
        } else {
            /**
             code 10000:成功,20000:失败,30000:其他
             message
             */
            id model = obj.resultCode;
            if ([model isKindOfClass:[NSDictionary class]]) {
                model = [[_modelType alloc] initWithDictionary:model error:nil];
            } else if ([model isKindOfClass:[NSArray class]]) {
                NSMutableArray *arr = [NSMutableArray arrayWithCapacity:((NSArray *)model).count];
                for (NSDictionary *dic in model) {
                    id m = [[_modelType alloc] initWithString:dic.xy_toJsonString error:nil];
                    [arr addObject:m];
                }
                model = arr;
            }
            
            if ([@"10000" isEqualToString:obj.code]) {
                success(request, model);
            } else {
//                failure(obj.message, model);
                failure(obj.message, obj);
            }
            
        }
    } failure:^(__kindof YTKBaseRequest *request) {
        failure(@"网络异常", nil);
    }];


}

- (NSString *)requestUrl {
    
    return [NSString stringWithFormat:@"index.php?mod=%@",_path];
    
}

- (YTKRequestMethod)requestMethod {
    if (_image) {
        return YTKRequestMethodPost;
    }
    return _requestMethod;
}


- (id)requestArgument {
    return _parameters;
}
- (NSTimeInterval)requestTimeoutInterval {
    return 10;
}
- (AFConstructingBlock)constructingBodyBlock {
    if (_image) {
        return ^(id<AFMultipartFormData> formData) {
 
                NSData *data = UIImageJPEGRepresentation(_image, 0.9);
                [formData appendPartWithFileData:data name:uploadPhoto fileName:@"png" mimeType:@"jpg/png"];
        };
    }
    
    if (_imagesArr.count) {
        return ^(id<AFMultipartFormData> formData) {
            
                for (NSInteger i = 0; i < _imagesArr.count; i ++) {
                    UIImage * upImage = [_imagesArr safeObjectAtIndex:i];
                    NSData *data = UIImageJPEGRepresentation(upImage, 0.9);
                    [formData appendPartWithFileData:data name:uploadPhotos fileName:@"jpg" mimeType:@"jpg/png"];
                }
           
        };
    }
    return [super constructingBodyBlock];
}

@end
