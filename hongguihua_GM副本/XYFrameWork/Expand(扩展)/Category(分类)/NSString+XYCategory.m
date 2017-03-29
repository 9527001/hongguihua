//
//  NSString+XYCategory.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/10.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "NSString+XYCategory.h"

@implementation NSString (XYCategory)
/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
- (NSDictionary *)xy_toDictionary
{
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        DLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;

}
@end
