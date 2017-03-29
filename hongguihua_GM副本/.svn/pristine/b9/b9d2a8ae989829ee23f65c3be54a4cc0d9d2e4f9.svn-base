//
//  XYTextFieldCell.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/27.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYTextFieldCell.h"


@interface XYTextFieldCell ()<UITextFieldDelegate>



@end


@implementation XYTextFieldCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _isMax = NO;
    XYWeakSelf
    [_rightTextField bk_addEventHandler:^(UITextField *sender) {
        NSString * str = [NSString stringWithFormat:@"%@",sender.text];
        if (weakSelf.isMax) {
            if (weakSelf.maxCount < [str integerValue]) {
                [[DialogUtil sharedInstance] showDlg:weakSelf.window textOnly:[NSString stringWithFormat:@"最大数量为%zd",weakSelf.maxCount]];
                
                return ;
            }
        }
        if (weakSelf.block) {
            weakSelf.block(str,self.indexPath);
        }
    } forControlEvents:UIControlEventAllEditingEvents];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString * str = [NSString stringWithFormat:@"%@%@",textField.text,string];
    if (self.isMax) {
        if (self.maxCount < [str integerValue]) {
             [textField resignFirstResponder];
            [[DialogUtil sharedInstance] showDlg:self.window textOnly:[NSString stringWithFormat:@"最大数量为%zd",self.maxCount]];
            return NO;
        }
    }
    switch (self.tfType) {
        case demical:
        {
            if ( [Tool isFloatNumandCharacters:string]) {
                return YES;
            }else{
                return NO;
            }
        }
            break;
        case pureNumber:
        {
            if ( [Tool isPureNumandCharacters:string]) {
                return YES;
            }else{
                return NO;
            }
        }
            break;
            
        default:
            return YES;
            break;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    return YES;
}
- (void)showtopline:(BOOL)top bottomline:(BOOL)bottom jiantou:(BOOL)jiantou
{
    _topLine.hidden = !top;
    _bottomLine.hidden = !bottom;
    _jiantou.hidden = !jiantou;
    _rightTextFieldTrailing.constant = !jiantou ? 8 : 23;
    if (jiantou) {
        self.rightTextField.userInteractionEnabled = NO;
    }else{
        self.rightTextField.userInteractionEnabled = YES; 
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setTfType:(TextFieldType)tfType {
    _tfType = tfType;
    switch (tfType) {
        case defult:
            self.rightTextField.keyboardType = UIKeyboardTypeDefault;
            break;
        case pureNumber:
            self.rightTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
            break;
        case demical:
            self.rightTextField.keyboardType = UIKeyboardTypeDecimalPad;
            break;
        default:
            self.rightTextField.keyboardType = UIKeyboardTypeDefault;
            break;
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString * str = [NSString stringWithFormat:@"%@",textField.text];
    if (self.block) {
        self.block(str,self.indexPath); 
    }
}
- (void)setModel:(id)model IndexPath:(NSIndexPath *)indexPath callBack:(void (^)(id, id))block {
    [super setModel:model IndexPath:indexPath callBack:block];
    self.block = block;
    if ([model isKindOfClass:[NSString class]]) {
         [self.rightTextField setText:model];
    }
    if ([model isKindOfClass:[XYAddProductModel class]]) {//添加商品
        XYAddProductModel * dataModel = model;
        switch (indexPath.row) {
//            case 0:
//            {
//                self.rightTextField.keyboardType = UIKeyboardTypeDefault;
//                [self.rightTextField  setText:dataModel.specifications];
//            }
//                break;
            case 0:
            {
                 _tfType = demical;
                 self.rightTextField.keyboardType = UIKeyboardTypeDecimalPad;
                 [self.rightTextField  setText:dataModel.weight];
            }
                break;
            case 1:
            {
                _tfType = pureNumber;
                self.rightTextField.keyboardType = UIKeyboardTypeDecimalPad;
                 [self.rightTextField  setText:dataModel.unit];
            }
                break;
            case 2:
            {
                 _tfType = demical;
                self.rightTextField.keyboardType = UIKeyboardTypeDecimalPad;
                 [self.rightTextField  setText:dataModel.price];
            }
                break;
            case 3:
            {
                self.rightTextField.keyboardType = UIKeyboardTypeDefault;
                 [self.rightTextField  setText:dataModel.sourcing];
            }
                break;
                
            default:
                break;
        }
    }
    
    if ([model isKindOfClass:[XYSaleModel class]]) {//第三人 出售商品
        XYSaleModel * dataModel = model;
        _tfType = pureNumber;
        self.rightTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.isMax = YES;
        self.maxCount = [dataModel.stock integerValue];
        [self.rightTextField  setText:dataModel.sunit];
    }
    if ([model isKindOfClass:[XYCheckListDetailModel class]]) {
        self.rightTextField.keyboardType = UIKeyboardTypeNumberPad;
        XYCheckListDetailModel * dataModel = model;
        switch (indexPath.row) {
            case 0:
            {
                [self.rightTextField  setText:dataModel.spek];
            }
                break;
            case 1:
            {
                [self.rightTextField  setText:dataModel.number];
            }
                break;
            case 2:
            {
                [self.rightTextField  setText:dataModel.unit];
            }
                break;
            case 3:
            {
                [self.rightTextField  setText:dataModel.price];
            }
                break;
                
            default:
                break;
        }
    }
    if ([model isKindOfClass:[XYReceiversDetailModel class]]) {
        [self.rightTextField endEditing:YES];
        XYReceiversDetailModel * dataModel = model;
        NSArray * arr = @[dataModel.spec,dataModel.unit,@"件数",dataModel.price];
        [self.rightTextField  setText:[arr safeObjectAtIndex:indexPath.row]];
        
    }
    
    if ([model isKindOfClass:[XYSenderModel class]]) {//发货
        self.rightTextField.keyboardType = UIKeyboardTypeNumberPad;
        XYSenderModel * dataModel = model;
        switch (indexPath.row) {
            case 0:
            {
                self.rightTextField.keyboardType = UIKeyboardTypeDefault;
                [self.rightTextField  setText:dataModel.spec];
            }
                break;
            case 1:
            {
                /**
                 *  数量无限制
                 */
//                self.isMax = YES;
//                self.maxCount = [dataModel.maxCount integerValue];
                _tfType = pureNumber;
                [self.rightTextField  setText:dataModel.unit];
            }
                break;
            case 2:
            {
                [self.rightTextField  setText:dataModel.price];
            }
                break;
            case 3:
            {
                [self.rightTextField  setText:dataModel.otherprice];
            }
                break;
                
            default:
                break;
        }
    }
    
   
}
@end
