//
//  XYLIstCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/8.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//


#define seperatorLineColor COLOR_MAIN
#define notes @"暂无数据"
#define label(x)  [x isEqualToString:@""]?notes:x
#define font 14.f
#define cellUserInteractionEnabled YES
#import "XYListCell.h"

#import "XYSaleRecordsModel.h"

@interface XYListCell ()

@property (nonatomic,strong) NSMutableArray *statusArr;
@property (nonatomic,strong) NSArray *sendstatusArr;
@property (nonatomic,copy) NSString * xyid;
@property (nonatomic,assign) NSInteger selectNum;

@property (nonatomic,strong) id dataModel;

@end

@implementation XYListCell

- (void)awakeFromNib {
    [super awakeFromNib];
 
    self.statusArr = [NSMutableArray arrayWithArray:@[@"待审批",@"通过",@"未通过"]];
    self.sendstatusArr = [NSMutableArray arrayWithArray:@[@"在途",@"已收货"]];
   
}

- (void)confirgModel:(id )dataModel anditemCellWidth:(CGFloat )itemWidth andSpecialLoacation:(CGFloat)specialLocation  indexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block{
    self.indexPath = indexPath;
    self.block = block;
    
    if ([dataModel isKindOfClass:[XYProductListModel class]]) {
        XYProductListModel * model = dataModel;
        NSMutableArray * arr = [NSMutableArray array];
        [arr addObject:model.name];
        [arr addObject:model.spek];
        [arr addObject:model.price];
        [arr addObject:model.number];
        [arr addObject:model.sendplace];
        [arr addObject:model.username];
        [arr addObject:[self.statusArr safeObjectAtIndex:([model.status integerValue] - 1)]];
        self.selectNum = arr.count -2;
        self.xyid = model.xyid;
        self.dataModel = dataModel;
        [self dataArr:arr anditemCellWidth:itemWidth andSpecialLoacation:self.selectNum];
    }
    
    if ([dataModel isKindOfClass:[XYManagementModel class]]) {
 
        XYManagementModel * model = dataModel;
        NSMutableArray * arr = [NSMutableArray array];
        /**
         *  
         "id         发货列表id
         getgoodsid 收货列表id
         name      商品名
         sendtime   发货月份
         carnumber  车牌号
         
         cars       车次
         unit       发货总件数
         杂费{
         otherprice   发货产生的杂费
         gotherprice  收货产生的杂费
         }
         sendtoplace   批发地
         
         sendstatus    发货状态1：在途；2：已收货；
         gunit       收货总件数
         grade       等级
         price       发货成本/件
         username   收货人
         
         sellprice    售出总价格
         */
        /**
         *
         @[@"批发地",
         @"月份",
         @"车牌号",
         @"车次",
         @"果品等级",
         
         @"发货件数",
         @"到货件数",
         @"成本/件(元)",
         @"售价/件(元)",
         @"销售收入(元)"
         @"总成本(元)",
         
         @"杂费(元)",
         @"利润(元)",
         @"收货人",
         @"状态"];
         */
        


        [arr addObject:model.sendtoplace];
        [arr addObject:model.sendtime];
        [arr addObject:model.cars];
        [arr addObject:model.carnumber];
        [arr addObject:model.grade];
        
        [arr addObject:model.unit];
        [arr addObject:label(model.gunit)];
        [arr addObject:model.price];//单件成本
        if ([m_cid isEqualToString:@"4"]) {//中间人 发货
            
            
        }else if ([m_cid isEqualToString:@"2"]||//第三人 收货
                  [m_cid isEqualToString:@"3"]) {//高管
            
            [arr addObject:label(model.sprice)]; //售价
            [arr addObject:model.sellprice];//销售总收入
            
        }else{
            
        }
        [arr addObject:model.allprice];//成本
        [arr addObject:model.otherp];//杂费
        if ([m_cid isEqualToString:@"4"]) {//中间人 发货
            
            
        }else if ([m_cid isEqualToString:@"2"]||//第三人 收货
                  [m_cid isEqualToString:@"3"]) {//高管
            
            [arr addObject:model.profit];//利润
            
        }else{
            
        }
        [arr addObject:model.username];//收货人
        [arr addObject:[self.sendstatusArr safeObjectAtIndex:([model.sendstatus integerValue] - 1)]];//状态
        
        self.selectNum = arr.count -2;
        self.xyid = model.xyid;
        self.dataModel = dataModel;
        [self dataArr:arr anditemCellWidth:itemWidth andSpecialLoacation:self.selectNum];
    }
    if ([dataModel isKindOfClass:[Base class]]) {
        
        Base * model = dataModel;
        NSMutableArray * arr = [NSMutableArray array];
 
        
        [arr addObject:model.addtime];
        [arr addObject:model.sunit];
        [arr addObject:model.stock];
        [arr addObject:model.price];
        [arr addObject:model.send_price];
        [arr addObject:model.pricesum];
        
        [arr addObject:model.sunit];
        [arr addObject:model.stock];
        [arr addObject:model.price];
        [arr addObject:model.send_price];
        [arr addObject:model.pricesum];
        
        self.selectNum = arr.count -2;
        self.dataModel = dataModel;
        [self dataArr:arr anditemCellWidth:itemWidth andSpecialLoacation:self.selectNum];
    }

    
  
}
- (void)dataArr:(NSMutableArray *)dataArr anditemCellWidth:(CGFloat )itemWidth andSpecialLoacation:(CGFloat)specialLocation{
    NSInteger i = 0;
    for (UIView * view in self.contentView.subviews) {
        if ([view isKindOfClass:[UIView class]]) {
            for (id object in view.subviews) {
                if ([object isKindOfClass:[UILabel class]]) {
                    i ++;
                    UILabel * label = object;
                    [label setText:[dataArr safeObjectAtIndex:i -1]];
                    if (i == dataArr.count -2) {
                        NSString*profit = [dataArr safeObjectAtIndex:i -1];
                        if ([profit floatValue] < 0) {
                            [label setTextColor:COLOR_RED];
                        }else{
                            [label setTextColor:COLOR_GRAY_2];
                        }
                    }
                }
            }
        }
        
    }
    if (i > 0) {
        return;
    }
    
    UIView * currentView;
    NSInteger count = dataArr.count;
    for (NSInteger i = 0; i < count; i ++) {
        UIView * view = [[UIView alloc]init];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-1);
            make.width.mas_equalTo(itemWidth);
            if (currentView) {
                
                make.left.equalTo(currentView.mas_right).offset(0);
            }else{
                
                make.left.equalTo(self.contentView).offset(0);
            }
        }];
        view.userInteractionEnabled = cellUserInteractionEnabled;
        view.tag = i + 1;
        currentView = view;
      
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [view addGestureRecognizer:tap];
    
        
        UIView * bottomLine = [[UIView alloc] init];
        [self.contentView addSubview:bottomLine];
        [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.contentView);
            make.height.mas_equalTo(1);
        }];
        [bottomLine setBackgroundColor:COLOR_SEPERATORLINE];
        
        
        UIView * rightLine = [[UIView alloc] init];
        [view addSubview:rightLine];
        [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(view);
            make.width.mas_equalTo(1);
            make.right.equalTo(view.mas_right).offset(0);
        }];
        [rightLine setBackgroundColor:COLOR_SEPERATORLINE];
        
        UILabel * label = [[UILabel alloc]init];
        [label setFont:XY_S_FONT(font)];
        [view addSubview:label];
        [label setNumberOfLines:2];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(view);
            make.centerY.equalTo(view);
            make.left.equalTo(view.mas_left).offset(8);
            make.centerX.equalTo(view);
            make.height.mas_equalTo(20.f);
        }];
        if (i == specialLocation) {
            [label setBackgroundColor:COLOR_BLUE];
            [label xy_setCornerRadius:5.0f];
        }else{
            [label setBackgroundColor:[UIColor clearColor]];
            
        }
        
        [label setTextColor:COLOR_GRAY_2];
        label.textAlignment = NSTextAlignmentCenter;
        [label setText:[dataArr safeObjectAtIndex:i]];
        if (i == count - 1) {
            [label setTextColor:COLOR_RED]; 
        }else { 
            [label setTextColor:COLOR_GRAY_2];
        }
        
        if (i == count -3) {
            NSString*profit = [dataArr safeObjectAtIndex:i];
            if ([profit floatValue] < 0) {
                [label setTextColor:COLOR_RED];
            }else{
                [label setTextColor:COLOR_GRAY_2];
            }
        }
    }
}
- (void)tap:(UITapGestureRecognizer *)tap {
    if (tap.view.tag == 2) {
        if (self.block) {
            self.block(self.dataModel ,self.indexPath);
        }
    }
}

@end
