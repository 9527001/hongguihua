//
//  XYViewController.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/25.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYViewController.h"

@interface XYViewController ()
 
@end

@implementation XYViewController

#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[XYView alloc]initWithFrame:self.view.frame];
    
    
    // 设置CGRectZero从导航栏下开始计算
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.mPageNumber = 1;
    [self initNavigationBar];
    [self initTableView];
    [self initCollectionView];
    [self initUI];
    
    [self initData];
    [self initNet];
}


- (void)initUI{
   self.view.backgroundColor = COLOR_MAIN;
}

- (void)initNet{ }
- (void)initDataMultiple{}
- (void)initFresh {
    [self initFreshWithType:XYFreshTypeAll];
}

- (void)initFreshWithType:(XYFreshType)type {
    switch (type) {
        case XYFreshTypeNone:
            break;
            
        case XYFreshTypeHeader:
        {
             XYWeakSelf
            self.mTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                [self pageClean];
                [weakSelf initNet];
            }];
        }
            break;
        case XYFreshTypeFooter:
        {
            [self.mTableView.mj_footer setHidden:YES];
            XYWeakSelf
            self.mTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                weakSelf.mPageNumber ++;
                [weakSelf.mTableView.mj_footer beginRefreshing];
                [weakSelf initNet];
            }];
        }
            break;
        case XYFreshTypeAll:
        {
            [self.mTableView.mj_footer setHidden:YES];
            XYWeakSelf
            self.mTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                weakSelf.mPageNumber ++;
                [weakSelf.mTableView.mj_footer beginRefreshing];
                [weakSelf initNet];
            }];
            
            self.mTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                [self pageClean];
                [weakSelf initNet];
            }];
        }
            break;
        default:
            break;
    }
}
- (void)sucessData:(NSArray *)data {
    if (self.mPageNumber == 1) {
        [self handleMJHeader:data];
    }else{
       [self handleMJFooter:data];
    }
    
}
- (void)handleMJHeader:(NSArray *)data {
    [self.mTableView.mj_header endRefreshing];
    if (self.mData.count) {
        [self.mData removeAllObjects];
    }
    self.mData = [NSMutableArray arrayWithArray:data];
    [self.mTableView reloadData];
    
    if (data.count < [m_pagesize integerValue]) {
        [self.mTableView.mj_footer endRefreshingWithNoMoreData];
    }else {
        if (self.mTableView.mj_footer.state == MJRefreshStateNoMoreData) {
            [self.mTableView.mj_footer resetNoMoreData];
        }
    }
  
}
- (void)handleMJFooter:(NSArray *)data {
    if (data.count == 0) {
        [self.mTableView.mj_footer endRefreshingWithNoMoreData];
      
    }else if (data.count < [m_pagesize integerValue]) {
        [self.mData addObjectsFromArray:data];
        [self.mTableView reloadData];
        [self.mTableView.mj_footer endRefreshingWithNoMoreData];
    }else {
        [self.mData addObjectsFromArray:data];
        [self.mTableView reloadData];
        [self.mTableView.mj_footer endRefreshing];
    }
    
}
- (void)initTableView{}

- (void)initCollectionView{}

- (void)initNavigationBar {
    self.navigationController.navigationBar.barTintColor = COLOR_BLUE;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initDataMultiple];
    [self reLayout];
    if (self.NavBarHidden) {
        self.navigationController.navigationBar.hidden = YES;
    } else {
        self.navigationController.navigationBar.hidden = NO;
    }
    
}
- (void)reLayout {}
- (void)initData
{
    _mData = [NSMutableArray array];
    
}

- (void)initData:(SuccessBlock)success
{
    _mData = [NSMutableArray array];
    if (success) {
        success();
        [self.mTableView reloadData];
    }
}


/**
 *  创建tableview
 *
 *  @param delegate          delegate description
 *  @param dataSource        dataSource description
 *  @param xy_tableViewStyle 设置tableview高度
 */

- (void)initTableViewWithDelegate:(id)delegate dataSource:(id)dataSource andStyle:(UITableViewStyle)style {
    _mTableView = [[XYTableView alloc] initWithFrame:CGRectZero style:style];
    _mTableView.delegate = delegate;
    _mTableView.dataSource = dataSource;
    _mTableView.backgroundColor = COLOR_MAIN;
    _mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_mTableView];
    [_mTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
}
- (void)initTableViewWithDelegate:(id)delegate dataSource:(id)dataSource xy_tableViewStyle:(XYTableViewStyle)xy_tableViewStyle
{
    CGFloat h = XY_M_SCREEN_H;
    switch (xy_tableViewStyle) {
        case XYTableViewStyleTabbar:
            h-=H_TABBAR;
            break;
        case XYTableViewStyleNavigationBar:
            h-=H_NAVIGATIONBAR;
            break;
        case XYTableViewStyleTabAndNav:
            h-=(H_TABBAR + H_NAVIGATIONBAR);
            break;
        default:
            break;
    }
    _mTableView = [[XYTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, h) style:UITableViewStylePlain];
    _mTableView.delegate = delegate;
    _mTableView.dataSource = dataSource;
    _mTableView.backgroundColor = COLOR_MAIN;
    _mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_mTableView];
    [_mTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
}
/**
 *  创建自定义tableview
 *
 *  @param delegate   delegate description
 *  @param dataSource dataSource description
 *  @param frame      frame description
 */
- (void)initTableViewWithDelegate:(id)delegate dataSource:(id)dataSource frame:(CGRect)frame
{
    _mTableView = [[XYTableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    _mTableView.delegate = delegate;
    _mTableView.dataSource = dataSource;
    _mTableView.backgroundColor = COLOR_MAIN;
    _mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_mTableView];
    [_mTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
}
/**
 *  创建自定义collectionview,默认一排两个
 *
 *  @param delegate          delegate description
 *  @param dataSource        dataSource description
 *  @param xy_tableViewStyle xy_tableViewStyle description
 */
- (void)initCollectionViewWithDelegate:(id)delegate dataSource:(id)dataSource xy_collectionViewStyle:(XYTableViewStyle)xy_tableViewStyle layout:(UICollectionViewFlowLayout *)layout
{
    CGFloat h = XY_M_SCREEN_H;
    switch (xy_tableViewStyle) {
        case XYTableViewStyleTabbar:
            h-=H_TABBAR;
            break;
        case XYTableViewStyleNavigationBar:
            h-=H_NAVIGATIONBAR;
            break;
        case XYTableViewStyleTabAndNav:
            h-=(H_TABBAR + H_NAVIGATIONBAR);
            break;
        default:
            break;
    }

    _mCollectionView                       = [[XYCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, h) collectionViewLayout:layout];
    _mCollectionView.collectionViewLayout = layout;
    _mCollectionView.alwaysBounceVertical  = YES;
    _mCollectionView.backgroundColor       = COLOR_MAIN;
    _mCollectionView.dataSource            = delegate;
    _mCollectionView.delegate              = dataSource;
    [self.view addSubview:_mCollectionView];
}

- (void)initCollectionViewWithDelegate:(id)delegate dataSource:(id)dataSource frame:(CGRect)frame  layout:(UICollectionViewFlowLayout *)layout
{
    _mCollectionView                       = [[XYCollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    _mCollectionView.collectionViewLayout = layout;
    _mCollectionView.alwaysBounceVertical  = YES;
    _mCollectionView.backgroundColor       = COLOR_YELLOW;
    _mCollectionView.dataSource            = delegate;
    _mCollectionView.delegate              = dataSource;
    [self.view addSubview:_mCollectionView];
    [_mCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        
    }];
}

/**
 *  无需判断navigationBar和tabbar
 */
- (void)initCollectionViewWithDelegate:(id)delegate dataSource:(id)dataSource  layout:(UICollectionViewFlowLayout *)layout {
    _mCollectionView                       = [[XYCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _mCollectionView.collectionViewLayout = layout;
    _mCollectionView.alwaysBounceVertical  = YES;
    _mCollectionView.backgroundColor       = COLOR_MAIN;
    _mCollectionView.dataSource            = delegate;
    _mCollectionView.delegate              = dataSource;
    [self.view addSubview:_mCollectionView];
    [_mCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        
    }];
    
}
#pragma makr -- tool
- (void)pageClean {
    self.mPageNumber = 1;
}
#pragma mark -- refreshAndLoad
- (void)dealloc
{
    _mData = nil;
    NSLog(@"%@",NSStringFromClass([self class]));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
