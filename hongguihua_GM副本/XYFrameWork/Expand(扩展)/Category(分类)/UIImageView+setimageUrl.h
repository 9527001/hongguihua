//
//  UIImageView+setimageUrl.h
//  qihaoduobao
//
//  Created by 中企互联 on 16/4/26.
//  Copyright © 2016年 中企互联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (setimageUrl)

/**
 *  图片的URL处理
 *
 *  @param url   判断是否包含http:
 *  @param image 占位图
 */
- (void)kSetImageWithURL:(NSString *)url placeholderImage:(UIImage * )image;

@end
