
//
//  SXHomeViewController.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/3.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#define LineSpacing 0.0f
#define InteritemSpacing 0.0f
#define edgeSpace 20.f

#import "XYHomeViewController.h"

#import "HomeCollectionViewCell.h"
#import "HomeCollectionReusableView.h"
#import "XYHomeVCModel.h"
#import "XYHomeBanerModel.h"

#import "XYBuyerListViewController.h"
#import "XYAddProductViewController.h"//添加货品

#import "XYCheckListViewController.h"
#import "XYSenderViewController.h"
#import "XYSenderNewVC.h"

#import "XYReceiverViewController.h"
#import "XYSaleViewController.h"
#import "YDSaleNewVC.h" //new
#import "XYSalesRecordsViewController.h"

#import "XYManagementViewController.h"//商品管理
#import "YDManagementNewVC.h"//新增发货信息汇总

#import "XYAskForLeaveViewController.h"//请假
#import "XYOutViewController.h"//外出
#import "XYSubmitAnExpenseAccountViewController.h"//报销
#import "XYPositiveViewController.h"//转正
#import "XYOnABusinessTripViewController.h"//出差
#import "XYAddProductViewController.h"//
#import "XYAboutViewController.h"//使用说明



@interface XYHomeViewController ()<SDCycleScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
 
@property (nonatomic,strong) NSArray * imageArr;
@property (nonatomic,strong) NSMutableArray * vcsArr;
@property (nonatomic,strong) NSMutableArray * bannerArr;
@property (nonatomic,strong) SDCycleScrollView * cycleScrollView ;

@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) UIView * upView;
@property (nonatomic,assign) CGFloat itemWidth;
@property (nonatomic,assign) CGFloat collectionViewHeight;
@property (nonatomic,strong) UIView * backGroundImageView;

@end

@implementation XYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)initDataMultiple {
    [super initDataMultiple];
    XYWeakSelf
    [self xy_postWithValues:nil ModelType:[XYHomeBanerModel  class] Path:i_brand hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[NSArray class]]) {
            NSArray * arr = model;
            NSMutableArray* imageArr = [NSMutableArray array];
            for (XYHomeBanerModel * bModel in arr) {
                [imageArr addObject:[self checkPicUrl:bModel.pic]];
            }
            weakSelf.bannerArr = [NSMutableArray arrayWithArray:model]; 
            weakSelf.cycleScrollView.imageURLStringsGroup = imageArr;
        }
    } failure:^(NSString *msg, id model) {
        
    }];
}


- (NSString *)checkPicUrl:(NSString *)url {
    
    NSString * urlStr = nil;
    if ([url hasPrefix:@"http:"]) {
        urlStr = url;
    }else{
        urlStr = [NSString stringWithFormat:@"%@%@",ImageUrl,url];
    }
    return urlStr;
}

#pragma mark - TableView
- (void)initUI {
    [super initUI];
 
    self.imageArr = @[@"LOGO"];
    
    
    [self countWidth:XY_DEVICEIO_CURRENTORIENTATION];
    [self demo3];
}
- (void)initData {
    [super initData];
    if ([m_cid isEqualToString:@"1"]||//国外采购
        [m_cid isEqualToString:@"5"]) {//国内采购
        [self addVCWithArr:@[@[@"XYAddProductViewController",@"新增商品",@"home_addProduct"],
                             @[@"XYBuyerListViewController",@"采购记录",@"home_商品管理"],
                             ]];
    }else if ([m_cid isEqualToString:@"2"]) {//第三人 收货
        [self addVCWithArr:@[@[@"XYReceiverViewController",@"核对收货",@"home_收货管理"],
                             @[@"YDManagementNewVC",@"收货记录",@"home_商品管理"],
                             @[@"YDSaleNewVC",@"出售信息",@"home_开始发货"],
                             @[@"XYSalesRecordsViewController",@"销售记录",@"home_sale"],
                             ]];
        
    }else if ([m_cid isEqualToString:@"3"]) {//高管
        [self addVCWithArr:@[@[@"XYCheckListViewController",@"审核采购",@"home_审核"],
                             @[@"YDManagementNewVC",@"发货记录",@"home_商品管理"],
                             @[@"XYBuyerListViewController",@"采购记录",@"home_salerecord"],//新增采购记录
                             @[@"XYSalesRecordsViewController",@"销售记录",@"home_sale"],//新增销售记录
                             ]];
        
    }else if ([m_cid isEqualToString:@"4"]) {//中间人 发货
        [self addVCWithArr:@[@[@"YDManagementNewVC",@"发货记录",@"home_商品管理"],
                             @[@"XYSenderNewVC",@"开始发货",@"home_开始发货"],
                             ]];
        
    }else{
        NSLog(@"数据错误");
    }
  
    [self addVCWithArr:@[@[@"XYAskForLeaveViewController",@"请假",@"home_请假"],
                         @[@"XYSubmitAnExpenseAccountViewController",@"报销",@"home_报销"],
                         @[@"XYOnABusinessTripViewController",@"出差",@"home_出差"],
                         @[@"XYOutViewController",@"外出",@"home_外出"],
                         @[@"XYPositiveViewController",@"转正",@"home_转正"],
                         @[@"XYAboutViewController",@"使用说明",@"home_使用说明"],
                         ]];
    
    [self countWidth:XY_DEVICEIO_CURRENTORIENTATION];
    [self.mCollectionView reloadData];
}
/**
 *  仅在转动屏幕时调用
 * 
 */
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{

    [self refreshColleciontFlowLayout:toInterfaceOrientation];
    [self.cycleScrollView setNeedsLayout];
 
    
} 
- (void)refreshColleciontFlowLayout:(UIInterfaceOrientation)toInterfaceOrientation {
    [self countWidth:toInterfaceOrientation];
    [self.mCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.collectionViewHeight));
    }];
}
- (void)countWidth:(UIInterfaceOrientation)toInterfaceOrientation {
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationUnknown) {
         UIInterfaceOrientation deviceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        DLog(@"%zd",deviceOrientation);
    }
   
    self.itemWidth = (MIN(XY_M_SCREEN_W, XY_M_SCREEN_H)   -  edgeSpace * 2 - InteritemSpacing * 2)/3.f;
    if (XY_DEVICEIO_isPortrait(toInterfaceOrientation)) {
        self.collectionViewHeight = self.itemWidth * ceilf(self.vcsArr.count/3.f) + edgeSpace * 2 +(ceilf(self.vcsArr.count/3.f) -1) *LineSpacing;
    }else{
        self.collectionViewHeight  = self.itemWidth * ceilf(self.vcsArr.count/4.f) + edgeSpace * 2 +(ceilf(self.vcsArr.count/3.f) -1) *LineSpacing;
    }
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self refreshColleciontFlowLayout:XY_DEVICEIO_CURRENTORIENTATION];
}
- (void)demo3 {
    /**
     底部滚动视图
     */
    UIScrollView * bottomScrollView = [[UIScrollView alloc]init];
    [bottomScrollView setBackgroundColor:COLOR_MAIN];
    [self.view addSubview:bottomScrollView];
  
    /**
     顶部banner
     */
    UIView * upView = [[UIView alloc]init];
    [upView setBackgroundColor:COLOR_BLUE];
    [bottomScrollView addSubview:upView];
    [upView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(self.view).offset(0);
        make.top.mas_equalTo(0);
        make.height.equalTo(@(XY_AutoHeight(200)));
    }];
    self.upView = upView;
    
    self.cycleScrollView = [[SDCycleScrollView alloc]init];
    [upView addSubview:self.cycleScrollView];
    [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(upView);
    }];
    self.cycleScrollView.imageURLStringsGroup = self.imageArr;
    [self.cycleScrollView setBackgroundColor:COLOR_WHITE];
    self.cycleScrollView.bannerImageViewContentMode = UIViewContentModeCenter; //UIViewContentModeCenter
    
 
    
    /**
     列表图
     */
    self.mCollectionView = [self createCollectionView];
    [bottomScrollView addSubview:self.mCollectionView];
    [self.mCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(self.view).offset(0);
        make.top.mas_equalTo(upView.mas_bottom);
        make.height.equalTo(@(self.collectionViewHeight));
        
    }];
    /**
     背景图片
     */
    self.backGroundImageView = [[UIView alloc]init];
    [bottomScrollView addSubview:self.backGroundImageView ];
    [self.backGroundImageView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo( bottomScrollView.mas_left).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.top.mas_equalTo(upView.mas_bottom).offset(0);
//        make.height.equalTo(@(self.collectionViewHeight));
        make.bottom.equalTo(self.mCollectionView.mas_bottom);
    }];
    
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_白色背景"]];
    backImageView.contentMode = UIViewContentModeScaleToFill;
    [self.backGroundImageView  addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo( @(10));
        make.right.mas_equalTo(@(-10));
        make.top.mas_equalTo( @(10));
        make.bottom.mas_equalTo(@(-10));
    }];
    [bottomScrollView insertSubview:self.backGroundImageView belowSubview:self.mCollectionView];
    
    [bottomScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.bottom.equalTo(self.mCollectionView.mas_bottom).offset(10);
    }];
    
}


- (void)initNavigationBar {
    [super initNavigationBar];
    self.title = @"首页";
}

- (XYCollectionView * )createCollectionView {
    UICollectionViewFlowLayout * mlayout = [[UICollectionViewFlowLayout alloc]init];
    mlayout.minimumLineSpacing = LineSpacing;
    mlayout.minimumInteritemSpacing = InteritemSpacing;
    XYCollectionView *  _mCollectionView  = [[XYCollectionView alloc] initWithFrame:CGRectMake(0, 0, XY_M_SCREEN_W, 500) collectionViewLayout:mlayout];
    _mCollectionView.collectionViewLayout = mlayout;
    _mCollectionView.alwaysBounceVertical  = YES;
    _mCollectionView.backgroundColor       = [UIColor clearColor];
    _mCollectionView.dataSource            = self;
    _mCollectionView.delegate              = self;
    _mCollectionView.scrollEnabled = NO;
    [_mCollectionView registerNib:@"HomeCollectionViewCell"];
    return _mCollectionView;

}
 
#pragma mark -- collectionView flowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(edgeSpace, edgeSpace, -edgeSpace, edgeSpace);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.itemWidth, self.itemWidth );
}
 

#pragma mark -- collectionView DataSource
-(NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.vcsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
    if (self.vcsArr.count) {
        XYHomeVCModel *model = [self.vcsArr safeObjectAtIndex:indexPath.row];
        [cell.image setImage:[UIImage imageNamed:model.pic] ]; 
        [cell.title setTitle:model.title forState:UIControlStateNormal];
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_vcsArr.count) {
        XYHomeVCModel * model = [_vcsArr safeObjectAtIndex:indexPath.item];
        UIViewController * vc = [[NSClassFromString(model.VC) alloc] init];
        vc.title = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark -- tool 
- (void)addVCWithArr:(NSArray *)arr {
    if (!self.vcsArr) {
        self.vcsArr = [NSMutableArray array];
    }
    for (NSInteger i = 0; i < arr.count; i ++) {
        id obj = [arr safeObjectAtIndex:i];
        if ([obj isKindOfClass:[NSArray class]]) {
            XYHomeVCModel * model_af = [[XYHomeVCModel alloc]init];
            model_af.VC = [obj safeObjectAtIndex:0];
            model_af.title = [obj safeObjectAtIndex:1];
            model_af.pic = [obj safeObjectAtIndex:2];
            [self.vcsArr addObject:model_af];
        }
     
    }
    
}

@end
