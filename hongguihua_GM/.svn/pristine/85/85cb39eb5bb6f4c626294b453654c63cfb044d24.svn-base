//
//  XYBuyersCollectionReusableView.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/11.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBuyersCollectionReusableView.h"

@interface XYBuyersCollectionReusableView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end
@implementation XYBuyersCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.imageView xy_setCornerRadius:(80.f - 20) * 0.5f];
    
}

+ (CGSize)headerViewSize {
    return CGSizeMake(XY_M_SCREEN_W, 80.f);
}
@end
