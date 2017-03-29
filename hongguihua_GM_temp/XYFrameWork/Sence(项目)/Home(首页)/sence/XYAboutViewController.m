//
//  XYAboutViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/11.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYAboutViewController.h"

#import <MyLayout.h>
@interface XYAboutViewController ()

@property (nonatomic,strong) UILabel * label;
@property (nonatomic,strong) UIScrollView * scrollView;
@end

@implementation XYAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 
- (void)initUI {
    [super initUI];
    _scrollView = [[UIScrollView alloc]init];
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    _label = [[UILabel alloc]init];
    [_scrollView addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_scrollView.mas_top).offset(10);
        make.left.equalTo(_scrollView.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.bottom.mas_equalTo(-10.f);
    }];
    _label.numberOfLines = 0;
    _label.textColor = COLOR_GRAY_2;
    [_label setFont:XY_S_FONT(13.f)];
    
}
- (void)initNet {
    [super initNet];
    XYWeakSelf
    [self xy_getWithValues:@{@"null":@"null"} ModelType:nil Path:i_specification hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
        NSString *  htmlStr;
        if ([model isKindOfClass:[NSDictionary class]]) {
            htmlStr = [model objectForKey:@"text_detail"];
        }else{
            htmlStr = model;
        }
        //去除上下留白
        
        NSMutableString * str = [NSMutableString stringWithString:htmlStr];
        NSString * result = [str stringByReplacingOccurrencesOfString:@"<p>\t\t\t\t\t\t\t\t</p>" withString:@""];
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[result dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
        weakSelf.label.attributedText = attributedString;
    } failure:^(NSString *msg, id model) {
        
    }];
}
- (void)initData {
    [super initData];
//    
//       NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:_label.text];
//     [attributedString addAttribute:NSParagraphStyleAttributeName value:[self paragraph] range:NSMakeRange(0, _label.text.length)];
//   _label.attributedText = attributedString;
    
}
- (NSMutableParagraphStyle*)paragraph
{
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc]init] ;
    paragraph.alignment=NSTextAlignmentJustified;
    paragraph.firstLineHeadIndent = 20.0;
    paragraph.paragraphSpacingBefore = 10.0;
    paragraph.lineSpacing = 5;
    paragraph.hyphenationFactor = 1.0;
    return paragraph ;
}

@end
