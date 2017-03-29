//
//  HomeCollectionReusableView.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/5/13.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "HomeCollectionReusableView.h"

#import "PhotosBrower.h"
@interface HomeCollectionReusableView ()<SDCycleScrollViewDelegate>

@end

@implementation HomeCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self createUI]; 
}

- (void)createUI {
    NSArray * arr = @[@"http://www.qihaoduobao.com/data/upfiles/201605/2313233241.jpg",@"http://www.qihaoduobao.com/data/upfiles/201605/2313233241.jpg",@"http://www.qihaoduobao.com/data/upfiles/201605/2313233241.jpg"];
    
    XYWeakSelf
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:weakSelf placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
     [self addSubview:cycleScrollView];
    [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    cycleScrollView.imageURLStringsGroup = arr;
}
 
+ (CGSize)size {
    return CGSizeMake(XY_M_SCREEN_W, 400);
}
@end
