//
//  XYReceiveTCell.h
//  XYFrameWork
//
//  Created by 中企互联 on 16/12/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYTableViewCell.h"

#import "XYMineCasesModel.h"

@interface XYReceiveTCell : XYTableViewCell

@property (weak, nonatomic) IBOutlet UIView *seperatorLine;
@property (nonatomic,strong) XYReceiverModel * model;

@end
