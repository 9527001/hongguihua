//
//  XYableViewHeaderFooterView.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/7.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#define font 13.f
#import "XYTableViewHeaderFooterView.h"

@interface XYTableViewHeaderFooterView ()

@property (nonatomic,strong) UIColor * backGroundColor;

@end

@implementation XYTableViewHeaderFooterView


+ (void)registerClass:(UITableView *)tableView {
    
    [tableView registerClass:NSClassFromString(@"XYTableViewHeaderFooterView") forHeaderFooterViewReuseIdentifier:@"XYTableViewHeaderFooterView"];
    
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self.contentView setBackgroundColor:COLOR_MAIN];
    }
    return self;
}


- (void)confirgDataArr:(NSArray *)dataArr andBackGroundColor:(UIColor *)color andItemWidth:(CGFloat)itemWidth{
    [self.contentView setBackgroundColor:color];
    NSInteger i = 0;
    for (UIView * view in self.contentView.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            i ++;
            UILabel * label = (UILabel *)view;
            NSInteger tag = label.tag;
            [label setText:[dataArr safeObjectAtIndex:tag -1]];
            [label setTextColor:COLOR_GRAY_2];
            [label setBackgroundColor:color];
        }
        
    }
    if (i > 0) {
        return;
    }
    
    UIView * currentView;
    for (NSInteger i = 0; i < dataArr.count; i ++) {
        
        
        //顶部线
        UIView * topLine = [[UIView alloc] init];
        [self.contentView addSubview:topLine];
        [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.contentView);
            make.height.mas_equalTo(1);
        }];
        [topLine setBackgroundColor:COLOR_SEPERATORLINE];

        
        UILabel * label = [[UILabel alloc]init];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.contentView).offset(1);
            make.bottom.equalTo(self.contentView);
            make.width.mas_equalTo(itemWidth);
            if (currentView) {
                
                make.left.equalTo(currentView.mas_right).offset(0);
            }else{
                
                make.left.equalTo(self.contentView).offset(0);
            }
        }];
        label.tag = i + 1;
        [label setText:[dataArr safeObjectAtIndex:i]];
        [label setTextColor:COLOR_GRAY_2];
        [label setBackgroundColor:color];
        [label setFont:XY_S_FONT(font)];
        label.textAlignment = NSTextAlignmentCenter;
        
        //右侧线
        UIView * rightLine = [[UIView alloc] init];
        [self.contentView addSubview:rightLine];
        [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.contentView);
            make.width.mas_equalTo(1);
            make.right.equalTo(label.mas_right).offset(0);
        }];
        [rightLine setBackgroundColor:COLOR_SEPERATORLINE];
        
        currentView = rightLine;
    }
}

- (void)confirgDataArr:(NSArray *)dataArr andItemWidth:(CGFloat)itemWidth{
    [self confirgDataArr:dataArr andBackGroundColor:COLOR_WHITE  andItemWidth:itemWidth];
 
}



@end
