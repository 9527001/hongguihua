//
//  XYManagementViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/21.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#define itemCellWidth 120.f
#define leftWidth itemCellWidth
#define cellHeight 50.f
#define allWidth itemCellWidth * _titleArr.count
//#define allWidth 100000


#import "XYManagementViewController.h"

#import "XYListCell.h"
#import "XYTitleCell.h"
#import "XYTableViewHeaderFooterView.h"

#import "XYBuyersViewController.h"

@interface XYManagementViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) XYTableView * leftTableView;
@property (nonatomic,strong) XYTableView * contentTableView;
@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) NSArray * titleArr;
@property (nonatomic,assign) CGFloat count ;

@end

@implementation XYManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initFresh];
      DLog(@"%f ***** %@",_count ++, NSStringFromCGSize(_scrollView.contentSize));
}
- (void)initFresh {
    [super initFresh];
  
}

- (void)initNavigationBar {
    [super initNavigationBar];
    self.title = @"商品列表";
    
}
- (void)initUI {
    [super initUI];
    _count = 0;
    _titleArr = @[@"批发地",
                  @"月份",
                  @"车次",
                  @"车牌号",
                  @"果品等级",
                  @"发货件数",
                  @"到货件数",
                  @"成本/件(元)",
                  @"售价/件(元)",
                  @"销售收入(元)",
                  @"成本(元)",
                  @"杂费(元)",
                  @"利润(元)",
                  @"收货人",
                  @"状态"];
 if ([m_cid isEqualToString:@"4"]) {//中间人 发货
     _titleArr = @[@"批发地",
                   @"月份",
                   @"车次",
                   @"车牌号",
                   @"果品等级",
                   @"发货件数",
                   @"到货件数",
                   @"成本/件(元)",
//                   @"售价/件(元)",
//                   @"销售收入(元)",
                   @"成本(元)",
                   @"杂费(元)",
//                   @"利润(元)",
                   @"收货人",
                   @"状态"];
    
 }else if ([m_cid isEqualToString:@"2"]||//第三人 收货
           [m_cid isEqualToString:@"3"]) {//高管
     _titleArr = @[@"批发地",
                   @"月份",
                   @"车次",
                   @"车牌号",
                   @"果品等级",
                   @"发货件数",
                   @"到货件数",
                   @"成本/件(元)",
                   @"售价/件(元)",
                   @"销售收入(元)",
                   @"成本(元)",
                   @"杂费(元)",
                   @"利润(元)",
                   @"收货人",
                   @"状态"];
    
 }else{
    
 }
 
    [self createLeftTableView];
    [self createContentTableView];
}

- (void)initNet {
    [super initNet];
    XYWeakSelf
    [self xy_postWithValues:@{MTOKEN:m_token,MCID:m_cid,MPAGESIZE:m_pagesize,MPAGENUMBER:m_pagenumber} ModelType:[XYManagementModel class] Path:i_profitlist hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[NSArray class]]) {
            [weakSelf sucessData:model];
            [self.leftTableView reloadData];
        }
    } failure:^(NSString *msg, id model) {
        
    }];
}


- (void)createLeftTableView {
    self.leftTableView = [[XYTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.leftTableView];
    [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.view);
        make.width.mas_equalTo(leftWidth);
    }];
    
    self.leftTableView.bounces = NO;
    self.leftTableView.showsVerticalScrollIndicator = NO;
    self.leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.leftTableView setBackgroundColor:COLOR_MAIN];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    [self.leftTableView registerNib:@"XYTitleCell"];
    [XYTableViewHeaderFooterView registerClass:self.leftTableView];
}

- (void)createContentTableView {
    _scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:_scrollView];
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.alwaysBounceHorizontal = YES;
    _scrollView.alwaysBounceVertical = NO;
    [_scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self.view);
        make.left.equalTo(@(leftWidth));
    }];
  
    self.contentTableView = [[XYTableView alloc]init];
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    [_scrollView addSubview:self.contentTableView];
    NSInteger count = 0 ;
    if (XY_DEVICE_isPortrait) {
        count = XY_M_SCREEN_H - 64;
    }else{
        count = XY_M_SCREEN_W - 64;
    }
    [self.contentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_scrollView.mas_top);
        make.left.equalTo(_scrollView.mas_left);
        make.bottom.equalTo(_scrollView.mas_bottom);
        make.right.equalTo(_scrollView.mas_right);
        make.height.equalTo(@(count));
        make.width.equalTo(@(allWidth));
    }];
    self.contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
 
    [self.contentTableView registerNib:@"XYListCell"];
    [XYTableViewHeaderFooterView registerClass:self.contentTableView];
    
    
     self.mTableView = self.contentTableView;
 
}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSInteger count = 0 ;
    if (XY_DEVICEIO_isPortrait(toInterfaceOrientation)) {
        count = XY_M_SCREEN_H - 64;
    }else{
        count = XY_M_SCREEN_W - 64;
    }
    [self.contentTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(count));
    }];
}
 
 
#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.mData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableView) {
        XYTitleCell *TitleCell = [tableView dequeueReusableCellWithIdentifier:@"XYTitleCell"];
        if (self.mData.count) {
            XYProductListModel * model = [self.mData safeObjectAtIndex:indexPath.row];
            [TitleCell.titleLabel setText:model.name];
//            [TitleCell setModel:model IndexPath:indexPath callBack:nil];
        }
        return TitleCell;
    }else{
        XYListCell *ListCell = [tableView dequeueReusableCellWithIdentifier:@"XYListCell"];
        
        if (self.mData.count) {
            XYProductListModel * mdoel = [self.mData safeObjectAtIndex:indexPath.row];
//            XYWeakSelf
            [ListCell confirgModel:mdoel anditemCellWidth:itemCellWidth andSpecialLoacation:4 indexPath:indexPath callBack:^(id x, id y) {
                if ([x isKindOfClass:[XYManagementModel class]]) {
//                    [weakSelf jumpBuyersVC:x];
                }
                
            }];
        }
        
        return ListCell;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        if (tableView == self.leftTableView) {
            
            XYTableViewHeaderFooterView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"XYTableViewHeaderFooterView"];
            [headerView confirgDataArr:@[@"果品"] andBackGroundColor:COLOR_MAIN andItemWidth:leftWidth];
            return headerView;
        }else{
            
            XYTableViewHeaderFooterView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"XYTableViewHeaderFooterView"];
            [headerView confirgDataArr:self.titleArr andBackGroundColor:COLOR_MAIN andItemWidth:itemCellWidth];
            return headerView;
        }
        
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return cellHeight;
    }
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.mData.count && tableView == self.leftTableView) {
        XYProductListModel * x = [self.mData safeObjectAtIndex:indexPath.row];
        [self jumpBuyersVC:x];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.leftTableView || scrollView == self.contentTableView) {
        self.leftTableView.contentOffset    = scrollView.contentOffset;
        self.contentTableView.contentOffset = scrollView.contentOffset;
    } else {
        
     }
    
 
    
}
#pragma makr -- tool
- (void)jumpBuyersVC:(XYProductListModel *)model{
    XYBuyersViewController * vc = [[XYBuyersViewController alloc] init];
    vc.dataModel = model;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
