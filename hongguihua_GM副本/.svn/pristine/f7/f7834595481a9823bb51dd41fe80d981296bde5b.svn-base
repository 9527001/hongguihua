用法说明
EasyiOS
------------监听网络变化------------
EasyKit.h

------------MBProgress封装------------
DialogUtil.h

------------检查设备和版本号------------
EzSystemInfo.h

------------图片压缩、保存、文件删除------------
ImageTool.h

------------系统工具------------
//发送邮件//打电话//发短信//Safari打开URL//计算字符个数//屏幕截图，并保存到相册//获取文件夹大小//sha256加密
SysTool.h

------------时间工具------------
TimeTool.h


/**
*  网路请求Demo
*
*  @param modelType 需要转化的Model类型
*  @param path      请求路径(写在NetMacro.h中)
*  @param success   成功返回Model
*  @param failure   失败回调
*/
- (void)xy_getWithModelType:(Class)modelType
Path:(NSString *)path
Success:(XYRequestCompletionBlock)success
failure:(XYRequestFailureBlock)failure;

例1:返回一个Model单个实例
[@{@"model":@"index"} xy_getWithModelType:[SBZHomeModel class] Path:m_index Success:^(__kindof YTKBaseRequest *request, id model) {
self.homeModel = model;
} failure:^(NSString *msg, id model) {

}];

------------注意事项------------
1、取字典(不能用dic[@"key"])
    [dic xy_objectForKey:@"key"]
2、取数组(不能用arr[index])
    [arr safeObjectAtIndex:index];
3、字符串比较(字符串常量必须放前)
    [@"" isEqualToString:str]
4、防止对象为nil崩溃
例1: xxx = user.name
改为 xxx = xy_obj(user.name)
例2：请求参数
[@{@"token":xy_obj(m_userModel.token)} xy_getWithModelType:nil Path:m_logout Success:^(__kindof YTKBaseRequest *request, id model) {

} failure:^(NSString *msg, id model) {

}];
5
------------上拉下拉刷新------------
self.mTableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
[
@{@"token":m_userModel.token,
@"page":self.pagination.page,
@"pageSize":self.pagination.pageSize
} xy_safepostWithModelType:[SXKillListModel class] Path:m_buyGoodsOrderPageList hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
[self pageAdd];
[self.pagination success:self.mData newArray:model];
} failure:^(NSString *msg, id model) {

}];
}];


self.mTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
[self pageClean];
[
@{@"token":m_userModel.token,
@"page":self.pagination.page,
@"pageSize":self.pagination.pageSize
} xy_safepostWithModelType:[SXKillListModel class] Path:m_buyGoodsOrderPageList hud:nil Success:^(__kindof YTKBaseRequest *request, id model) {
[self.pagination success:self.mData newArray:model];
} failure:^(NSString *msg, id model) {

}
];
}];