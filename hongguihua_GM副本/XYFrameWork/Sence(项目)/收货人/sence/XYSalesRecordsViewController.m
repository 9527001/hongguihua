//
//  XYSalesRecordsViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/8/25.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//



#define itemCellWidth 90.f
#define headerViewHeight 45.f
#define leftWidth 120.f
#define cellHeight 50.f
#define allWidth itemCellWidth * _titleArr.count
//#define allWidth 100000


#import "XYSalesRecordsViewController.h"

#import "XYSalesRecordsTCell.h"
#import "XYTitleCell.h"
#import "XYSalesRecordHeadeHFView.h"

#import "XYManagementNewModel.h"

#import "XYBuyersViewController.h"

@interface XYSalesRecordsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) XYTableView * leftTableView;
@property (nonatomic,strong) XYTableView * contentTableView;
@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) UIScrollView * scrollView_top;
@property (nonatomic,strong) NSArray * titleArr;
@property (nonatomic,strong) NSMutableArray * headerViewArr;
@property (nonatomic,assign) CGFloat count ;
@property (nonatomic,assign) CGPoint  currentContentOffset;

@end

@implementation XYSalesRecordsViewController

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
    _count = 0;
 
    _titleArr = @[@"发货杂费",
                  @"到货杂费",
                  @"货柜利润",
                  @"剩余总件数",
                  @"到货日期",
                  @"最近更新日期",
                  @"品种",
                  @"等级",
                  @"到货件数",
                  @"单件成本",
                  @"已售件数",
                  @"已售金额",
                  @"平均售价",
                  @"剩余件数",
                  @"销售状态",];
    [self createLeftTableView];
    [self createContentTableView];
}

- (void)initNet {
    [super initNet];
    XYWeakSelf
    [self xy_postWithValues:@{MTOKEN:m_token,MPAGESIZE:m_pagesize,MPAGENUMBER:m_pagenumber} ModelType:[XYManagementNewModel class] Path:i_get_sell_list hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[NSArray class]]) {
            [weakSelf sucessData:model];
            [weakSelf handleDataArr:weakSelf.mData];
            
            [weakSelf.leftTableView reloadData];
            [weakSelf.mTableView reloadData];
        }
    } failure:^(NSString *msg, id model) {
        
    }];
}
- (void)handleDataArr:(NSMutableArray *)dataArr{
    _headerViewArr = [NSMutableArray array];
    for (NSInteger i = 0; i <dataArr.count ; i ++) {
        XYManagementNewModel * model = [dataArr safeObjectAtIndex:i];
        XYSenderProductModel * model_temp = [model.shipment_detail safeObjectAtIndex:0];
        model.xyid_item = model_temp.xyid;
        model.product_id = model_temp.product_id;
        model.pname = model_temp.pname;
        model.level_name = model_temp.level_name;
        model.num = model_temp.num;
        model.cost = model_temp.cost;
        model.current_num = model_temp.current_num;
        model.current_money = model_temp.current_money;
    }
    [self.leftTableView reloadData];
}

- (void)createLeftTableView {
    UIScrollView * scrollView_top_left= [[UIScrollView alloc] init];
    [self.view addSubview:scrollView_top_left];
    scrollView_top_left.delegate = self;
    scrollView_top_left.bounces = NO;
    scrollView_top_left.alwaysBounceHorizontal = YES;
    scrollView_top_left.alwaysBounceVertical = NO;
    scrollView_top_left.showsHorizontalScrollIndicator = NO;
    
    [scrollView_top_left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view);
        make.width.equalTo(@(leftWidth));
        make.height.equalTo(@(headerViewHeight));
    }];
    
    [self confirgDataArr:@[@"车次"] andBackGroundColor:COLOR_LIST_BG andItemWidth:leftWidth superView:scrollView_top_left];
    
    self.leftTableView = [[XYTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.leftTableView];
    [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(45.f);
        make.left.bottom.equalTo(self.view);
        make.width.mas_equalTo(leftWidth);
    }];
    
    self.leftTableView.bounces = NO;
    self.leftTableView.showsVerticalScrollIndicator = NO;
    self.leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.leftTableView setBackgroundColor:COLOR_MAIN];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    [self.leftTableView registerNib:@"XYTitleCell"];
    [self.leftTableView registerClassHeaderFooterView:@"XYTableViewHeaderFooterView"];
}

- (void)createContentTableView {
    _scrollView_top = [[UIScrollView alloc] init];
    [self.view addSubview:_scrollView_top];
    _scrollView_top.delegate = self;
    _scrollView_top.bounces = NO;
    _scrollView_top.alwaysBounceHorizontal = YES;
    _scrollView_top.alwaysBounceVertical = NO;
    _scrollView_top.showsHorizontalScrollIndicator = NO;
    
    [_scrollView_top mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.view);
        make.left.equalTo(@(leftWidth));
        make.height.equalTo(@(headerViewHeight));
    }];
    [self confirgDataArr:_titleArr andBackGroundColor:COLOR_LIST_BG andItemWidth:itemCellWidth superView:_scrollView_top];
    
    
    _scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:_scrollView];
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.alwaysBounceHorizontal = YES;
    _scrollView.alwaysBounceVertical = NO;
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(45.f);
        make.bottom.right.equalTo(self.view);
        make.left.equalTo(@(leftWidth));
    }];
    
    self.contentTableView = [[XYTableView alloc]init];
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    [_scrollView addSubview:self.contentTableView];
    NSInteger count = 0 ;
    if (XY_DEVICE_isPortrait) {
        count = XY_M_SCREEN_H - 64 - headerViewHeight;
    }else{
        count = XY_M_SCREEN_W - 64 - headerViewHeight;
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
    
    [self.contentTableView registerNib:@"XYSalesRecordsTCell"];
    [self.contentTableView registerClassHeaderFooterView:@"XYSalesRecordHeadeHFView"];
    self.mTableView = self.contentTableView;
    
}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSInteger count = 0 ;
//    if (XY_DEVICEIO_isPortrait(toInterfaceOrientation)) {
//        count = XY_M_SCREEN_W - 64 - headerViewHeight;
//    }else{
//        count = XY_M_SCREEN_W - 64 - headerViewHeight;
//    }
    
    count = XY_M_SCREEN_W - 64 - headerViewHeight;
    [self.contentTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(count));
    }];
}


#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.mData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    XYManagementNewModel * model = [self.mData safeObjectAtIndex:section];
    
    return  [model.shipment_detail isKindOfClass:[NSArray class]] ? (model.shipment_detail.count ? model.shipment_detail.count -1 : 0 ): 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableView) {
        XYTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYTitleCell"];
        [cell.titleLabel setText:@""];
        [cell showBottom:NO];
        [cell setBackgroundColor:COLOR_WHITE];
        return cell;
    }else{
        XYSalesRecordsTCell *ListCell = [tableView dequeueReusableCellWithIdentifier:@"XYSalesRecordsTCell"];
        
        
        if (self.mData.count) {
            XYManagementNewModel * model = [self.mData safeObjectAtIndex:indexPath.section];
            XYSenderProductModel * base = [model.shipment_detail safeObjectAtIndex:indexPath.row + 1];
            NSMutableArray * arr = [NSMutableArray array];
            for (NSInteger i = 0; i< 6; i ++) {
                [arr addObject:@""];
            }
            [arr addObject:base.pname];
            [arr addObject:base.level_name];
            [arr addObject:base.num];
            [arr addObject:base.cost];
            [arr addObject:base.current_num];
            [arr addObject:base.current_money];
            if (![base.current_num integerValue]) {
                [arr addObject:@"0"];
            }else{
                [arr addObject:[NSString stringWithFormat:@"%ld",[base.current_money integerValue]/[base.current_num integerValue]]];
            }
            [arr addObject:[NSString stringWithFormat:@"%ld",[base.num integerValue] - [base.current_num integerValue]]];
            [arr addObject:@""];
            
            [ListCell  dataArr:arr anditemCellWidth:itemCellWidth andSpecialLoacation:0];
//            [ListCell confirgManageWithModel:base anditemCellWidth:itemCellWidth andSpecialLoacation:4 indexPath:indexPath callBack:nil];
            if (indexPath.row%2 == 0) {
                [ListCell.contentView setBackgroundColor:COLOR_WHITE];
            }else{
                [ListCell.contentView setBackgroundColor:COLOR_WHITE];
            }
        }
        
        return ListCell;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (tableView == self.leftTableView) {
        
        XYTableViewHeaderFooterView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"XYTableViewHeaderFooterView"];
        XYManagementNewModel * model = [self.mData safeObjectAtIndex:section];
        [headerView confirgDataArr:@[model.car_num] andBackGroundColor:COLOR_WHITE andItemWidth:leftWidth];
        return headerView;
        
    }else{
        
        XYSalesRecordHeadeHFView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"XYSalesRecordHeadeHFView"];
        [headerView.contentView setBackgroundColor:COLOR_WHITE];
        
        XYManagementNewModel * model = [self.mData safeObjectAtIndex:section];
        NSMutableArray * arr = [NSMutableArray array];
        
        [arr addObject:model.other_cost];
        [arr addObject:model.wholesale_other_cost];
        [arr addObject:model.profit_money];
        [arr addObject:[NSString stringWithFormat:@"%ld",[model.count_num integerValue] - [model.current_all_num integerValue]]];
        [arr addObject:model.receiver_time];
        [arr addObject:model.addtime];
        
        [arr addObject:model.pname];
        [arr addObject:model.level_name];
        [arr addObject:model.num];
        [arr addObject:model.cost];
        [arr addObject:model.current_num];
        [arr addObject:model.current_money];
        if (![model.current_num integerValue]) {
            [arr addObject:@"0"];
        }else{
            [arr addObject:[NSString stringWithFormat:@"%ld",[model.current_money integerValue]/[model.current_num integerValue]]];
        }
        [arr addObject:[NSString stringWithFormat:@"%ld",[model.num integerValue] - [model.current_num integerValue]]];
        [arr addObject:([@"1" isEqualToString:model.saleStatus] ? @"销售结束" : @"销售中")];
        
        [headerView dataArr:arr anditemCellWidth:itemCellWidth andSpecialLoacation:[@"1" isEqualToString:model.saleStatus] ? 1 : 0];
 
        return headerView;
    }
    
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  
    return cellHeight;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.mData.count && tableView == self.leftTableView) {
        XYManagementNewModel * model = [self.mData safeObjectAtIndex:indexPath.section];
        [self jumpBuyersVC:model];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y != 0 ) {
        CGPoint contentOffset = CGPointMake(0, scrollView.contentOffset.y);
        self.contentTableView.contentOffset = scrollView.contentOffset;
        self.leftTableView.contentOffset    = contentOffset;
    }else{
    
        CGPoint contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
        self.scrollView.contentOffset = scrollView.contentOffset;
        self.scrollView_top.contentOffset    = contentOffset;
    }
    
    
 
    
}
#pragma makr -- tool
- (void)jumpBuyersVC:(XYManagementNewModel *)model{
//    XYBuyersViewController * vc = [[XYBuyersViewController alloc] init];
//    vc.dataModel = model;
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)confirgDataArr:(NSArray *)dataArr andBackGroundColor:(UIColor *)color andItemWidth:(CGFloat)itemWidth superView:(UIView *)contentView{
    [contentView setBackgroundColor:color];
 
    UIView * view = [[UIView alloc]init];
    [contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(contentView.mas_top);
        make.left.equalTo(contentView.mas_left);
        make.bottom.equalTo(contentView.mas_bottom);
        make.right.equalTo(contentView.mas_right);
        make.height.equalTo(@(headerViewHeight));
        make.width.equalTo(@(allWidth));
    }];
     
    UIView * currentView;
    for (NSInteger i = 0; i < dataArr.count; i ++) {
         
        UILabel * label = [[UILabel alloc]init];
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(view);
            make.width.mas_equalTo(itemWidth - 1);
//            make.left.mas_equalTo(leftLine.mas_right);
            if (currentView) {
                
                make.left.equalTo(currentView.mas_right).offset(0);
            }else{
                
                make.left.equalTo(view).offset(0);
            }
        }];
        label.tag = i + 1;
        [label setText:[dataArr safeObjectAtIndex:i]];
        [label setTextColor:COLOR_GRAY_2];
        [label setBackgroundColor:color];
        [label setFont:XY_S_FONT(13.f)];
        label.textAlignment = NSTextAlignmentCenter;
//        currentView = label;
        [label setNumberOfLines:2];
        
        //右侧线
        UIView * rightLine = [[UIView alloc] init];
        [view addSubview:rightLine];
        [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(view);
            make.width.mas_equalTo(1);
            make.left.equalTo(label.mas_right).offset(0);
        }];
        [rightLine setBackgroundColor:XY_HEX_RGB(0xE2E2E2)];
        currentView = rightLine;
    }

}
@end
