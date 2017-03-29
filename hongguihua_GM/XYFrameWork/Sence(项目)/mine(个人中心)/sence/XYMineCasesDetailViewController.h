//
//  XYMineCasesDetailViewController.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYViewController.h"

typedef NS_ENUM(NSInteger, disPlayType) {
    AskForLeave, //请假
    SubmitAnExpenseAccount, //报销
    Out, //外出
    Positive, //转正
    OnABusinessTrip, //出差
};
@interface XYMineCasesDetailViewController : XYViewController

@property (nonatomic,assign) disPlayType type;
@property (nonatomic,strong) NSString * mainTitle;
@property (nonatomic,strong ) XYMineCasesModel * lModel;

@end
