//
//  XYMessageListCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/7.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYMessageListCell.h"

#import "YDEdgeSetsLabel.h"
@interface XYMessageListCell ()

@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIView *photoView;
@property (weak, nonatomic) IBOutlet YDEdgeSetsLabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *moreView;
@property (nonatomic,strong) UIView * customBackGroundView;
@property (nonatomic,strong) NSArray * dataArr;
@property (nonatomic,strong) NSMutableArray * imagesArr;

@end

@implementation XYMessageListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_contentLabel test:20];
    self.dataArr = [NSArray array];
    self.imagesArr = [NSMutableArray array];
    [self createUIphotoView:self.photoView count:5];
//    [self handle];
}

- (void)createUIphotoView:(UIView *)view count:(NSInteger )count {
  
    UIView * currentView;
    for (NSInteger i = 0; i < count; i ++) {
        UIImageView * imageView = [[UIImageView alloc]init];
        [view addSubview:imageView];
        imageView.tag = i + 1;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(view);
//            make.width.mas_equalTo(view.height - 4);
            make.width.equalTo(view.mas_height);
            if (currentView) {
                
                make.left.equalTo(currentView.mas_right).offset(2);
            }else{
                
                make.left.equalTo(view).offset(0);
            }
        }];
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Tap:)];
        [imageView addGestureRecognizer:tap];
        imageView.tag = i + 1;
        [self.imagesArr addObject:imageView];
        currentView = imageView;
    }
}

- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:(void (^)(id x, id y))block {
    [super setModel:model IndexPath:indexPath callBack:block];
    self.block = block;
    
    if ([model isKindOfClass:[XYMessageListModel class]]) {
        XYMessageListModel * dataModel = model;
        [_contentLabel setText:dataModel.reasons];
        [_titleLabel setText:[NSString stringWithFormat:@"您于%@提交的审核",dataModel.addtime]];
        if ([dataModel.photos isKindOfClass:[NSString class]]) {
            NSArray * photosArr = [dataModel.photos componentsSeparatedByString:@","];
            [self setImageWithData:photosArr];
            
        }
    }
    [self extra];
    [_contentLabel test:20];
}
- (void)setImageWithData:(NSArray <NSString *>*)data{
    self.dataArr = data;
    NSArray * imageViews = self.photoView.subviews;
    if (imageViews.count) {
        for (NSInteger i = 0; i < data.count; i ++) {
            UIImageView * imageView = [self.photoView viewWithTag:i + 1];
            [imageView kSetImageWithURL:[data safeObjectAtIndex:i] placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
        }
        return;
    }
    UIView * currentView;
    NSInteger count = data.count;
    for (NSInteger i = 0; i < count; i ++) {
        UIImageView * imageView = [[UIImageView alloc]init];
        [self.photoView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.photoView);
//            make.width.equalTo(self.photoView.mas_height);
            make.width.equalTo(self.photoView.mas_height);
            if (currentView) {
                
                make.left.equalTo(currentView.mas_right).offset(2);
            }else{
                
                make.left.equalTo(self.photoView).offset(0);
            }
        }];
        
        [self.imagesArr addObject:imageView];
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Tap:)];
        [imageView addGestureRecognizer:tap];
        imageView.tag = i + 1;
        [imageView kSetImageWithURL:[data safeObjectAtIndex:i] placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
        currentView = imageView;
    }

}

- (void)Tap:(UIGestureRecognizer *)tap {
    UIImageView * imageView = (UIImageView *)tap.view;
    [XYPhotosBrower photoBrowerWithData:self.dataArr index:(imageView.tag - 1) imagesArr:self.imagesArr];
}

- (void)extra {
    if(!self.customBackGroundView){
        self.customBackGroundView = [[UIView alloc] init];
        [self.customBackGroundView setBackgroundColor:COLOR_WHITE];
        
        [self.contentView insertSubview: self.customBackGroundView atIndex:0 ];
    }
    [self.customBackGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.titleView).offset(-2);
        make.right.mas_equalTo(self.titleView).offset(2);
        make.bottom.mas_equalTo(self.moreView.mas_bottom).offset(2);
    }];
    [self.customBackGroundView xy_setCornerRadius:5.0f];
    [self.customBackGroundView xy_setBorder:1.0f Color:COLOR_TableLine];
    
    
}
- (void)handle {
    XYWeakSelf
    [self.moreView bk_whenTapped:^{
        if (weakSelf.block) {
            weakSelf.block (nil,nil);
        }
        
    }];
}
@end
