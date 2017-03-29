//
//  XYBuyerViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/8.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//



#define itemCellWidth 90.f 
#define leftWidth 120.f
#define cellHeight 50.f
#define allWidth itemCellWidth * 6
#import "XYBuyerListViewController.h"


#import "XYListCell.h"
#import "XYTitleCell.h"
#import "XYTableViewHeaderFooterView.h"

#import "XYBuyersViewController.h"

@interface XYBuyerListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) XYTableView * leftTableView;
@property (nonatomic,strong) XYTableView * contentTableView;
@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) NSArray * titleArr;


@end

@implementation XYBuyerListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initFresh];
}
- (void)initFresh {
    [super initFresh];
    
}
 

- (void)initUI {
    [super initUI];
    [self createLeftTableView];
    [self createContentTableView];
}
- (void)initData {
    [super initData];
    _titleArr = @[@"果品",@"规格",@"总价",@"数量",@"采购地",@"采购员",@"状态"];
 
}
- (void)initNet {
    [super initNet];
    XYWeakSelf
    [self xy_postWithValues:@{MTOKEN:m_token,MPAGESIZE:m_pagesize,MPAGENUMBER:m_pagenumber} ModelType:[XYProductListModel class] Path:i_productlist hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
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
    _scrollView.bounces = NO;
    [_scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.leftTableView.mas_right);
        make.right.equalTo(self.view.mas_right);
    }];
    _scrollView.contentSize = CGSizeMake(allWidth,0);
    
    self.contentTableView = [[XYTableView alloc]init];
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    [_scrollView addSubview:self.contentTableView];
    [self.contentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_scrollView.mas_top);
        make.left.equalTo(_scrollView.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
    }];
    self.contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.contentTableView.bounces = NO;
    [self.contentTableView registerNib:@"XYListCell"];
    [XYTableViewHeaderFooterView registerClass:self.contentTableView];
    self.mTableView = _contentTableView;
}

- (void)createContent{
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(100, 0, XY_M_SCREEN_W - 100, XY_M_SCREEN_H)];
    [self.view addSubview:scrollView];
         [scrollView setContentSize:CGSizeMake(XY_M_SCREEN_W, XY_M_SCREEN_H)];
    [scrollView setBackgroundColor:COLOR_BLUE];
    scrollView.bounces = NO;
  
    self.contentTableView = [[XYTableView alloc]initWithFrame:CGRectMake(10, 10, scrollView.contentSize.width, scrollView.contentSize.height- 100) style:UITableViewStylePlain];
    [scrollView addSubview:self.contentTableView];
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    [self.contentTableView registerNib:@"XYListCell"];

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
            [TitleCell.titleLabel setText:model.reasons];
//            [TitleCell setModel:model IndexPath:indexPath callBack:nil];
        }
        return TitleCell;
    }else{ 
        XYListCell *ListCell = [tableView dequeueReusableCellWithIdentifier:@"XYListCell"];
         
        if (self.mData.count) {
            XYProductListModel * mdoel = [self.mData safeObjectAtIndex:indexPath.row];
             
            [ListCell confirgModel:mdoel anditemCellWidth:itemCellWidth andSpecialLoacation:4 indexPath:indexPath callBack:^(XYProductListModel * x, id y) {
                if ([x isKindOfClass:[XYProductListModel class]]) {
//                    [weakSelf jumpBuyersVC:x];
                    [UIAlertView bk_showAlertViewWithTitle:@"查看规格详情" message:x.spek cancelButtonTitle:@"取消查看" otherButtonTitles:nil handler:nil];
                    
                    
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
            [headerView confirgDataArr:@[@"工厂车次"] andBackGroundColor:COLOR_MAIN andItemWidth:leftWidth];
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
    self.leftTableView.contentOffset    = scrollView.contentOffset;
    self.contentTableView.contentOffset = scrollView.contentOffset;
}
#pragma makr -- tool 
- (void)jumpBuyersVC:(XYProductListModel *)model{
    XYBuyersViewController * vc = [[XYBuyersViewController alloc] init];
    vc.dataModel = model;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
