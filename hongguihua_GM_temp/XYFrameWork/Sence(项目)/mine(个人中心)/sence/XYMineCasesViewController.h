//
//  XYMineCasesViewController.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYViewController.h"

//
//typedef enum : NSUInteger {
//    AskForLeave, //请假
//    SubmitAnExpenseAccount, //报销
//    Out, //外出
//    Positive, //转正
//    OnABusinessTrip, //出差
//} DisPlayType;

typedef NS_ENUM(NSInteger, DisPlayType) {
    sskForLeave, //请假
    submitAnExpenseAccount, //报销
    outside, //外出
    positive, //转正
    onABusinessTrip, //出差
};
@interface XYMineCasesViewController : XYViewController

@property (nonatomic,assign) DisPlayType type;

@property (nonatomic,copy) NSString * mainTitle;
@property (nonatomic,copy) NSString * logo;

@end
