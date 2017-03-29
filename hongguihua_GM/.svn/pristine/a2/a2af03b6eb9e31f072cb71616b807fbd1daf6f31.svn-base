//
//  XYPhotosCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/12.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//


#define LineSpacing 0.1f
#define InteritemSpacing 2.f
#define edgeSpace 5.f
#define numOfRow 5
#define itemWidth (MIN(XY_M_SCREEN_W, XY_M_SCREEN_H) - edgeSpace * 2 - InteritemSpacing * (numOfRow - 1)) / numOfRow
#define photoCellHeight itemWidth + edgeSpace * 2

#import "XYPhotosCell.h"

#import "XYAddProductPhotoItem.h"
 
typedef enum : NSUInteger {
    upload,
    showOnly,
} PhotosCellType;
@interface XYPhotosCell ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *mCollectionView;
@property (nonatomic,assign) PhotosCellType cellType;

@property (nonatomic,strong) NSMutableArray * imageViewArr;//数据源
@end


@implementation XYPhotosCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageViewArr = [NSMutableArray array];
    [self createUI];
    
}

- (void)createUI {
    [self initCollectionView];
    _mData = [NSMutableArray array];
    
}

+ (CGFloat)cellHeight {
    return photoCellHeight;
}


- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block {
    [super setModel:model IndexPath:indexPath callBack:block];
    self.block = block;
    if ([model isKindOfClass:[NSArray class]]) {
        for (id object in model) {
            [_mData addObject:ImageStr(object)];
        }
         self.cellType = showOnly;
        [self.mCollectionView reloadData];
    }
}
- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block deleteBlock:(void (^)(id, id))deleteBlock {
    [super setModel:model IndexPath:indexPath callBack:block deleteBlock:deleteBlock];
    self.block = block;
    self.deleteBlock = deleteBlock;
    if ([model isKindOfClass:[NSArray class]]) {
        _mData = [NSMutableArray arrayWithArray:model];
        self.cellType = upload;
        [self.mCollectionView reloadData];
    }
} 


- (void)initCollectionView {
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = LineSpacing;
    flowLayout.minimumInteritemSpacing = InteritemSpacing;
    [self initCollectionViewWithDelegate:self dataSource:self layout:flowLayout];
    [self.mCollectionView registerNib:@"XYAddProductPhotoItem"];
 
}


#pragma mark -- collectionView flowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(edgeSpace, edgeSpace, edgeSpace, edgeSpace);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath { 
    return CGSizeMake(itemWidth, itemWidth );
}


#pragma mark -- collectionView DataSource
-(NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.cellType ==  showOnly) {
        return self.mData.count ;
    }else{
        return self.mData.count < 5 ?self.mData.count + 1:self.mData.count;

    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYAddProductPhotoItem * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XYAddProductPhotoItem" forIndexPath:indexPath];
    if (self.mData.count) { 
        XYWeakSelf
        [cell setModel:self.mData IndexPath:indexPath callBack:^(id x, NSIndexPath * indexPath) {
            if (weakSelf.deleteBlock) {
                weakSelf.deleteBlock(x,indexPath);
            }
            [weakSelf.mData removeObjectAtIndex:indexPath.item];
            //使用删除，如果连续点击，容易崩溃 所以使用 reloadData
            [weakSelf.mCollectionView reloadData]; 
            
        }];
        [self.imageViewArr addObject:cell.imageView];
    }
    if (self.cellType ==  showOnly) {
        [cell.deleLabel setHidden:YES];
    }else{
        if (!self.mData.count||self.mData.count < 5) {
            if (indexPath.row == self.mData.count) {
                [cell.imageView setImage:[UIImage imageNamed:@"general_添加"]];
                [cell.deleLabel setHidden:YES];
            }else{
                [cell.deleLabel setHidden:NO];
            }
        }else{
            [cell.deleLabel setHidden:NO];
        }
    } 
     return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
     if (!self.mData.count||self.mData.count < 5) {
        if (indexPath.row == self.mData.count) {
            if (self.block) {
                self.block(self.mData,self.indexPath);
            }
        }else{
            
             [self photoBrower:self.mData index:indexPath.row viewsArr:self.imageViewArr];
        }
    }else{
         //浏览图片
     [self photoBrower:self.mData index:indexPath.row viewsArr:self.imageViewArr];
    }
}
- (void)photoBrower:(NSMutableArray *)dataArr index:(NSInteger)index viewsArr:(NSMutableArray *)imagesArr{
    [XYPhotosBrower photoBrowerWithData:self.mData index:index imagesArr:imagesArr];
}
#pragma mark -- tool
- (void)initCollectionViewWithDelegate:(id)delegate dataSource:(id)dataSource  layout:(UICollectionViewFlowLayout *)layout {
    _mCollectionView.collectionViewLayout = layout;
    _mCollectionView.alwaysBounceVertical  = YES;
    _mCollectionView.backgroundColor       = COLOR_WHITE;
    _mCollectionView.dataSource            = delegate;
    _mCollectionView.delegate              = dataSource;
    _mCollectionView.bounces = NO;
    _mCollectionView.showsVerticalScrollIndicator = NO;
    _mCollectionView.scrollEnabled = NO;
    [self.contentView addSubview:_mCollectionView];
    
    //此处给其增加长按手势，用此手势触发cell移动效果
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlelongGesture:)];
    [_mCollectionView addGestureRecognizer:longGesture];
    
}
#pragma mark -- move
- (void)handlelongGesture:(UILongPressGestureRecognizer *)longGesture {
    //判断手势状态
    switch (longGesture.state) {
        case UIGestureRecognizerStateBegan:{
            //判断手势落点位置是否在路径上
            NSIndexPath *indexPath = [self.mCollectionView indexPathForItemAtPoint:[longGesture locationInView:self.mCollectionView]];
            if (indexPath == nil) {
                break;
            }
            //在路径上则开始移动该路径上的cell
            [self.mCollectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            break;
        case UIGestureRecognizerStateChanged:
            //移动过程当中随时更新cell位置
            [self.mCollectionView updateInteractiveMovementTargetPosition:[longGesture locationInView:self.mCollectionView]];
            break;
        case UIGestureRecognizerStateEnded:
            //移动结束后关闭cell移动
            [self.mCollectionView endInteractiveMovement];
            break;
        default:
            [self.mCollectionView cancelInteractiveMovement];
            break;
    }
}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0) {
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath NS_AVAILABLE_IOS(9_0) {
    //取出源item数据
    id objc = [self.mData objectAtIndex:sourceIndexPath.item];
    //从资源数组中移除该数据
    [self.mData removeObject:objc];
    //将数据插入到资源数组中的目标位置上
    [self.mData insertObject:objc atIndex:destinationIndexPath.item];
}
@end
