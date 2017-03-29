//
//  XYBuyersViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/11.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#define LineSpacing 10.0f
#define InteritemSpacing 10.0f
#define edgeSpace 20.f


#import "XYBuyersViewController.h"

#import "XYBuyersItem.h"
#import "XYBuyersCollectionReusableView.h"

#import "XYSaleRecordsModel.h"

@interface XYBuyersViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,assign) CGFloat itemWidth;
@property (nonatomic,strong) XYBuyerModel * resultModel;
@property (nonatomic,strong) NSMutableArray * imageViewsArr;

@end

@implementation XYBuyersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNavigationBar {
    [super initNavigationBar];
    if ([self.dataModel isKindOfClass:[XYProductListModel class]]) {
        XYProductListModel * model = self.dataModel;
        self.title = model.username;
    }else if ([self.dataModel isKindOfClass:[XYManagementModel class]]){
        XYManagementModel * model = self.dataModel;
        self.title = model.username;
    }else if ([self.dataModel isKindOfClass:[XYSaleRecordsModel class]]){
        XYSaleRecordsModel * model = self.dataModel;
        self.title = model.name;
    }else {
        self.title = @"采购员";
    }
    
}
- (void)initData {
    [super initData];
    
}
- (void)initNet {
    [super initNet];
    XYWeakSelf
    NSString * xyid ;
    NSString * path ;
    if ([self.dataModel isKindOfClass:[XYProductListModel class]]) {
        XYProductListModel * model = self.dataModel;
        xyid = model.xyid;
        path = i_productpic;
    }else if ([self.dataModel isKindOfClass:[XYManagementModel class]]){
        XYManagementModel * model = self.dataModel;
        xyid = model.xyid;
        path = i_sendproductpic;
    }else {
        
    }
    [self xy_postWithValues:@{MTOKEN:m_token,MID:xyid} ModelType:[XYBuyerModel class] Path:path hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[NSArray class]]) {
            id object = [model firstObject];
            if ([object isKindOfClass:[XYBuyerModel class]] ) {
                weakSelf.resultModel = object;
            }
        }
        if ([model isKindOfClass:[XYBuyerModel class]]) {
            weakSelf.resultModel = model;
        }
        if (weakSelf.resultModel) {
            NSArray * photosArr = [weakSelf.resultModel.photos componentsSeparatedByString:@","];
            self.mData = [NSMutableArray arrayWithArray:photosArr];
            [self.mCollectionView reloadData];
        }
        
    } failure:^(NSString *msg, id model) {
        
    }];
}
- (void)initCollectionView {
    [super initCollectionView];
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = LineSpacing;
    flowLayout.minimumInteritemSpacing = InteritemSpacing;
    NSInteger count = XY_IS_IPHONE ? 2.0f:3.0f;
    self.itemWidth = (XY_M_SCREEN_MIN - edgeSpace * 2 - InteritemSpacing * (count - 1))/count;
    [self initCollectionViewWithDelegate:self dataSource:self layout:flowLayout];
    [self.mCollectionView registerNib:@"XYBuyersItem"];
    [self.mCollectionView registerNib:[UINib nibWithNibName:@"XYBuyersCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"XYBuyersCollectionReusableView"];
}

#pragma mark -- collectionView flowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(edgeSpace, edgeSpace, edgeSpace, edgeSpace);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.itemWidth, self.itemWidth );
}


#pragma mark -- collectionView DataSource
-(NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.mData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYBuyersItem * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XYBuyersItem" forIndexPath:indexPath];
    if (self.mData.count) {
        NSString * urlStr = [self.mData safeObjectAtIndex:indexPath.item];
        [cell.imageView kSetImageWithURL:urlStr placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
        if (!self.imageViewsArr) {
            self.imageViewsArr = [NSMutableArray array];
        }
        [self.imageViewsArr addObject:cell.imageView];
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        XYBuyersCollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"XYBuyersCollectionReusableView" forIndexPath:indexPath];
        [headerView.iconImageView setImage:PLACEHOLDERDEFAULTICONIMAGE];
        
        [headerView.titleLabel setText:m_loginname];
        [headerView.notesLabel setText:self.resultModel.mobile];
        
        return headerView;
                                                       
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return [XYBuyersCollectionReusableView headerViewSize ];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [XYPhotosBrower photoBrowerWithData:self.mData index:indexPath.row imagesArr:self.imageViewsArr];
}
@end
