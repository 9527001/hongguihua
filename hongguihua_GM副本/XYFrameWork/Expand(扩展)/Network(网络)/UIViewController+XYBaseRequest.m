//
//  UIViewController+XYBaseRequest.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/6/13.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#define hubText @"正在玩命加载中..."
#import "UIViewController+XYBaseRequest.h"
#import "XYLoginViewController.h"

@implementation UIViewController (XYBaseRequest)
- (void)xy_getWithValues:(NSDictionary *)values
               ModelType:(Class)modelType
                    Path:(NSString *)path
                     hud:(NSString *)hudText
                 Success:(XYRequestCompletionBlock)success
                 failure:(XYRequestFailureBlock)failure
{
    XYViewController *mself;
    if ([self respondsToSelector:@selector(setMTableView:)]) {
        mself = (XYViewController *)self;
    }
    XYBaseRequest *requestapi = [[XYBaseRequest alloc] initWithRequsetParameters:values Path:path ModelType:modelType image:nil];
    __block MBProgressHUD *hud;
    dispatch_async(dispatch_get_main_queue(), ^{
        hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window]  animated:YES];
        hud.minShowTime = 1.2;
        if (!hudText || hudText.length==0) {
            hud.labelText = hubText;
        } else {
            hud.minShowTime = 1.2;
            hud.labelText = hudText;
        }
    });
    [requestapi getWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request, id model) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
        success(request, model);
        if (mself) {
            if (mself.mTableView.mj_footer.isRefreshing) {
                [mself.mTableView.mj_footer endRefreshing];
            }
            if (mself.mTableView.mj_header.isRefreshing) {
                [mself.mTableView.mj_header endRefreshing];
            }
        }
    } failure:^(NSString *msg, XYModel * model) {
        hud.labelText = NSLocalizedString(msg,@"");
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES afterDelay:1.5];
        });
        failure(msg, model);
        if (mself) {
            if (mself.mTableView.mj_footer.isRefreshing) {
                [mself.mTableView.mj_footer endRefreshing];
            }
            if (mself.mTableView.mj_header.isRefreshing) {
                [mself.mTableView.mj_header endRefreshing];
            }
        }
        
        if ([model isKindOfClass:[XYModel class]]) {
            if ([model.code isEqualToString:@"30000"]) {
                
                [XYLoginViewController login];
            }
        }
    }];
    
}

- (void)xy_postWithValues:(NSDictionary *)values
                ModelType:(Class)modelType
                     Path:(NSString *)path
                      hud:(NSString *)hudText
                  Success:(XYRequestCompletionBlock)success
                  failure:(XYRequestFailureBlock)failure
{
    XYViewController *mself;
    if ([self respondsToSelector:@selector(setMTableView:)]) {
        mself = (XYViewController *)self;
    }
    XYBaseRequest *requestapi = [[XYBaseRequest alloc] initWithRequsetParameters:values Path:path ModelType:modelType image:nil];
    __block MBProgressHUD *hud;
    dispatch_async(dispatch_get_main_queue(), ^{
        hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window]  animated:YES];
        if (!hudText || hudText.length==0) {
            hud.labelText = hubText;
        } else {
            hud.minShowTime = 1.2;
            hud.labelText = hudText;
        }
    });
    [requestapi postWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request, id model) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
        success(request, model);
        if (mself) {
            if (mself.mTableView.mj_footer.isRefreshing) {
                [mself.mTableView.mj_footer endRefreshing];
            }
            if (mself.mTableView.mj_header.isRefreshing) {
                [mself.mTableView.mj_header endRefreshing];
            }
        }
    } failure:^(NSString *msg, XYModel * model) {
        hud.labelText = NSLocalizedString(msg,@"");
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES afterDelay:1.5];
        });
        
        if (mself) {
            if (mself.mTableView.mj_footer.isRefreshing) {
                [mself.mTableView.mj_footer endRefreshing];
            }
            if (mself.mTableView.mj_header.isRefreshing) {
                [mself.mTableView.mj_header endRefreshing];
            }
        }
        if ([model isKindOfClass:[XYModel class]]) {
            if ([model.code isEqualToString:@"30000"]) {
                
                [XYLoginViewController login];
            }
        }
        failure(msg, model);
        
    }];
}
 

- (void)xy_uploadPhotoWithValues:(NSDictionary *)values
                           Image:(id )image
                       modelType:(Class)modelType
                            Path:(NSString *)path
                         Success:(XYRequestCompletionBlock)success
                         failure:(XYRequestFailureBlock)failure
{
    XYBaseRequest *requestapi = [[XYBaseRequest alloc] initWithRequsetParameters:values Path:path ModelType:modelType image:image];
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



- (void)xy_refreshWithRefreshType:(RefreshType)type TableView:(UITableView *)tableView Pagination:(Pagination *)pagination success:(MJRefreshComponentRefreshingBlock)success
{
    if (type == RefreshTypeNone) {
        
        success();
        
    } else if (type == RefreshTypeHeader) {
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^(){
            
            [self pageClean:pagination];
            
            success();
            
            [self endRefreshing:tableView];
        }];
    } else if (type == RefreshTypeFooter) {
        tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^(){
            
            [self pageAdd:pagination];
            
            success();
            
            [self endRefreshing:tableView];
            
        }];
    } else if (type == RefreshTypeAll) {
         
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^(){
            
            [self pageClean:pagination];
            
            success();
            
            [self endRefreshing:tableView];
        }];
        
        tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^(){
            
            [self pageAdd:pagination];
            
            success();
            
            [self endRefreshing:tableView];
            
        }];
    }
}
#pragma mark - 私有方法
- (void)endRefreshing:(UITableView *)tableView
{
    if ([tableView.mj_header isRefreshing]) {
        [tableView.mj_header endRefreshing];
    }
    if ([tableView.mj_footer isRefreshing]) {
        [tableView.mj_footer endRefreshing];
    }
}

#pragma mark - 上下拉刷新
- (void)pageAdd:(Pagination *)pagination
{
    NSInteger page = [pagination.page integerValue];
    page++;
    pagination.page = [NSNumber numberWithInteger:page];
}

- (void)pageClean:(Pagination *)pagination
{
    pagination.page = [NSNumber numberWithInteger:1];
}
@end
