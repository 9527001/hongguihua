//
//  URLMarcro.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#ifndef URLMacro_h
#define URLMacro_h

/*********************************************************
 *
 *  自定义宏区域
 *
 *********************************************************/
#define __FINALSERVER__
#ifdef __FINALSERVER__

//http://app.gxnnhgh.com/ 客户正式域名


#define ImageUrl  @"http://app.gxnnhgh.com/"//
#define ServerURL [NSString stringWithFormat:@"%@/service/",ImageUrl]
#define ImageURL(x) [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@ImageUrl,x]] //图片地址
//正式服务器


//#define ServerURL @"http://hgh.ceol8.com/service/"//
//#define ImageUrl  @"http://hgh.ceol8.com"//
// #define ImageURL(x) [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://shop.ceol8.com/",x]] //图片地址
#define ImageStr(x) [x hasPrefix:@"http:"] ? x :[NSString stringWithFormat:@"%@%@",ImageUrl,x]

#else
//测试服务器
#define ServerURL @"http://test-sdh.saodianhou.com/"
 #define ImageURL @"http://sdhimg.image.alimmdn.com/"
#endif


//测试图片地址
#define T_ImageURL XY_URLWithString(@"http://www.sd.xinhuanet.com/news/2014-07/05/1111470526_14045244509541n.jpg")
#define T_ImageString @"timage"
#define T_Text @"测试数据"


#define PLACEHOLDERDEFAULTICONIMAGE [UIImage imageNamed:@"LOGO"]


/*********************************************************
 *
 *  常用宏区域（固定）
 *
 *********************************************************/
#define XY_URLWithString(x) [NSURL URLWithString:x]

#endif /* URLMacro_h */
