//
//  HomeCollectionReusableView.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/5/13.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^HomeCollectionReusableViewBlock)(NSInteger x);

@interface HomeCollectionReusableView : UICollectionReusableView

@property (nonatomic,copy) HomeCollectionReusableViewBlock block;

@property (weak, nonatomic) IBOutlet UIButton *currentMoney;
@property (weak, nonatomic) IBOutlet UIButton *totalMoney;

+ (CGSize)size;

@end
