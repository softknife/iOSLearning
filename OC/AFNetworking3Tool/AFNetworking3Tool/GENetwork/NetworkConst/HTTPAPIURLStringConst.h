//
//  HttpAPIMacroDefinition.h
//  RongKeMessenger
//
//  Created by WangGray on 15/5/19.
//  Copyright (c) 2015年 聊天SDK服务供应商. All rights reserved.
//

#import "GEHTTPConst.h"




#pragma mark -  登录注册激活

// 3.3.1.1	register.do (注册)
/** 获取注册类型*/
FOUNDATION_EXTERN NSString * const ge_api_registerType;
/** 注册*/
FOUNDATION_EXTERN NSString * const ge_api_registerDo;

/** 3.3.1.2	login.do(登录)*/
FOUNDATION_EXTERN NSString * const ge_api_loginDo;

/** 3.3.1.3	sendPinCode.do(发短信验证码)*/
FOUNDATION_EXTERN NSString * const ge_api_sendPinCode;

/** 3.3.1.4	upPwdForPhone.do(手机找回密码)*/
FOUNDATION_EXTERN NSString * const ge_api_upPwdForPhone;

/** 3.3.1.5	upPwdForEmail.do(邮箱找回密码)*/
FOUNDATION_EXTERN NSString * const ge_api_upPwdForEmail;

// 3.3.1.6	getCity.do(获取省市县码表)
//#define HTTP_API_GET_CITY   [NSString stringWithFormat:@"%@://%@%@getCity.do", ge_URL_HTTP_TYPE, @"%@", ge_API_SERVER_PATH]

/** 3.3.1.7 getSchoolForCity.do(根据城市获取学校)*/
FOUNDATION_EXTERN NSString * const ge_api_getSchoolForCity;

/** 3.3.1.8	findUserForKey.do(查找用户，根据手机号或账号)*/
FOUNDATION_EXTERN NSString * const ge_api_findUserForKey;

/** 3.3.1.9	findUserForSchool.do(查找用户，根据学校)*/
FOUNDATION_EXTERN NSString * const ge_api_findUserForSchool;

/** 3.3.2.0 checkUpdate.do(检查是否有新版本)*/
FOUNDATION_EXTERN NSString * const ge_api_checkUpdate;


#pragma mark - 个人中心

/** 3.3.2.1	getUserIndex.do(获取个人首页)*/
FOUNDATION_EXTERN NSString * const ge_api_getUserIndex;

/** 3.3.2.2	getUserInfo.do(获取个人信息)*/
FOUNDATION_EXTERN NSString * const ge_api_getUserInfo;

/** 3.3.2.3	modifyUserInfo.do(修改个人信息)*/
FOUNDATION_EXTERN NSString * const ge_api_modifyUserInfo;

/** 3.3.2.4	modifyUserPwd.do(修改用户密码)*/
FOUNDATION_EXTERN NSString * const ge_api_modifyUserPwd;

/** 3.3.2.5	getUserPrivacy.do(获取用户隐私设置)*/
FOUNDATION_EXTERN NSString * const ge_api_getUserPrivacy;

/** 3.3.2.6	setUserPrivacy.do(用户隐私设置)*/
FOUNDATION_EXTERN NSString * const ge_api_setUserPrivacy;

/** 3.3.2.7	bindPhone.do(绑定手机号码)*/
FOUNDATION_EXTERN NSString * const ge_api_bindPhone;

/** 3.3.2.8	bindEmail.do(绑定邮箱)*/
FOUNDATION_EXTERN NSString * const ge_api_bindEmail;

/** 3.3.2.9	feedBack.do(意见反馈)*/
FOUNDATION_EXTERN NSString * const ge_api_feedBack;


/** 3.3.2.11	uploadHeadOrBgimg.do(上传头像。背景)*/
FOUNDATION_EXTERN NSString * const ge_api_uploadHeadOrBgimg;

/** 3.3.2.12	applyOpenSchool.do(申请开通学校)*/
FOUNDATION_EXTERN NSString * const ge_api_applyOpenSchool;

/** 3.3.2.13 achieveUserPrivacy.do*/
FOUNDATION_EXTERN NSString * const ge_api_achieveUserPrivacy;

/** 3.3.2.14 updateUserInfo.do*/
FOUNDATION_EXTERN NSString * const ge_api_updateUserInfo;

/** 3.3.2.15 deleteSubject.do*/
FOUNDATION_EXTERN NSString * const ge_api_deleteSubject;

/** 3.3.2.16 updateParentPhone.do*/
FOUNDATION_EXTERN NSString * const ge_api_updateParentPhone;

#pragma mark - 好友关系

/** 3.3.3.1	applyFriend.do(请求添加好友)*/
FOUNDATION_EXTERN NSString * const ge_api_applyFriend;

/** 3.3.3.2	acceptFriend.do(接受好友申请)*/
FOUNDATION_EXTERN NSString * const ge_api_acceptFriend;

/** 3.3.3.3	updateFriend.do(更新好友信息)*/
FOUNDATION_EXTERN NSString * const ge_api_updateFriend;

/** 3.3.3.4	deleteFriend.do(删除好友)*/
FOUNDATION_EXTERN NSString * const ge_api_deleteFriend;

/** 3.3.3.5	getFriends.do(获取好友列表)*/
FOUNDATION_EXTERN NSString * const ge_api_getFriends;


#pragma mark - 班级管理

/** 3.3.4.1	createClass.do（创建班级）*/
FOUNDATION_EXTERN NSString * const ge_api_createClass;

/** 3.3.4.2	selectClass.do（查询班级)*/
FOUNDATION_EXTERN NSString * const ge_api_selectClass;

/** 3.3.4.3  addClass.do（添加班级）*/
FOUNDATION_EXTERN NSString * const ge_api_addClass;

/** 3.3.4.4  devolveClassPower.do（转移班级权限）*/
FOUNDATION_EXTERN NSString * const ge_api_devolveClassPower;

/** 3.3.4.5  achieveTeacheInfo.do（转让班级查询转让老师）*/
FOUNDATION_EXTERN NSString * const ge_api_achieveTeacheInfo;

/** 3.3.4.6  disbandClass.do（退出/解散班级）*/
FOUNDATION_EXTERN NSString * const ge_api_disbandClass;

/** 3.3.4.7  achieveClassList.do(获取班级成员列表)*/
FOUNDATION_EXTERN NSString * const ge_api_achieveClassMembersList;

/** 3.3.4.8	publishNotice.do (发布班级公告/编辑转发)*/
FOUNDATION_EXTERN NSString * const ge_api_publishNotice;

/** 3.3.4.9	achieveNoticeList.do(获取班级公告)*/
FOUNDATION_EXTERN NSString * const ge_api_achieveNoticeList;

/** 3.3.4.14  achieveNoticeInfo.do(获取作业/通知详情)*/
//FOUNDATION_EXTERN NSString * const ge_api_achieveNoticeInfo = @"achieveNoticeInfo.do";

/** 3.3.4.15	 uploadClassFile.do（上传班级群文件）*/
FOUNDATION_EXTERN NSString * const ge_api_uploadClassFile;

/** 3.3.4.16	 downClassFile.do(下载群文件)*/
FOUNDATION_EXTERN NSString * const ge_api_downClassFile;

/** 3.3.4.17  loadClassFileList.do(获取班级文件列表)*/
FOUNDATION_EXTERN NSString * const ge_api_loadClassFileList;

/** 3.3.4.18	delClassFile.do(删除班级群文件)*/
FOUNDATION_EXTERN NSString * const ge_api_delClassFile;

/** 3.3.4.19	achieveMyClassList.do(获取我的班级列表)*/
FOUNDATION_EXTERN NSString * const ge_api_achieveMyClassList ;

/** 3.3.4.20	achieveGenearchList.do(获取我家长通讯录列表)*/
FOUNDATION_EXTERN NSString * const ge_api_achieveGenearchList ;

/** 3.3.4.21	kickFromClass.do(删除班级成员)*/
FOUNDATION_EXTERN NSString * const ge_api_kickFromClass;

/** 3.3.4.22	updateGradeCode.do(修改班级年级昵称)*/
FOUNDATION_EXTERN NSString * const ge_api_updateClassNickName;

/** 3.4.4.243333333 achieveDistrictData.do(获取行政区划基础数据)*/
FOUNDATION_EXTERN NSString * const ge_api_achieveDistrictData;

/** 创建班级群聊*/
FOUNDATION_EXTERN NSString * const ge_api_createClassGroup;

/** 加入班级群聊*/
FOUNDATION_EXTERN NSString * const ge_api_addClassGroup;

/** 退出班级群聊*/
FOUNDATION_EXTERN NSString * const ge_api_quitClassGroup;

/** 上传班级文件*/
FOUNDATION_EXTERN NSString * const ge_api_uploadSyllabus;

/** 获取备课科目列表*/
FOUNDATION_EXTERN NSString * const ge_api_getLessonSubject;
/** 获取备课列表*/
FOUNDATION_EXTERN NSString * const ge_api_getLessonChapter;
/** 获取备课资源列表*/
FOUNDATION_EXTERN NSString * const ge_api_getLessonResource;
/** 获取班级主页*/
FOUNDATION_EXTERN NSString * const ge_api_getClassIndex;
/** 上传班级头像、背景*/
FOUNDATION_EXTERN NSString * const ge_api_uploadClassLogoOrBg;
/** 班级直播间临时接口 */
FOUNDATION_EXTERN NSString * const ge_api_getRoomInfo;
/** 删除班级公告*/
FOUNDATION_EXTERN NSString * const ge_api_deleteClassNotice;
/** 撤销创建班级*/
FOUNDATION_EXTERN NSString * const ge_api_revokeCreateClass;
/** 重新请求创建班级*/
FOUNDATION_EXTERN NSString * const ge_api_repeatCreateClass;
/** 撤销添加班级*/
FOUNDATION_EXTERN NSString * const ge_api_membersRevokeApplyClass;
/** 重新加入班级*/
FOUNDATION_EXTERN NSString * const ge_api_repeatAddClass;

#pragma mark - 群组会话管理

/** 3.3.5.1	createGroup.do（创建群）*/
FOUNDATION_EXTERN NSString * const ge_api_createGroup ;

/** 3.3.5.2	getGroupInfo.do（搜索群）*/
FOUNDATION_EXTERN NSString * const ge_api_selectGroupInfo;

/** 3.3.5.3 applyGroup.do（主动申请入群/群主同意入群）*/
FOUNDATION_EXTERN NSString * const ge_api_applyGroup;

/** 3.3.5.4	inviteGroup.do（邀请入群）*/
FOUNDATION_EXTERN NSString * const ge_api_inviteGroup;

/** 3.3.5.5	agreeWithGroup.do（同意入群）*/
FOUNDATION_EXTERN NSString * const ge_api_agreeWithGroup;

/** 3.3.5.6	kickFromGroup.do（踢人）*/
FOUNDATION_EXTERN NSString * const ge_api_kickFromGroup;

/** 3.3.5.7	leaveGroup.do（退群、解散群操作）*/
FOUNDATION_EXTERN NSString * const ge_api_leaveGroup;

/** 3.3.5.8 getGroupMemberInfo.do（获取群成员列表）*/
FOUNDATION_EXTERN NSString * const ge_api_getGroupMemberInfo;

/** 3.3.5.9	getGroupInfo.do（获取群详细信息）*/
FOUNDATION_EXTERN NSString * const ge_api_getGroupInfo;

/** 3.3.5.10	operatorGroupAuthority.do(邀请权限开关)*/
FOUNDATION_EXTERN NSString * const ge_api_operatorGroupAuthority;

/** 3.3.5.11	makeOverGroup.do（转让群主）*/
FOUNDATION_EXTERN NSString * const ge_api_makeOverGroup;

/** 3.3.5.12	getMyGroups.do（获取自己所有的群及加入的群列表）*/
FOUNDATION_EXTERN NSString * const ge_api_getMyGroups;

/** 3.3.5.13	updateGroupName.do(修改群名称)*/
FOUNDATION_EXTERN NSString * const ge_api_updateGroupName;

/** 3.3.5.14	agreeAcceptGroup.do(被转让者同意接受群主转让)*/
FOUNDATION_EXTERN NSString * const ge_api_agreeAcceptGroup;

/** 3.3.5.15	uploadGroupLogo.do(上传群头像)*/
FOUNDATION_EXTERN NSString * const ge_api_uploadGroupLogo;


#pragma mark - 通知作业模块的API接口

/** 创建作业和通知需要请求的接口*/   
FOUNDATION_EXTERN NSString * const ge_api_createTask;

/** 创建作业获取科目列表*/
FOUNDATION_EXTERN NSString * const ge_api_achieveSubjectList;

/** 串讲作业和通知上传图片,语音,附件的接口*/
FOUNDATION_EXTERN NSString * const ge_api_uploadClassTaskFile;

/** 添加科目*/
FOUNDATION_EXTERN NSString * const ge_api_addSubject;

/** 获取科目基础信息表*/
FOUNDATION_EXTERN NSString * const ge_api_achieveSubjectData;

/** 获取作业通知列表*/
FOUNDATION_EXTERN NSString * const ge_api_achieveTaskList;

/**  获得三天的作业*/
FOUNDATION_EXTERN NSString * const ge_api_achieveThreeDaysTask;

/**  删除作业/通知*/
FOUNDATION_EXTERN NSString * const ge_api_deleteTask;

/** 获取通知或者作业的详情*/
FOUNDATION_EXTERN NSString * const ge_api_achieveTaskInfo;

/** 学生端接收到作业(已查看)/完成作业  2016.11.24  李文祥 */
FOUNDATION_EXTERN NSString * const ge_api_receiveOrFulfilTask;

/** 老师端催作业  2016.11.27  李文祥 */
FOUNDATION_EXTERN NSString * const ge_api_urgeTask;

/** 获取作业完成状态  2016.11.27  李文祥 */
FOUNDATION_EXTERN NSString * const ge_api_getTaskStatus;

#pragma mark - 随笔模块

/** 3.4.6.1	uploadAttachment.do(上传动态附件)*/
FOUNDATION_EXTERN NSString * const ge_api_uploadAttachment;

/** 3.4.6.2	sendMoment.do(发布随笔/班级圈)*/
FOUNDATION_EXTERN NSString * const ge_api_sendMoment;

/** 3.4.6.3	deleteMoment.do(删除随笔/班级圈)*/
FOUNDATION_EXTERN NSString * const ge_api_deleteMoment;

/** 3.4.6.4	sendComent.do(发布评论)*/
FOUNDATION_EXTERN NSString * const ge_api_sendComment;

/** 3.4.6.5	deleteComent.do(删除评论)*/
FOUNDATION_EXTERN NSString * const ge_api_deleteComment;

/** 3.4.6.6	setLike.do(点赞/取消赞)*/
FOUNDATION_EXTERN NSString * const ge_api_setLike;

/** 3.4.6.7	getMomentList.do（获取好友动态列表）*/
FOUNDATION_EXTERN NSString * const ge_api_getMomentList;

/** 3.4.6.8  getSelfMomentList.do（获取自己动态列表）*/
FOUNDATION_EXTERN NSString * const ge_api_getSelfMomentList;

/** 3.4.6.9	getMomentDetail.do（获取动态详情）*/
FOUNDATION_EXTERN NSString * const ge_api_getMomentDetail;

/** 3.4.6.10	getCommentList.do（获取评论列表）*/
FOUNDATION_EXTERN NSString * const ge_api_getCommentList;

/** 3.4.6.11	getForwardUserInfo.do(获取转发用户信息)*/
FOUNDATION_EXTERN NSString * const ge_api_getForwardUserInfo;

/** 3.4.6.12	uploadClientLog.do(crash日志上传)*/
FOUNDATION_EXTERN NSString * const ge_api_uploadClientLog;

/** 3.4.6.13	getPublicKey.do(获取公钥)*/
FOUNDATION_EXTERN NSString * const ge_api_getPublicKey;

/** 3.4.6.14	openLoginDo.do(授权登录)*/
FOUNDATION_EXTERN NSString * const ge_api_openLoginDo;

/** 3.4.6.15	iosUpdate.do(热加载)*/
FOUNDATION_EXTERN NSString * const ge_api_iosUpdate;

/** 3.4.6.16    getScoreDetail.do(个人积分明细)*/
FOUNDATION_EXTERN NSString * const ge_api_getScoreDetail;

/** 3.4.6.17    getLevelClass.do(获取当前用户等级头衔基础数据)*/
FOUNDATION_EXTERN NSString * const ge_api_getLevelClass;

/** 3.4.6.18    setLevelClass.do(获取当前用户等级头衔基础数据)*/
FOUNDATION_EXTERN NSString * const ge_api_setLevelClass;

/** 3.4.6.19    completePhotoQueue.do(上传完一组图片后,发送随笔)*/
FOUNDATION_EXTERN NSString * const ge_api_completePhotoQueue;

/** 3.4.6.20    quickLogin.do*/
FOUNDATION_EXTERN NSString * const ge_api_quickLogin;
/** 3.4.6.21    unbindQuickLogin.do*/
FOUNDATION_EXTERN NSString * const ge_api_unbindQuickLogin;
#pragma mark - 发现 － 应用
/** 获取应用列表 */
FOUNDATION_EXTERN NSString * const ge_api_appList;

/** 应用详情 */
FOUNDATION_EXTERN NSString *const ge_api_appInfo;

/** 添加应用 */
FOUNDATION_EXTERN NSString *const ge_api_appAdd;

/** 删除应用 */
FOUNDATION_EXTERN NSString *const ge_api_appDelete;

/** 获取我的应用列表 */
FOUNDATION_EXTERN NSString * const ge_api_myAppList;

/** 获取应用状态 */
FOUNDATION_EXTERN NSString * const ge_api_getAppState;


#pragma  mark - 扫描登录

/** 获得班级/群/个人二维码 发起请求 */
FOUNDATION_EXTERN NSString * const ge_api_getQrCode;

/** 扫出二维码 发起请求 */
FOUNDATION_EXTERN NSString * const ge_api_scanQRcode;

/** 确认登录接口 */
FOUNDATION_EXTERN NSString * const ge_api_confirmLogin;

/** 取消登录接口 */
FOUNDATION_EXTERN NSString * const ge_api_quitLogin;




/** 获取班级/群/个人二维码URL请求参数 */
//FOUNDATION_EXTERN NSString * const ge_api_getQr;
/** 二维码扫描请求参数AuthKey */
FOUNDATION_EXTERN NSString * const ge_api_AuthKey;/** 二维码扫描请求参数AuthKey */
/** 二维码扫描请求参数SecretKey */
FOUNDATION_EXTERN NSString * const ge_api_SecretKey;
/** 二维码扫描请求参数userId */
FOUNDATION_EXTERN NSString * const ge_api_userId;

/** 二维码扫描登录AES加密公钥 */
FOUNDATION_EXTERN NSString * const ge_api_encryPublicKey;

/** 获取广告*/
FOUNDATION_EXTERN NSString *const ge_api_getAdvert;



#pragma mark - 相册模块接口

FOUNDATION_EXTERN NSString *const ge_api_getPhotoAlbum;
FOUNDATION_EXTERN NSString *const ge_api_createPhotoAlbum;
FOUNDATION_EXTERN NSString *const ge_api_getPhotoList;
FOUNDATION_EXTERN NSString *const ge_api_editPhotoAlbum;


FOUNDATION_EXTERN NSString *const ge_api_photoScore;
FOUNDATION_EXTERN NSString *const ge_api_uploadPhoto;


FOUNDATION_EXTERN NSString *const ge_api_getPhotoComment;
FOUNDATION_EXTERN NSString *const ge_api_deletePhotoOrAlbum;
FOUNDATION_EXTERN NSString *const ge_api_photoSetLike;
FOUNDATION_EXTERN NSString *const ge_api_sendPhotoComment;
FOUNDATION_EXTERN NSString *const ge_api_deletePhotoComment;
FOUNDATION_EXTERN NSString *const ge_api_removePhoto;

FOUNDATION_EXTERN NSString *const ge_api_editPhoto;
FOUNDATION_EXTERN NSString *const ge_api_getPhotoListByPhoto;




#pragma  mark - 配置静态页面路径和扫描路径

/** 二维码扫描登录BaseURL */
FOUNDATION_STATIC_INLINE NSString * httpAPIScanLoginBaseUrlString()
{
    return [NSString stringWithFormat:@"%@://%@", geURLHttp, ge_server_path(geServerPathBrowser)];
}


/** 用户协议*/
FOUNDATION_STATIC_INLINE NSString *httpAPIUserProtocol(){
    
    return [NSString stringWithFormat:@"%@://%@%@", httpOrHttps(), ge_server_path(geServerPathMobile), @"/pages/userAgreement.html"];
    
}

/** 积分规则*/
FOUNDATION_STATIC_INLINE NSString *httpAPIIntegralRule(){
    
    return  [NSString stringWithFormat:@"%@://%@%@",httpOrHttps(),ge_server_path(geServerPathMobile),@"/pages/scorerule.html"];
}

/**分享优e学堂的额地址*/
FOUNDATION_STATIC_INLINE NSString *httpAPIShareApp(){

    return [NSString stringWithFormat:@"%@://%@",httpOrHttps(),ge_server_path(geServerPathMobile)];
};

