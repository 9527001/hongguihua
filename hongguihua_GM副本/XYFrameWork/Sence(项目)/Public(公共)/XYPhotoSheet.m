//
//  XYPhotoSheet.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/9.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYPhotoSheet.h"

@interface XYPhotoSheet()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, copy) XYBlock success;
@property (nonatomic, strong) UIImagePickerController *pickerC;

@end

@implementation XYPhotoSheet

- (void)xy_showActionSheetInView:(UIView *)view taget:(UIViewController *)controller title1:(NSString *)title1 title2:(NSString *)title2 cancel:(NSString *)cancel success:(XYBlock)success
{
   
    _success = success;
    _pickerC = [[UIImagePickerController alloc]init];
    _pickerC.delegate = self;
    _pickerC.allowsEditing=YES;
    _pickerC.videoQuality=UIImagePickerControllerQualityType640x480;
    
  
    UIActionSheet *sheet = [UIActionSheet bk_actionSheetWithTitle:nil];
  
    [sheet bk_addButtonWithTitle:@"本地上传" handler:^{
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=8.0) {
                
                controller.modalPresentationStyle=UIModalPresentationCurrentContext;
                
                _pickerC.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                
                controller.modalPresentationStyle = UIModalPresentationOverCurrentContext;
                [controller presentViewController:_pickerC animated:YES completion:nil];
            }
            else
            {
                _pickerC.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                [controller presentViewController:_pickerC animated:YES completion:nil];
                
            }
            
        }
        else{
            
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"无法访问相册" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alertView show];
        }
        
    }];
    
    [sheet bk_addButtonWithTitle:@"拍照上传" handler:^{
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera ])
        {
            
            _pickerC.sourceType=UIImagePickerControllerSourceTypeCamera;
            
            controller.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            [controller presentViewController:_pickerC animated:YES completion:nil];
        }
        
        else
        {
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"你的设备不支持拍照" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }];
    
    [sheet bk_addButtonWithTitle:@"取消" handler:^{
        
    }];
    
    
    [sheet showInView:view];
}


#pragma UIImagePickerControllerDelegate协议实现
//选择照片后执行的方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //获取的图片
        UIImage *editImage=[info objectForKey:UIImagePickerControllerOriginalImage];
        
        NSData *imageData=UIImageJPEGRepresentation(editImage, 0.7);
        //        创建一个本地路径
        NSString *imagePath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject]stringByAppendingString:@"icon.jpg"];
        //        将DAta数据写入本地路径imagePath
        [imageData writeToFile:imagePath atomically:YES];
        
        if (self.success) {
            self.success([editImage imageByScalingAndCroppingToSize:CGSizeMake(80, 80)]);
        }

    });
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
