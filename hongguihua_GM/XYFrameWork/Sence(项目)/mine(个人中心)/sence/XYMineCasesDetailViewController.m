//
//  XYMineCasesDetailViewController.m
//  XYFrameWork
//
//  Created by 中企互联 on 16/6/6.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYMineCasesDetailViewController.h"

#import "XYMineCasesDetailCell.h"
#import "XYStandardImageTitleCell.h"

@interface XYMineCasesDetailViewController ()

@property (nonatomic,strong) NSArray * titleArr;
@property (nonatomic,strong) NSArray * contentArr;
@property (nonatomic,strong) NSArray * modelTypeArr;

@property (nonatomic,strong) XYMineCasesDetailModel * dataModel;

@end

@implementation XYMineCasesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initNavigationBar {
    [super initNavigationBar];
    self.mainTitle = @"洪桂华";
    self.title = self.mainTitle;
}

- (void)initTableView {
    [super initTableView];
    [self initTableViewWithDelegate:self dataSource:self andStyle:UITableViewStyleGrouped];
    [self.mTableView registerNib:@"XYStandardImageTitleCell"];
    [self.mTableView registerNib:@"XYMineCasesDetailCell"];
}

- (void)initUI {
    [super initUI];
    self.modelTypeArr = @[i_myleavedetail,i_myreimbursedetail,i_mygooutdetail,i_mypositivedetail,i_mytraveldetail];
    switch (self.type) {
        case AskForLeave:
            self.titleArr = @[@"所在部门",@"开始时间",@"结束时间",@"出差事由",@"审核状态"];
            break;
        case SubmitAnExpenseAccount:
            self.titleArr = @[@"所在部门",@"报销金额",@"报销类别",@"费用明细",@"审核状态"];
            break;
        case Out:
            self.titleArr = @[@"所在部门",@"开始时间",@"结束时间",@"出差事由",@"审核状态"];
            break;
        case Positive:
            self.titleArr = @[@"入职部门",@"入职时间",@"试用总结",@"意见建议",@"审核状态"];
            break;
        case OnABusinessTrip:
            self.titleArr = @[@"所在部门",@"出差地点",@"出差天数",@"出差事由",@"审核状态"];
            break;
            
        default:
            break;
    }
    NSMutableArray * arr = [NSMutableArray array];
    for (NSInteger i = 0; i < self.titleArr.count; i ++) {
        [arr addObject:[self.titleArr safeObjectAtIndex:arc4random()%self.titleArr.count]];
    }
    self.contentArr = arr;
}
- (void)initData {
    [super initData]; 
  
}
- (void)initNet {
    [super initNet];
    if (_lModel.xyid) {
        [self xy_postWithValues:@{@"token":m_token,@"id":self.lModel.xyid} ModelType:[XYMineCasesDetailModel class] Path:[self.modelTypeArr safeObjectAtIndex:self.type] hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
            /**
             *  此处不应该为数组
             */
            if ([model isKindOfClass:[NSArray class]]) {
                
                self.dataModel = [model firstObject];
            }
            if ([model isKindOfClass:[XYMineCasesDetailModel class]]) {
                self.dataModel = model;
            }
            [self.mTableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
        } failure:^(NSString *msg, id model) {
            
        }];
    }
}
 
#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return self.titleArr.count;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0) {
        return 150 * 0.5f;
    }
    return 25.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYStandardImageTitleCell *cell_it = [tableView dequeueReusableCellWithIdentifier:@"XYStandardImageTitleCell"];
    XYMineCasesDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYMineCasesDetailCell"];
    if (indexPath.section == 0) {
        [cell_it.backGroundImageView setHidden:YES];  
        [cell_it.iconImageView kSetImageWithURL:m_userModel.photo placeholderImage:PLACEHOLDERDEFAULTICONIMAGE];
        [cell_it.titleLabel setText:m_loginname];
        return cell_it;
    }else{
        
        if (self.titleArr.count) {
            [cell.titleLabel setText:[self.titleArr safeObjectAtIndex:indexPath.row]];
        }
        if (self.dataModel) {
            [cell setModel:self.dataModel type:self.type  IndexPath:indexPath callBack:nil];
        }
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20.f;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
