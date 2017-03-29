//
//  NSDictionary+Category.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/27.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "NSDictionary+XYCategory.h"

@implementation NSDictionary (XYCategory)

- (id)xy_objectForKey:(NSString *)key
{
    id obj = [self objectForKey:key];
    if (!obj) {
        return @"";
    }
    if ([obj isKindOfClass:[NSDictionary class]] ||
        [obj isKindOfClass:[NSArray class]]) {
        return obj;
    } else {
        return [NSString stringWithFormat:@"%@", obj];
    }
}
-(NSString*)xy_toJsonString
{
    if (![self isKindOfClass:[NSDictionary class]]) {
        return @"";
    }
    
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}


@end
