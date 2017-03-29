//
//  XYMessageReceiveDeliverVC.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/8/26.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYMessageReceiveDeliverVC.h"


#import "XYRDTCell.h"
#import "XYRDHeaderHFView.h"

#import "XYRDModel.h"

@interface XYMessageReceiveDeliverVC ()

@property (nonatomic,assign) RDType type;
@property (nonatomic,strong) NSMutableArray * contentArr;
@end

@implementation XYMessageReceiveDeliverVC


- (instancetype)initWithType:(RDType)type {
    if (self = [super init]) {
        _type = type;
        switch (type) {
            case receiveType:
                self.title = @"收货消息";
                break;
            case develiverType:
                self.title = @"发货消息";
                break;
            case saleType:
                self.title = @"销售消息";
                break;
            default:
                break;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad]; 
}

- (void)initNet {
    [super initNet];
    switch (_type) {
        case receiveType:
            [self httpList:i_my_receipt_message dic:@{@"token":m_token,MPAGESIZE:@"999",MPAGENUMBER:m_pagenumber,@"type":@"2"}];
            break;
        case develiverType: 
            [self httpList:i_my_receipt_message dic:@{@"token":m_token,MPAGESIZE:@"999",MPAGENUMBER:m_pagenumber,@"type":@"1"} ];
            break;
        case saleType:
//            [self httpList:@"ssellgoodsinfolist"];
            
            [self httpList:i_my_receipt_message dic:@{@"token":m_token,MPAGESIZE:@"999",MPAGENUMBER:m_pagenumber,@"type":@"3"} ];
            break;
        default:
            break;
    }
    
}
- (void)httpList:(NSString *)mod  dic:(NSDictionary *)dic{
    XYWeakSelf
    [self xy_postWithValues:dic ModelType:[XYRDModel class] Path:mod hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[NSArray class]]) {
            for (XYRDModel * rdModel in model) {
                rdModel.isClick = @"1";
            }
            [weakSelf sucessData:model];
            NSArray * arr = model;
            weakSelf.contentArr = [NSMutableArray arrayWithCapacity:arr.count];
            for (NSInteger i = 0; i < arr.count; i ++) {
                [weakSelf.contentArr addObject:@""];
            }
        }
    } failure:^(NSString *msg, id model) {
        
    }];
}
- (void)httpList:(NSString *)mod {
    XYWeakSelf
    [self xy_postWithValues:@{@"token":m_token,MPAGESIZE:@"999",MPAGENUMBER:m_pagenumber} ModelType:[XYRDModel class] Path:mod hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[NSArray class]]) {
            for (XYRDModel * rdModel in model) {
                rdModel.isClick = @"1";
            }
            [weakSelf sucessData:model];
            NSArray * arr = model;
            weakSelf.contentArr = [NSMutableArray arrayWithCapacity:arr.count];
            for (NSInteger i = 0; i < arr.count; i ++) {
                [weakSelf.contentArr addObject:@""];
            }
        }
    } failure:^(NSString *msg, id model) {
        
    }];
}
- (void)httpContent:(NSString *)messageId indexPath:(NSIndexPath *)indexPath{
    NSString * mod ;
    switch (_type) {
        case receiveType:
            mod = i_my_receipt_message_byid;
            break;
        case develiverType:
            mod = i_my_receipt_message_byid;
            break;
        case saleType:
            mod = @"my_receipt_message_byid";
            break;
        default:
            break;
    }
    XYWeakSelf
    [self xy_postWithValues:@{@"token":m_token,MID:messageId } ModelType:[XYRDDetailModel class] Path:mod hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        if ([model isKindOfClass:[XYRDDetailModel class]]) {
            [weakSelf.contentArr replaceObjectAtIndex:indexPath.section withObject:model];
            
            XYRDModel * model = [weakSelf.mData safeObjectAtIndex:indexPath.section];
            model.status = @"2";
            [weakSelf.mTableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    } failure:^(NSString *msg, id model) {
        
    }];
}

- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self xy_tableViewStyle:XYTableViewStyleNavigationBar];
    [self.mTableView registerNib:@"XYRDTCell"];
    [self.mTableView registerNibHeaderFooterView:@"XYRDHeaderHFView"];
    [self.mTableView registerNib:[UINib nibWithNibName:@"XYRDHeaderHFView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"XYRDHeaderHFView"];
}


#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.mData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    XYRDModel * model = [self.mData safeObjectAtIndex:section];
    return [@"1" isEqualToString:model.isClick] ? 0 :1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYRDTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYRDTCell"];
    return [cell cellHeightWithType:_type];
    return [XYRDTCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYRDTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYRDTCell"];
    id model = [self.contentArr safeObjectAtIndex:indexPath.section];
    if ([model isKindOfClass:[XYRDDetailModel class]]) {
        XYRDDetailModel * modell = model;
        cell.model = modell;
        cell.type = _type;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    XYRDHeaderHFView * headeView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"XYRDHeaderHFView"];
    
    XYRDModel * model = [self.mData safeObjectAtIndex:section];
    headeView.model = model;
    headeView.section = section;
    XYWeakSelf
    headeView.block = ^(NSInteger section){
        XYRDModel * model = [self.mData safeObjectAtIndex:section];
        model.isClick = ([@"1" isEqualToString:model.isClick]) ? @"2" : @"1";
        [weakSelf.mData replaceObjectAtIndex:section withObject:model];
        id modelll = [weakSelf.contentArr safeObjectAtIndex:section];
        if ([modelll isKindOfClass:[XYRDDetailModel class]]) {
            [weakSelf.mTableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
        }else{
            [weakSelf httpContent:model.xyid indexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
        }
    };
    return headeView;
}


@end
