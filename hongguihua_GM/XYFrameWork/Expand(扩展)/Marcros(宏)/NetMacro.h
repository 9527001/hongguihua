//
//  NetMacro.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/5/3.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#ifndef                        NetMacro_h
#define                        NetMacro_h

#define i_login                @"login"               //1.	登录接口
#define i_logout               @"logout"              //2.    退出登录接口
#define i_changeuserinfo       @"changeuserinfo"      //3.修改用户头像登陆账号接口

#define i_brand                @"brand"               //4.1首页轮播图
#define i_productinfo          @"productinfo"         //4.采购员添加商品页信息
#define i_productadd           @"productadd"          //5.采购人员添加商品

#define i_productlist          @"productlist"         //6.采购员商品列表
#define i_productpic           @"productpic"          //7.具体商品图片

#define i_reimburse            @"reimburse"           //8.添加报销
#define i_travel               @"travel"              //9.添加出差
#define i_leave                @"leave"               //10.添加请假
#define i_goout                @"goout"               //11.添加外出
#define i_positive             @"positive"            //12.添加转正

#define i_myreimburse          @"myreimburse"         //13.我的报销
#define i_myreimbursedetail    @"myreimbursedetail"   //14.我的报销详情
#define i_mytravel             @"mytravel"            //15.我的出差
#define i_mytraveldetail       @"mytraveldetail"      //16.我的出差详情
#define i_myleave              @"myleave"             //17.我的请假
#define i_myleavedetail        @"myleavedetail"       //18.我的请假详情
#define i_mygoout              @"mygoout"             //19.我的外出
#define i_mygooutdetail        @"mygooutdetail"       //20.我的外出详情
#define i_mypositive           @"mypositive"          //21.我的转正
#define i_mypositivedetail     @"mypositivedetail"    //22.我的转正详情

#define i_directory            @"directory"           //23.通讯录
#define i_message              @"message"             //24.消息

#define i_checklist            @"checklist"           //26.高管审核列表
#define i_checkdetail          @"checkdetail"         //28.审核是否通过
#define i_check                @"check"               //27.审核列表详情

#define i_sendgoodslist        @"sendgoodslist"       //29.发货列表
#define i_sendgoodsinfo        @"sendgoodsinfo"       //30.分装发货的等级

#define i_sendgoods            @"sendgoods"           //31.分装发货

#define i_getgoodslist         @"getgoodslist"        //32.收货人收货列表
#define i_getgoodsdetail       @"getgoodsdetail"      //33.收货人收货详情
#define i_getgoods             @"getgoods"            //34.收货人

#define i_sellgoodslist        @"sellgoodslist"       //35.第三人 发货商品列表
#define i_sellgoods            @"sellgoods"           //36.出售

#define i_productmessagelist   @"productmessagelist"  //37.审核消息列表
#define i_productmessagedetail @"productmessagedetail"//38.审核消息详情

#define i_profitlist           @"profitlist"          //39.商品利润列表
#define i_sendproductpic       @"sendproductpic"      //40.发货人上传的图片
#define i_uploaduserpic        @"uploaduserpic"       // 41头像上传
#define i_specification         @"specification"       // 42使用说明
#define i_selllist @"selllist" //43 销售列表

#define i_tsendgoodsinfolist        @"tsendgoodsinfolist"       // 44发货消息列表
#define i_tsendgoodsinfodetail        @"tsendgoodsinfodetail"       // 45发货消息详情
#define i_tgetgoodsinfolist         @"tgetgoodsinfolist"       // 46收货消息列表
#define i_tgetgoodsinfodetail         @"tgetgoodsinfodetail"       // 47收货消息详情

#define i_ismessage         @"ismessage"       // 50判断是否有未读消息


//1. 分装发货页面数据
#define i_get_ship_all_info        @"get_ship_all_info"
//2. 分装发货确认发货
#define i_addShipInfo        @"addShipInfo"
//3. 分装发货确认发货
#define i_update_shipment_status        @"update_shipment_status" 
//4. 收货列表
#define i_get_shipment_list        @"get_shipment_list"
//5. 根据id获取收货详情
#define i_get_shipment_byid        @"get_shipment_byid"

//6. 获取商品列表
#define i_get_product_list        @"get_product_list"
//7. 收货列表
#define i_get_shipment_carnum_list        @"get_shipment_carnum_list"
//8. 出售商品
#define i_buy_shipment_product        @"buy_shipment_product"
//9. 发货列表
#define i_get_shipment_list_fh        @"get_shipment_list_fh"
//10. 销售列表
#define i_get_sell_list        @"get_sell_list"
//11. 收发货消息列表
#define i_my_receipt_message        @"my_receipt_message"
//12. 收发货消息详情
#define i_my_receipt_message_byid        @"my_receipt_message_byid"




#endif /* NetMacro_h */
