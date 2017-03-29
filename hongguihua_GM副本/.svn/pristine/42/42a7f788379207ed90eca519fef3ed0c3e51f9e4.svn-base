//
//  UIMacro.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#ifndef UIMacro_h
#define UIMacro_h


/*********************************************************
 *
 *  自定义宏区域
 *
 *********************************************************/
/**
 *  颜色
 */
#define COLOR_MAIN      XY_HEX_RGB(0xf9f9f9)//背景灰色
#define COLOR_TableLine XY_HEX_RGB(0xdedede)//分割线为“1PX” 色值为 #dedede
#define COLOR_GRAY_1    XY_HEX_RGB(0x333333)//字体颜色：主字体
#define COLOR_GRAY_2    XY_HEX_RGB(0x666666)//二级字体
#define COLOR_GRAY_3    XY_HEX_RGB(0xaaaaaa)//三级字体
#define COLOR_GREEN     XY_HEX_RGB(0x008842)
#define COLOR_BLACK     XY_HEX_RGB(0x666666)
#define COLOR_YELLOW    XY_HEX_RGB(0xf5964d)//黄色按钮
#define COLOR_RED       XY_HEX_RGB(0xff2828)//红色主色调色值
#define COLOR_BLUE      XY_HEX_RGB(0x2d97ff)//蓝色字体
#define COLOR_WHITE     XY_HEX_RGB(0xFFFFFF)//白色字体
#define COLOR_LIST_BG     XY_HEX_RGB(0xEAEAEA)//
#define COLOR_SEPERATORLINE     XY_HEX_RGB(0xE9E9E9)//


/**
 *  字体大小
 */
#define FONT_TITLE        [UIFont systemFontOfSize:18.f]//一级字体大小 “36PX”（导航栏字体统一“36px”苹方中等)
#define FONT_TITLE_RIGHT  [UIFont systemFontOfSize:15.f]//二级字体大小“30PX” （导航栏两侧字体统一“30px”苹方常规)
#define FONT_TITLE_MAIN   [UIFont systemFontOfSize:14.f]//二级字体大小“30PX” （导航栏两侧字体统一“30px”苹方常规)
#define FONT_TABBARTITLE  [UIFont systemFontOfSize:13.f]//小字体为 “24PX”
#define FONT_MIN          [UIFont systemFontOfSize:11.f]//最小字体不得低于“22PX”（TAB栏字体以及一些脚注）

/**
 *  布局
 */
#define H_TABBAR                 49
#define H_NAVIGATIONBAR          64
#define H_LISTITEMWIDTH          70.f//商品列表的每个区间的宽度
#define H_SUBMITCELLHEIGHT       40.f//提交cell的高度
#define H_TABLECELLDEFAULTHEIGHT 40.f//cell的高度


#define CURRENTWINDOW           [UIApplication sharedApplication].keyWindow
#define SELFVIEW                self.view


#define MTOKEN                  @"token"
#define MID                     @"id"
#define MCID                    @"cid"
#define MTYPE                   @"type"
#define MPAGENUMBER             @"pageNumber"
#define MPAGESIZE               @"page_size"
#define m_pagesize              @"10"
#define m_pagenumber            [NSString stringWithFormat:@"%zd",self.mPageNumber]
#define m_pagenumberDefault     @"1"

#define m_userModel             [XYCenter sharedInstance].userModel
#define m_token                 xy_obj([[XYCenter sharedInstance].userModel token]) 
#define m_loginname             xy_obj([[[XYCenter sharedInstance] userModel] loginname])
#define m_xyid                  xy_obj([[[XYCenter sharedInstance] userModel] xyid])
#define m_user_pic              xy_obj([[[XYCenter sharedInstance] userModel] user_pic])
#define m_cid                   xy_obj([[[XYCenter sharedInstance] userModel] cid])



/*********************************************************
 *
 *  常用宏区域（固定）
 *
 *********************************************************/
/*  获取自适应高度 */
#define XY_AutoHeight(x) ((x) * (1.0) / (568) * (XY_M_SCREEN_H))
//#define XY_AutoHeight(x) (x*(XY_M_SCREEN_W)/320)
/*  获取自适应宽度 */
#define XY_AutoWidth(x) ((x) * (1.0) / (320) * (XY_M_SCREEN_W))
//#define XY_AutoWidth(x) (x*(XY_M_SCREEN_H)/568)

/** 字体大小 */
#define XY_FONT(NAME,FONTSIZE) [UIFont fontWithName:(NAME) size:(FONTSIZE)]
#define XY_S_FONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define XY_S_BOLD_FONT(FONTSIZE)   [UIFont boldSystemFontOfSize:FONTSIZE]


/** 颜色(RGB) */
#define XY_RGB(r,g,b)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1];
#define XY_RGBA(r,g,b,a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

/** 颜色(0xFFFFFF) */
#define XY_HEX_RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define XY_HEX_RGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]


/** 资源路径 */
#define XY_PNG_PATH(NAME) [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define XY_JPG_PATH(NAME) [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define XY_PATH(NAME,EXT) [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

/** 加载图片 */
#define XY_PNG_IMAGE_FILE(NAME)         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define XY_JPG_IMAGE_FILE(NAME)         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define XY_IMAGE_FILE(NAME,EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]
#define XY_IMAGE_NAMED(NAME)       [UIImage imageNamed:NAME]


#endif /* UIMacro_h */
