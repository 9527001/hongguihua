//
//  UIImageView+setimageUrl.m
//  qihaoduobao
//
//  Created by 中企互联 on 16/4/26.
//  Copyright © 2016年 中企互联. All rights reserved.
//




#import "UIImageView+setimageUrl.h"



@implementation UIImageView (setimageUrl)

- (void)kSetImageWithURL:(NSString *)url placeholderImage:(UIImage * )image{
    if (![url isKindOfClass:[NSString class]]) {
        NSLog(@" kSetImageWithURL  %@",[url class]);
        return;
    }
    NSString * urlStr = nil;
     if ([url hasPrefix:@"http:"]) {
         urlStr = url;
     }else{
         urlStr = [NSString stringWithFormat:@"%@%@",ImageUrl,url];
     }
 
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:image];
}

@end
