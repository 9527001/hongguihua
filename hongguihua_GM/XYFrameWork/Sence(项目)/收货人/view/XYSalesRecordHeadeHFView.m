//
//  XYSalesRecordHeadeHFView.m
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


#import "XYSalesRecordHeadeHFView.h"
#import "XYSaleRecordsModel.h"



@interface XYSalesRecordHeadeHFView ()

@property (nonatomic,strong) NSMutableArray *statusArr;
@property (nonatomic,strong) NSArray *sendstatusArr;
@property (nonatomic,copy) NSString * xyid;
@property (nonatomic,assign) NSInteger selectNum;

@property (nonatomic,strong) id dataModel;

@end

@implementation XYSalesRecordHeadeHFView
  
- (void)confirgModel:(id )dataModel anditemCellWidth:(CGFloat )itemWidth andSpecialLoacation:(CGFloat)specialLocation  indexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block{
  
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

    
    if ([dataModel isKindOfClass:[HeaderViewModel class]]) {
        
        HeaderViewModel * model = dataModel;
        NSMutableArray * arr = [NSMutableArray array];
         
        [arr addObject:model.placeofreceipt];
        [arr addObject:model.cars];
        [arr addObject:model.name];
        [arr addObject:model.grade];
        [arr addObject:model.gunit];
        [arr addObject:model.gunit];

        
        [arr addObject:model.addtime];
        [arr addObject:model.sunit];
        [arr addObject:model.stock];
        [arr addObject:model.send_price];
        [arr addObject:model.price];
        [arr addObject:model.pricesum];
        [arr addObject:model.price];
        [arr addObject:model.pricesum];
        
        
        [arr addObject:@"销售结束"];
        
        [self dataArr:arr anditemCellWidth:itemWidth andSpecialLoacation:0];
    }
    
    
    
}
- (void)dataArr:(NSMutableArray *)dataArr anditemCellWidth:(CGFloat )itemWidth andSpecialLoacation:(CGFloat)specialLocation{
    NSInteger i = 0;
    for (UIView * view in self.contentView.subviews) {
        if ([view isKindOfClass:[UIView class]]) {
            for (id object in view.subviews) {
                if ([object isKindOfClass:[UILabel class]]) {
                    
                    NSString * content = [dataArr safeObjectAtIndex:i];
                    
                    UILabel * label = object;
                    [label setText:content];
                    [label setNumberOfLines:2];
                    
                    if (i == dataArr.count -1) {
                        
                        [label setTextColor:(specialLocation ? COLOR_BLUE : COLOR_RED)];
                    }else if (i == 2 &&
                             [content floatValue] < 0 &&
                              specialLocation == 1){
                        [label setTextColor:COLOR_RED];
                    }else{
                        
                        [label setTextColor:COLOR_GRAY_1];
                    }
                     i ++;
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
        //view
        UIView * view = [[UIView alloc]init];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView);
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
  
        //label
        UILabel * label = [[UILabel alloc]init];
        [label setFont:XY_S_FONT(font)];
        [label setNumberOfLines:2];
        [label setBackgroundColor:[UIColor clearColor]];
        
  
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(view);
        }];
        NSString * content = [dataArr safeObjectAtIndex:i];
        [label setText:content];
        
        if (i == count - 1) {
            
            [label setTextColor:(specialLocation ? COLOR_BLUE : COLOR_RED)];
        }else if (i == 2 &&
                  [content floatValue] < 0 &&
                  specialLocation == 1){
            [label setTextColor:COLOR_RED];
        }  else{
            
            [label setTextColor:COLOR_GRAY_1];
        }
        
    }
    
//    UIView * bottomLine = [[UIView alloc] init];
//    [self.contentView addSubview:bottomLine];
//    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.contentView);
//        make.height.mas_equalTo(1);
//    }];
//    [bottomLine setBackgroundColor:COLOR_SEPERATORLINE];
}



@end
