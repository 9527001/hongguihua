//
//  XYViewController.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/25.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XYTableView.h"
#import "XYCollectionView.h"
#import "XYView.h"
#import "XYTableViewCell.h"
#import "XYCollectionViewCell.h"
#import "Pagination.h"

typedef NS_ENUM(NSInteger, XYTableViewStyle) {
    XYTableViewStyleNone,           // 没有tabbar和navigationbar
    XYTableViewStyleTabbar,         // 只有tabbar
    XYTableViewStyleNavigationBar,  // 只有navigationbar
    XYTableViewStyleTabAndNav       // 既有tabbar又有navigationbar
};
typedef NS_ENUM(NSInteger, XYFreshType) {
    XYFreshTypeNone,
    XYFreshTypeHeader,
    XYFreshTypeFooter,
    XYFreshTypeAll
};


//快速block
typedef void(^SuccessBlock)();
typedef void(^RefreshDataBack)(id x,id y);

@interface XYViewController : Scene
/**
 *  数据
 */
@property (nonatomic, strong) NSMutableArray *mData;
/**
 *  分页 pageNumber
 */
@property (nonatomic,assign) NSInteger mPageNumber;
/**
 *  TableView初始化
 */
@property (nonatomic, strong) XYTableView *mTableView;

- (void)initTableViewWithDelegate:(id)delegate dataSource:(id)dataSource andStyle:(UITableViewStyle)style ;
- (void)initTableViewWithDelegate:(id)delegate dataSource:(id)dataSource xy_tableViewStyle:(XYTableViewStyle)xy_tableViewStyle;

- (void)initTableViewWithDelegate:(id)delegate dataSource:(id)dataSource frame:(CGRect)frame;

/**
 *  CollectionView初始化(待补充)
 */
@property (nonatomic, strong) XYCollectionView *mCollectionView;

- (void)initCollectionViewWithDelegate:(id)delegate dataSource:(id)dataSource xy_collectionViewStyle:(XYTableViewStyle)xy_tableViewStyle layout:(UICollectionViewFlowLayout *)layout;

- (void)initCollectionViewWithDelegate:(id)delegate dataSource:(id)dataSource frame:(CGRect)frame  layout:(UICollectionViewFlowLayout *)layout;

- (void)initCollectionViewWithDelegate:(id)delegate dataSource:(id)dataSource  layout:(UICollectionViewFlowLayout *)layout;

/**
 *  隐藏NavigationBar
 */
@property (nonatomic, assign) BOOL NavBarHidden;
/**
 *  上下刷新
 */
@property (nonatomic, strong) Pagination *pagination;


/**
 *  viewDidLoad方法
 */
- (void)initUI;

- (void)initNet;

/**
 *  分页效果
 */
- (void)initFresh;
- (void)initFreshWithType:(XYFreshType)type;
- (void)sucessData:(NSArray *)data;
- (void)pageClean;
- (void)handleMJHeader:(NSArray *)data;
- (void)handleMJFooter:(NSArray *)data;

- (void)initTableView;

- (void)initCollectionView;

- (void)initNavigationBar;

/**
 *  viewWillApear方法
 */
- (void)initData;
- (void)initData:(SuccessBlock)success;
- (void)initDataMultiple;
- (void)reLayout;

@end
