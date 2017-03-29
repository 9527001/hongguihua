//
//  XYAddProductPhotoItem.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/12.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYAddProductPhotoItem.h"

@interface XYAddProductPhotoItem ()

@end


@implementation XYAddProductPhotoItem

-(void)awakeFromNib {
    [super awakeFromNib];
    [self.deleLabel xy_setCornerRadius:12.5f];
    XYWeakSelf
   [self.deleLabel bk_whenTapped:^{
       weakSelf.block(self.imageView.image,weakSelf.indexPath);
   }];
}

- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block {
    [super setModel:model IndexPath:indexPath callBack:block]; 
    self.block = block;
    if ([model isKindOfClass:[NSArray class]]) {
        id image = [model safeObjectAtIndex:indexPath.row];
        if ([image isKindOfClass:[UIImage class]]) {
            [self.imageView setImage:image];
        }else{
            [self.imageView kSetImageWithURL:image placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
        }
    }
}

@end
