//
//  Tool.m
//  qihaoduobao
//
//  Created by 中企互联 on 16/4/26.
//  Copyright © 2016年 中企互联. All rights reserved.
//

#import "Tool.h"

@implementation Tool

+ (NSString *)getCurrentDateTimeWithData:(NSString * )data {
    //获取时间 //显示的是格林尼治天文台的时间
    NSDate *date = [NSDate date];
    //日期解析器
    NSDateFormatter *formatter = [NSDateFormatter new];
    //设置时区
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    //设置输出格式
    //2015-11-11 23:09:45
    //转换成字符串
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSString *distanceStr = data;
    //把字符串转换成为NSDate
    NSDate *distanceDate = [formatter dateFromString:distanceStr];
    //计算该时间距离现在多少秒
    NSInteger time = [date timeIntervalSinceDate:distanceDate];
    
    //    NSString *yearStr=
    NSLog(@"%ld",(long)time);
    
    NSString *timeStr=[NSString stringWithFormat:@"(%@ 开始)",[formatter stringFromDate:[NSDate date]]];
    
    return timeStr;
}

+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)validatePhone1:(NSString *)phone
{
    NSString *phoneRegex = @"1[3|5|7|8|][0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}

//正则判断手机号码格式
+ (BOOL)validatePhone:(NSString *)phone
{
    if (true) {
        return YES;
    }
    NSString * firstStr = [phone substringToIndex:1];
    NSArray * numStr = [phone componentsSeparatedByString:firstStr];
    if (numStr.count == 12) {
        return NO;
    }
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phone] == YES)
        || ([regextestcm evaluateWithObject:phone] == YES)
        || ([regextestct evaluateWithObject:phone] == YES)
        || ([regextestcu evaluateWithObject:phone] == YES))
    {
        if([regextestcm evaluateWithObject:phone] == YES) {
            NSLog(@"China Mobile");
        } else if([regextestct evaluateWithObject:phone] == YES) {
            NSLog(@"China Telecom");
        } else if ([regextestcu evaluateWithObject:phone] == YES) {
            NSLog(@"China Unicom");
        } else {
            NSLog(@"Unknow");
        }
        
        return YES;
    }
    else
    {
        return NO;
    }
}
/**
 *  1238546
 */
+ (BOOL)isPureNumandCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
      
        return NO;
    }
    return YES;
}
/**
 *  233.22121
 */
+ (BOOL)isFloatNumandCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        if ([string isEqualToString:@"."]) {
            return YES;
        }
        return NO;
    }
    return YES;
}
+ (BOOL)isChinese:(NSString *)string {
    for (NSInteger i = 0; i < string.length; i ++) {
        unichar ch = [string characterAtIndex:i];
        if (0x9fff < ch  || ch < 0x4e00)
        {
            return false;
        }
    }
    return true;
}
@end
