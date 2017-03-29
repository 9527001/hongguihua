//
//  photosBrower.m
//  qihaoduobao
//
//  Created by 中企互联 on 16/5/30.
//  Copyright © 2016年 中企互联. All rights reserved.
//

#import "PhotosBrower.h"

@interface PhotosBrower ()<UIScrollViewDelegate>


@property (nonatomic,strong) NSMutableArray * imageViewArr;//数据源

@property (nonatomic,assign) NSInteger dataArrCount;
@property (nonatomic,assign) NSInteger  statusNum;
@property (nonatomic,assign) NSInteger currentStatusNum;
@property (nonatomic,assign) CGFloat previousContentOffSetX;

@end

@implementation PhotosBrower



- (instancetype)initWithFrame:(CGRect)frame  andDataArr:(NSArray *)dataArr {
    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
        [self confirg];
        self.dataArr = dataArr;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createUI];
        [self confirg];
    }
    return self;
}
- (void)confirg {
    self.backgroundColor = COLOR_RED;
    self.pagingEnabled = YES;
    self.delegate = self;
    self.showsHorizontalScrollIndicator = NO;
}
- (void)createUI {
    self.currentStatusNum = 0;
    self.statusNum = 3;
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    self.contentSize = CGSizeMake(width, height);
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left).offset(0);
        make.bottom.equalTo(self.mas_bottom);
        make.width.equalTo(@(XY_M_SCREEN_W));
    }];
    [imageView setImage:PLACEHOLDERDEFAULTICONIMAGE];
}
- (void)setDataArr:(NSArray *)dataArr {
    _dataArr = dataArr;
    if (!self) {
        [self createUI];
        [self confirg];
    }
    self.dataArrCount = dataArr.count;
    NSInteger imageViewNum ;
    if (dataArr.count >=1) {
        imageViewNum = dataArr.count > 3?3:dataArr.count;
    }else{
        imageViewNum = 1;
    }
    
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    if (dataArr.count > 3) {
        self.contentOffset = CGPointMake(0, 0);
    }
    self.contentSize = CGSizeMake(XY_M_SCREEN_W * imageViewNum, height);
    
    self.imageViewArr = [NSMutableArray array];
    for (NSInteger i = 0; i < imageViewNum; i ++) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * width, 0, width, height)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        id object = [dataArr safeObjectAtIndex:i];
        if ([object isKindOfClass:[UIImage class]]) {
            [imageView setImage:object];
        }
        if ([object isKindOfClass:[NSString class]]) {
            [imageView kSetImageWithURL:[dataArr safeObjectAtIndex:i]  placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
        }
        
        imageView .tag = i ;
        [self addSubview:imageView];
        [self.imageViewArr addObject:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left).offset(XY_M_SCREEN_W * i);
            make.bottom.equalTo(self.mas_bottom);
            make.width.equalTo(@(XY_M_SCREEN_W));
        }];
    }
    [self bk_whenTapped:^{
        NSLog(@"self.currentStatusNum    %zd",self.currentStatusNum);
    }];
}

- (NSArray *)handleImage:(NSArray *)dataArr {
    NSMutableArray * imageArr = [NSMutableArray array];
    for (NSString * url in dataArr) {
        if ([url hasPrefix:@"http"]||
             [url hasSuffix:@".jpg"]||
             [url hasSuffix:@".png"]) {
            [imageArr addObject:url];
        }else{
            [imageArr addObject:url];
        }
    }
    return dataArr;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self createNoLimitScrollView:scrollView];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self createLimitScrollView:scrollView];

}

/**
 *  核心算法
 *
 *  @param scrollView 三个UIImageView解决滚动视图占用大量内存的的问题
 */
- (void)createLimitScrollView:(UIScrollView *)scrollView {
    
    CGFloat offsetX = scrollView.contentOffset.x;
    if (offsetX > self.previousContentOffSetX) {
        self.currentStatusNum ++;
    }else if (offsetX < self.previousContentOffSetX) {
        self.currentStatusNum --;
    }else{
        self.currentStatusNum = self.currentStatusNum;
    }
    
    if (self.dataArrCount > 3) {
        NSInteger num = offsetX/XY_M_SCREEN_W;
        
        if (num == 2) {//滑入最后一个
            if (self.statusNum == self.dataArr.count) {
                self.previousContentOffSetX = scrollView.contentOffset.x;
                return;
            }
            for (NSInteger i = 0; i < self.imageViewArr.count; i ++) {
                UIImageView * imageView = [self.imageViewArr safeObjectAtIndex:i];
//                [imageView kSetImageWithURL:[self.dataArr safeObjectAtIndex:self.statusNum - 3 +1 + i]  placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
            }
            scrollView.contentOffset = CGPointMake(XY_M_SCREEN_W, 0);
            self.statusNum ++;
         }
        
        if (num == 0 && self.statusNum > 3) {//滑入第一个
            self.statusNum --;

            for (NSInteger i = 0; i < self.imageViewArr.count; i ++) {
                UIImageView * imageView = [self.imageViewArr safeObjectAtIndex:i];
                [imageView kSetImageWithURL:[self.dataArr safeObjectAtIndex:(self.statusNum  - 3 + i)]  placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
            }
            scrollView.contentOffset = CGPointMake(XY_M_SCREEN_W, 0);
          }
       
    }
    self.previousContentOffSetX = scrollView.contentOffset.x;
    
}

- (void)createNoLimitScrollView:(UIScrollView *)scrollView {
    
}
@end
