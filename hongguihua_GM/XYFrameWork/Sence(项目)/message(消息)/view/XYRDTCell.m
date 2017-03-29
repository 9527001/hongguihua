//
//  XYRDTCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/8/26.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYRDTCell.h"

@interface XYRDTCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourcePlaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *desimationPlace;
@property (weak, nonatomic) IBOutlet UILabel *fahuorenLabel;
@property (weak, nonatomic) IBOutlet UILabel *shouhuorenLabel;


@end


@implementation XYRDTCell

- (void)setModel:(XYRDDetailModel *)model {
    _model = model;
//    [_nameLabel setText:[NSString stringWithFormat:@"%@(车次：%@)",model.name,model.cars]];
//    //1：在途；2：已收货；
//    [_statusLabel setText:[@"1" isEqualToString:model.sendstatus] ? @"在途" : @"已收货"];
//    [_sourcePlaceLabel setText:[NSString stringWithFormat:@"发货地:%@",model.placeofreceipt]];
//    [_desimationPlace setText:[NSString stringWithFormat:@"收货地:%@",model.sendtoplace]];
//    [_fahuorenLabel setText:[NSString stringWithFormat:@"发货人:%@",model.senduser]];
//    NSString * username = model.username.length > 0 ? model.username : @"未知";
//    [_shouhuorenLabel setText:[NSString stringWithFormat:@"收货人:%@",username]];

    
    //car_num 车次
    //status 状态 -1：在途，1：已收货
    //ship_time 发货时间
    //receiver_time  到货时间
    //wname  批发地名称
    //shname 发货地名称
    //wholesale_name 发货人
    //receiver_name  收货人
    XYRDDetailOtherDataModel * otherModel = model.otherData;
    [_nameLabel setText:[NSString stringWithFormat:@"车次：%@",otherModel.car_num]];
    //1：在途；2：已收货；
    [_statusLabel setText:[@"-1" isEqualToString:otherModel.status] ? @"在途" : @"已收货"];
    [_sourcePlaceLabel setText:[NSString stringWithFormat:@"发货地:%@",otherModel.shname]];
    [_desimationPlace setText:[NSString stringWithFormat:@"收货地:%@",otherModel.wname]];
    [_fahuorenLabel setText:[NSString stringWithFormat:@"发货人:%@",otherModel.wholesale_name]];
    NSString * username = otherModel.receiver_name.length > 0 ? otherModel.receiver_name : @"未知";
    [_shouhuorenLabel setText:[NSString stringWithFormat:@"收货人:%@",username]];

    switch (_type) {
        case 0:
        {
        }
            break;
        case 1:
        {
        }
            break;
        case 2:
        {
            [_statusLabel setText:@"售罄"];
        }
            break;
        default:
            break;
    }

}
- (CGFloat)cellHeightWithType:(NSInteger)type {
    _type = type;
    CGFloat h = 0;
    switch (type) {
            
        case 0:
        {
            [self.shouhuorenLabel setHidden:NO];
            h += (17 + 8) * 5 + 8;
        }
            break;
        case 1:
        {
            [self.shouhuorenLabel setHidden:YES];
            h += (17 + 8) * 4 + 8;
        }
            break;
        case 2: 
        {
            [self.shouhuorenLabel setHidden:NO];
            h += (17 + 8) * 5 + 8;
        }
            break;
        default:
            break;
    }
    return h;
}
+ (CGFloat)cellHeight {
    CGFloat h = 0;
    h += (17 + 8) * 5 + 8;
    return h;
}
@end
