//
//  UIViewController+XYBaseRequest.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/6/13.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MJRefreshComponentRefreshingBlock)();
typedef NS_ENUM(NSInteger, RefreshType){
    RefreshTypeNone = 0,
    RefreshTypeHeader,
    RefreshTypeFooter,
    RefreshTypeAll
};

@interface UIViewController (XYBaseRequest)

- (void)xy_getWithValues:(NSDictionary *)values
               ModelType:(Class)modelType
                    Path:(NSString *)path
                     hud:(NSString *)hudText
                 Success:(XYRequestCompletionBlock)success
                 failure:(XYRequestFailureBlock)failure;

- (void)xy_postWithValues:(NSDictionary *)values
                ModelType:(Class)modelType
                     Path:(NSString *)path
                      hud:(NSString *)hudText
                  Success:(XYRequestCompletionBlock)success
                  failure:(XYRequestFailureBlock)failure; 
 
/**
 *  图片上传 支持多张和单张
 *
 *  @param values    其他参数
 *  @param image     image 可以是一个对象，也可以是数组，但对象或数组里的对象必须是UIImage
 *  @param modelType 模型
 *  @param path      路径
 *  @param success
 *  @param failure
 */
- (void)xy_uploadPhotoWithValues:(NSDictionary *)values
                           Image:(id )image
                       modelType:(Class)modelType
                            Path:(NSString *)path
                         Success:(XYRequestCompletionBlock)success
                         failure:(XYRequestFailureBlock)failure;

/**
 *  MJRefresh封装
 */
- (void)xy_refreshWithRefreshType:(RefreshType)type success:(MJRefreshComponentRefreshingBlock)success;
- (void)xy_refreshWithRefreshType:(RefreshType)type TableView:(UITableView *)tableView Pagination:(Pagination *)pagination success:(MJRefreshComponentRefreshingBlock)success;

@end
