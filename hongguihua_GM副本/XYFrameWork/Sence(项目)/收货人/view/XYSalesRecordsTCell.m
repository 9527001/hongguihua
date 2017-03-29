//
//  XYSalesRecordsTCell.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/8/25.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#define seperatorLineColor COLOR_MAIN
#define notes @"暂无数据"
#define label(x)  [x isEqualToString:@""]?notes:x
#define font 14.f
#define cellUserInteractionEnabled NO
#import "XYSalesRecordsTCell.h"

#import "XYSaleRecordsModel.h"

@interface XYSalesRecordsTCell ()

@property (nonatomic,strong) NSMutableArray *statusArr;
@property (nonatomic,strong) NSArray *sendstatusArr;
@property (nonatomic,copy) NSString * xyid;
@property (nonatomic,assign) NSInteger selectNum;

@property (nonatomic,strong) id dataModel;

@end

@implementation XYSalesRecordsTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.statusArr = [NSMutableArray arrayWithArray:@[@"待审批",@"通过",@"未通过"]];
    self.sendstatusArr = [NSMutableArray arrayWithArray:@[@"在途",@"已收货"]];
    
}

//    _titleArr = @[@"发货杂费",
//                  @"到货杂费",
//                  @"货柜利润",
//                  @"剩余总件数",
//                  @"到货日期",
//                  @"最近更新日期",

//                  @"品种",
//                  @"等级",
//                  @"到货件数",
//                  @"单件成本",
//                  @"已售件数",
//                  @"已售金额",
//                  @"平均售价",
//                  @"剩余件数",

//                  @"销售状态",];
- (void)confirgModel:(id )dataModel anditemCellWidth:(CGFloat )itemWidth andSpecialLoacation:(CGFloat)specialLocation  indexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block{
    self.indexPath = indexPath;
    self.block = block;
    
    if ([dataModel isKindOfClass:[Base class]]) {
        
        Base * model = dataModel;
        NSMutableArray * arr = [NSMutableArray array];
        
       
        [arr addObject:@""];
        [arr addObject:@""];
        [arr addObject:@""];
        [arr addObject:@""];
        [arr addObject:@""];
        [arr addObject:@""];
        
        [arr addObject:model.addtime];
        [arr addObject:model.sunit];
        [arr addObject:model.stock];
        [arr addObject:model.send_price];
        [arr addObject:model.price];
        [arr addObject:model.pricesum];
        [arr addObject:model.price];
        [arr addObject:model.pricesum];
        
        [arr addObject:@""];
        
        self.selectNum = 0;
        self.dataModel = dataModel;
        [self dataArr:arr anditemCellWidth:itemWidth andSpecialLoacation:self.selectNum];
    }
    
    
    
}
- (void)confirgManageWithModel:(XYSenderProductModel * )dataModel anditemCellWidth:(CGFloat )itemWidth andSpecialLoacation:(CGFloat)specialLocation  indexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block{
    self.indexPath = indexPath;
    self.block = block;
    
    NSMutableArray * arr = [NSMutableArray array];
    
    [arr addObject:dataModel.pname];
    [arr addObject:dataModel.level_name];
    [arr addObject:dataModel.num];
    [arr addObject:dataModel.cost];
    [arr addObject:@""];
    [arr addObject:@""];
    [arr addObject:@""];
    [arr addObject:@""];
    [arr addObject:@""];
    [arr addObject:@""];
    [arr addObject:@""];
    [arr addObject:@""];
    [arr addObject:@""];
    [arr addObject:@""];
    
    self.selectNum = 0;
    self.dataModel = dataModel;
    [self dataArr:arr anditemCellWidth:itemWidth andSpecialLoacation:self.selectNum];
    
    
    
    
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
                    [label setNumberOfLines:2];
                    
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
            make.top.equalTo(self.contentView).offset(0);
            make.bottom.equalTo(self.contentView).offset(0);
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
        
        //右侧线
        UIView * rightLine = [[UIView alloc] init];
        [view addSubview:rightLine];
        [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(view);
            make.width.mas_equalTo(1);
            make.right.equalTo(view.mas_right).offset(0);
        }];
        [rightLine setBackgroundColor:COLOR_SEPERATORLINE];
        
        //顶部线
        UIView * topLine = [[UIView alloc] init];
        [view addSubview:topLine];
        [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(view);
            make.height.mas_equalTo(1);
        }];
        [topLine setBackgroundColor:COLOR_SEPERATORLINE];
        
//        //底部线
//        UIView * bottomLine = [[UIView alloc] init];
//        [view addSubview:bottomLine];
//        [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.bottom.equalTo(view);
//            make.height.mas_equalTo(1);
//        }];
//        [bottomLine setBackgroundColor:COLOR_SEPERATORLINE];
        
        //label
        UILabel * label = [[UILabel alloc]init];
        [label setNumberOfLines:2];
        [label setFont:XY_S_FONT(font)];
        [label setTextColor:COLOR_GRAY_1];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
              make.edges.equalTo(view);
        }];
   
        NSString * content = [dataArr safeObjectAtIndex:i];
        [label setText:content];
        
        [topLine setBackgroundColor:(content.length == 0 ? COLOR_WHITE :COLOR_SEPERATORLINE)];
        
    }
//    UIView * bottomLine = [[UIView alloc] init];
//    [self.contentView addSubview:bottomLine];
//    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.contentView);
//        make.height.mas_equalTo(1);
//    }];
//    [bottomLine setBackgroundColor:COLOR_SEPERATORLINE];
}
- (void)tap:(UITapGestureRecognizer *)tap {
    if (tap.view.tag == self.selectNum + 1) {
        if (self.block) {
            self.block(self.dataModel ,self.indexPath);
        }
    }
}

@end
