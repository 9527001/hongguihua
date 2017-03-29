//
//  main.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/21.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        @try {
            
        } @catch (NSException *exception) {
            NSLog(@"%@",exception);
        } @finally {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
    }
}
