//
//  SBZCustomDistrictSelectorPickerView.m
//  saibaiz
//
//  Created by 中企互联 on 15/12/11.
//  Copyright © 2015年 中企互联. All rights reserved.
//

#define openAndQuitTime 0.3
#define pickerAndTitleHeight (XY_M_SCREEN_MAX - H_NAVIGATIONBAR)/3
#define normalConstant 0

#import "SBZCustomDistrictSelectorPickerView.h"


@interface SBZCustomDistrictSelectorPickerView ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *customPickerView;

@property (nonatomic,strong) NSArray * provinceArr;
@property (nonatomic,strong) NSArray * provinceCodeArr;
@property (nonatomic,strong) NSMutableArray * cityeArr;
@property (nonatomic,strong) NSMutableArray * cityCodeArr;
@property (nonatomic,strong) NSMutableArray * countyArr;
@property (nonatomic,strong) NSMutableArray * countyCodeArr;

@property (nonatomic,strong) NSMutableArray * dataArr;//数据源
@property (nonatomic,strong) NSMutableArray * dataCodeArr;//数据源

@property (nonatomic,strong) NSMutableArray * recordArr;
@property (nonatomic,strong) NSMutableArray * recordCodeArr;//数据源

@property (nonatomic,strong) NSMutableArray * currentRow;//记录当前row

@property (nonatomic,strong)  NSDictionary * allDic;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstant;

@end

@implementation SBZCustomDistrictSelectorPickerView

- (NSMutableArray *)recordArr{
    if (!_recordArr) {
        NSMutableArray * arr = [NSMutableArray arrayWithCapacity:self.dataArr.count];
        for (NSInteger i =0;i < self.currentRow.count; i ++) {
            NSArray * pccArr = [self.dataArr safeObjectAtIndex:i];
            [arr addObject:[pccArr objectAtIndex:[[self.currentRow safeObjectAtIndex:i] integerValue]]];
        }
        _recordArr = [NSMutableArray arrayWithArray:arr];
    }
    return _recordArr;
}
- (NSMutableArray *)recordCodeArr{
    if (!_recordCodeArr) {
        
        NSMutableArray * arr = [NSMutableArray arrayWithCapacity:self.dataCodeArr.count];

        for (NSInteger i =0;i < self.currentRow.count; i ++) {
            
            NSArray * pccCodeArr = [self.dataCodeArr safeObjectAtIndex:i];
            [arr addObject:[pccCodeArr objectAtIndex:[[self.currentRow safeObjectAtIndex:i] integerValue]]];
        }
        _recordCodeArr = [NSMutableArray arrayWithArray:arr];
    }
    return _recordCodeArr;
}
- (NSMutableArray *)currentRow{
    if (!_currentRow) {
        _currentRow = [NSMutableArray arrayWithObjects:@"0",@"0",@"0", nil];
    }
    return _currentRow;
}
+ (instancetype)instanceWith{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    return [SBZCustomDistrictSelectorPickerView instanceWithSuperView:window];
}
+ (instancetype)instanceWithSuperView:(UIView *)superView{
    NSArray * nibs =[[NSBundle mainBundle]loadNibNamed:@"SBZCustomDistrictSelectorPickerView" owner:self options:nil];
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    SBZCustomDistrictSelectorPickerView * vc =  nibs[0];
    vc.frame = window.bounds;
    [superView addSubview:vc];
    [vc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superView);
    }];
    return vc;
}
- (IBAction)handleCancel:(id)sender {
    [self removeSelfFromSuperview];
   
}
- (IBAction)handleConfirm:(id)sender {
    
    if (self.block) {
        self.block (self ,self.recordArr,self.recordCodeArr);
    }
    
    [self removeSelfFromSuperview];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    self.bottomView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];

    
    self.dataArr = [NSMutableArray array];
    self.dataCodeArr = [NSMutableArray array];
    
    self.cityeArr = [NSMutableArray array];
    self.cityCodeArr = [NSMutableArray array];
    self.countyArr = [NSMutableArray array];
    self.countyCodeArr = [NSMutableArray array];
    
    [self data];
    [self show];
}
 
- (void)data{
    
    NSString *areaJsonPath=[[NSBundle mainBundle]pathForResource:@"area.json" ofType:nil];
    NSString *areaList=[NSString stringWithContentsOfFile:areaJsonPath encoding:NSUTF8StringEncoding error:nil];
    NSData *jsonData=[areaList dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary * paraDic=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    self.allDic = paraDic;
    
    
    NSDictionary *provinceDic=[paraDic xy_objectForKey:@"province"];
    //    取到所有对应的省
    self.provinceCodeArr =[provinceDic allKeys];
    
    //    排序
    NSMutableArray *newprovinceCodeArr = [NSMutableArray arrayWithArray:self.provinceCodeArr];
    [newprovinceCodeArr sort];
    self.provinceCodeArr = newprovinceCodeArr;
    
    NSMutableArray *newprovinceArr = [NSMutableArray arrayWithCapacity:newprovinceCodeArr.count];
    for (NSString *provinceStr in newprovinceCodeArr) {
        [newprovinceArr addObject: [provinceDic xy_objectForKey:provinceStr]];
    }
    self.provinceArr = newprovinceArr;
    
    
    //    取对应的市
    
    self.cityCodeArr = [self arrayWithKeyPara:@"110000" andKeyType:1 andDicName:@"city" andAllDataDic:paraDic];
    self.cityeArr = [self arrayWithKeyPara:@"110000" andKeyType:0 andDicName:@"city" andAllDataDic:paraDic];
    //    取到所有对应的县市
    self.countyArr=[self arrayWithKeyPara:self.cityCodeArr.firstObject andKeyType:0 andDicName:@"area" andAllDataDic:paraDic];
    self.countyCodeArr=[self arrayWithKeyPara:self.cityCodeArr.firstObject andKeyType:1 andDicName:@"area" andAllDataDic:paraDic];
    NSLog(@"________%@\n____________%@",self.countyArr,self.countyCodeArr);
    
    //记录 数据
    [self.dataArr addObject:self.provinceArr];
    [self.dataArr addObject:self.cityeArr];
    [self.dataArr addObject:self.countyArr];
 
    [self.dataCodeArr addObject:self.provinceCodeArr];
    [self.dataCodeArr addObject:self.cityCodeArr];
    [self.dataCodeArr addObject:self.countyCodeArr];

}

//获取对应的城市 ，县、区
- (NSMutableArray * )arrayWithKeyPara:(NSString *)param andKeyType:(NSInteger)index andDicName:(NSString*)name andAllDataDic:(NSDictionary *)allDic{
    
    NSMutableDictionary * dataDic = [allDic objectForKey:name];
    NSArray * keysArr = [dataDic allKeys];
    NSArray * valuesArr = [dataDic allValues];
    NSInteger indexKey = 0 ;
    for (NSInteger i =0; i< keysArr.count; i ++) {
        if ([param isEqualToString:[keysArr safeObjectAtIndex:i]]) {
            indexKey = i;
        }
    }
    
    NSArray * valueArr = [valuesArr objectAtIndex:indexKey];
    
    
    NSMutableArray *  arr =[ NSMutableArray array];
    for (NSInteger i = 0; i < valueArr.count; i ++) {
        NSArray *arr1 = [valueArr safeObjectAtIndex:i];
        [arr addObject:[arr1 safeObjectAtIndex:index]];
    }
    return arr;
}
#pragma mark -- pickerView
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray * arr = [self.dataArr safeObjectAtIndex:component];
    return arr.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *arr = [self.dataArr safeObjectAtIndex:component];
    return [arr safeObjectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
//    [self.currentRow replaceObjectAtIndex:component withObject:[NSString stringWithFormat:@"%ld",row]];

      if (component == 0) {
 
        
          [self selectIndexZero:row];
        
    
        
     }else if (component == 1){
        
        //    取到所有对应的县市
        self.countyArr=[self arrayWithKeyPara:[self.cityCodeArr safeObjectAtIndex:row] andKeyType:0 andDicName:@"area" andAllDataDic:self.allDic];
         
        self.countyCodeArr=[self arrayWithKeyPara:[self.cityCodeArr safeObjectAtIndex:row] andKeyType:1 andDicName:@"area" andAllDataDic:self.allDic];
        
   
         [self.dataArr replaceObjectAtIndex:2 withObject:self.countyArr];
         [self.dataCodeArr replaceObjectAtIndex:2 withObject:self.countyCodeArr];
         
        [self.customPickerView reloadComponent:2];
         
        
    }
    else
    {

    }
    
    [self.currentRow replaceObjectAtIndex:component withObject:[NSString stringWithFormat:@"%zd",row]];
    for (NSInteger i = 0 ; i < self.dataArr.count; i ++) {
        
        NSArray * arr = [self.dataArr safeObjectAtIndex:i];
        if ([arr count] - 1 < [[self.currentRow safeObjectAtIndex:i] integerValue]) {
            NSString * indexStr = [NSString stringWithFormat:@"%zd",[arr count] -1];
            [self.currentRow replaceObjectAtIndex:i withObject:indexStr];
        }
    }
//    if (self.block) {
        for (NSInteger i =0;i < self.currentRow.count; i ++) {
            
            NSArray * pccArr = [self.dataArr safeObjectAtIndex:i];
            NSArray * pccCodeArr = [self.dataCodeArr safeObjectAtIndex:i];
            
            [self.recordArr replaceObjectAtIndex:i withObject:[pccArr objectAtIndex:[[self.currentRow safeObjectAtIndex:i] integerValue]]];
            [self.recordCodeArr replaceObjectAtIndex:i withObject:[pccCodeArr objectAtIndex:[[self.currentRow safeObjectAtIndex:i] integerValue]]];
        }
        
//        self.block (self ,self.recordArr,self.recordCodeArr);
//    }
}

- (void)selectIndexZero:(NSInteger)row
{
    self.cityCodeArr = [self arrayWithKeyPara:[self.provinceCodeArr safeObjectAtIndex:row] andKeyType:1 andDicName:@"city" andAllDataDic:self.allDic];
    self.cityeArr = [self arrayWithKeyPara:[self.provinceCodeArr safeObjectAtIndex:row] andKeyType:0 andDicName:@"city" andAllDataDic:self.allDic];
    
    
    //    取到所有对应的县市
    NSInteger index;
    if (self.cityeArr.count -1 < [self.currentRow[1] integerValue]) {
        index = self.cityeArr.count -1;
    }else{
        index = [[self.currentRow safeObjectAtIndex:1] integerValue];
    }
    self.countyArr=[self arrayWithKeyPara:[self.cityCodeArr safeObjectAtIndex:index] andKeyType:0 andDicName:@"area" andAllDataDic:self.allDic];
    self.countyCodeArr=[self arrayWithKeyPara:[self.cityCodeArr safeObjectAtIndex:index] andKeyType:1 andDicName:@"area" andAllDataDic:self.allDic];
    
    
    //记录数据
    [self.dataArr replaceObjectAtIndex:1 withObject:self.cityeArr];
    [self.dataArr replaceObjectAtIndex:2 withObject:self.countyArr];
    
    [self.dataCodeArr replaceObjectAtIndex:1 withObject:self.cityCodeArr];
    [self.dataCodeArr replaceObjectAtIndex:2 withObject:self.countyCodeArr];
    
    [self.customPickerView reloadComponent:1];
    [self.customPickerView reloadComponent:2];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        // Setup label properties - frame, font, colors etc
        //adjustsFontSizeToFitWidth property to YES
        pickerLabel.font = [UIFont systemFontOfSize:13];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

#pragma mark -- 点击移除
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self removeSelfFromSuperview];
}
#pragma mark -- tool
- (void)show {
    
    [self.bottomView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    [UIView animateWithDuration:openAndQuitTime animations:^{
        [self.bottomView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
        self.bottomConstant.constant = normalConstant;
        [self layoutIfNeeded];
    }];
}
- (void)removeSelfFromSuperview {
    XYWeakSelf
    [UIView animateWithDuration:openAndQuitTime animations:^{
        [self.bottomView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
        self.bottomConstant.constant = pickerAndTitleHeight;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (finished) {
            [weakSelf removeFromSuperview];
        }
    }];
}
@end
