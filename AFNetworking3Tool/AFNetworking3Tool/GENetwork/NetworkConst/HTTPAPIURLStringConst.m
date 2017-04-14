//
//  HTTPAPIURLStringConst.m
//  ExcellentLearning
//
//  Created by hjp on 16/11/7.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEHTTPConst.h"

#pragma mark -  登录注册激活

// 3.3.1.1	register.do (注册)
/** 获取注册类型*/
NSString * const ge_api_registerType = @"registerType.do";
/** 注册*/
NSString * const ge_api_registerDo = @"register.do";

/** 3.3.1.2	login.do(登录)*/
NSString * const ge_api_loginDo = @"login.do";

/** 3.3.1.3	sendPinCode.do(发短信验证码)*/
NSString * const ge_api_sendPinCode = @"sendPinCode.do";

/** 3.3.1.4	upPwdForPhone.do(手机找回密码)*/
NSString * const ge_api_upPwdForPhone = @"upPwdForPhone.do";

/** 3.3.1.5	upPwdForEmail.do(邮箱找回密码)*/
NSString * const ge_api_upPwdForEmail = @"upPwdForEmail.do";

// 3.3.1.6	getCity.do(获取省市县码表)
//#define HTTP_API_GET_CITY   [NSString stringWithFormat:@"%@://%@%@getCity.do", ge_URL_HTTP_TYPE, @"%@", ge_API_SERVER_PATH]

/** 3.3.1.7 getSchoolForCity.do(根据城市获取学校)*/
NSString * const ge_api_getSchoolForCity = @"getSchoolForCity.do";

/** 3.3.1.8	findUserForKey.do(查找用户，根据手机号或账号)*/
NSString * const ge_api_findUserForKey = @"findUserForKey.do";

/** 3.3.1.9	findUserForSchool.do(查找用户，根据学校)*/
NSString * const ge_api_findUserForSchool = @"findUserForSchool.do";

/** 3.3.2.0 checkUpdate.do(检查是否有新版本)*/
NSString * const ge_api_checkUpdate = @"checkUpdate.do";


#pragma mark - 个人中心

/** 3.3.2.1	getUserIndex.do(获取个人首页)*/
NSString * const ge_api_getUserIndex = @"getUserIndex.do";

/** 3.3.2.2	getUserInfo.do(获取个人信息)*/
NSString * const ge_api_getUserInfo = @"getUserInfo.do";

/** 3.3.2.3	modifyUserInfo.do(修改个人信息)*/
NSString * const ge_api_modifyUserInfo = @"modifyUserInfo.do";

/** 3.3.2.4	modifyUserPwd.do(修改用户密码)*/
NSString * const ge_api_modifyUserPwd = @"modifyUserPwd.do";

/** 3.3.2.5	getUserPrivacy.do(获取用户隐私设置)*/
NSString * const ge_api_getUserPrivacy = @"getUserPrivacy.do";

/** 3.3.2.6	setUserPrivacy.do(用户隐私设置)*/
NSString * const ge_api_setUserPrivacy = @"setUserPrivacy.do";

/** 3.3.2.7	bindPhone.do(绑定手机号码)*/
NSString * const ge_api_bindPhone = @"bindPhone.do";

/** 3.3.2.8	bindEmail.do(绑定邮箱)*/
NSString * const ge_api_bindEmail = @"bindEmail.do";

/** 3.3.2.9	feedBack.do(意见反馈)*/
NSString * const ge_api_feedBack = @"feedBack.do";

/** 3.3.2.11	uploadHeadimgOrBg.do(上传头像.背景)*/
NSString * const ge_api_uploadHeadOrBgimg = @"uploadHeadimgOrBg.do";

/** 3.3.2.12	applyOpenSchool.do(申请开通学校)*/
NSString * const ge_api_applyOpenSchool = @"applyOpenSchool.do";

/** 3.3.2.13 achieveUserPrivacy.do*/
NSString * const ge_api_achieveUserPrivacy = @"achieveUserPrivacy.do";

/** 3.3.2.14 updateUserInfo.do*/
NSString * const ge_api_updateUserInfo = @"updateUserInfo.do";

/** 3.3.2.15 deleteSubject.do*/
NSString * const ge_api_deleteSubject = @"deleteSubject.do";

/** 3.3.2.16 updateParentPhone.do*/
NSString * const ge_api_updateParentPhone = @"updateParentPhone.do";

#pragma mark - 好友关系

/** 3.3.3.1	applyFriend.do(请求添加好友)*/
NSString * const ge_api_applyFriend = @"applyFriend.do";

/** 3.3.3.2	acceptFriend.do(接受好友申请)*/
NSString * const ge_api_acceptFriend = @"acceptFriend.do";

/** 3.3.3.3	updateFriend.do(更新好友信息)*/
NSString * const ge_api_updateFriend = @"updateFriend.do";

/** 3.3.3.4	deleteFriend.do(删除好友)*/
NSString * const ge_api_deleteFriend = @"deleteFriend.do";

/** 3.3.3.5	getFriends.do(获取好友列表)*/
NSString * const ge_api_getFriends = @"getFriends.do";


#pragma mark - 班级管理

/** 3.3.4.1	createClass.do（创建班级）*/
NSString * const ge_api_createClass = @"createClass.do";

/** 3.3.4.2	selectClass.do（查询班级)*/
NSString * const ge_api_selectClass = @"selectClass.do";

/** 3.3.4.3  addClass.do（添加班级）*/
NSString * const ge_api_addClass = @"addClass.do";

/** 3.3.4.4  devolveClassPower.do（转移班级权限）*/
NSString * const ge_api_devolveClassPower = @"devolveClassPower.do";

/** 3.3.4.5  achieveTeacheInfo.do（转让班级查询转让老师）*/
NSString * const ge_api_achieveTeacheInfo = @"achieveTeacheInfo.do";

/** 3.3.4.6  disbandClass.do（退出/解散班级）*/
NSString * const ge_api_disbandClass = @"disbandClass.do";

/** 3.3.4.7  achieveClassList.do(获取班级成员列表)*/
NSString * const ge_api_achieveClassMembersList = @"achieveClassMembersList.do";

/** 3.3.4.8	publishNotice.do (发布班级公告/编辑转发)*/
NSString * const ge_api_publishNotice = @"publishNotice.do";

/** 3.3.4.9	achieveNoticeList.do(获取班级公告)*/
NSString * const ge_api_achieveNoticeList = @"achieveNoticeList.do";

/** 3.3.4.14  achieveNoticeInfo.do(获取作业/通知详情)*/
// NSString * const ge_api_achieveNoticeInfo = @"achieveNoticeInfo.do";

/** 3.3.4.15	 uploadClassFile.do（上传班级群文件）*/
NSString * const ge_api_uploadClassFile = @"uploadClassFile.do";

/** 3.3.4.16	 downClassFile.do(下载群文件)*/
NSString * const ge_api_downClassFile = @"downClassFile.do";

/** 3.3.4.17  loadClassFileList.do(获取班级文件列表)*/
NSString * const ge_api_loadClassFileList = @"loadClassFileList.do";

/** 3.3.4.18	delClassFile.do(删除班级群文件)*/
NSString * const ge_api_delClassFile = @"delClassFile.do";

/** 3.3.4.19	achieveMyClassList.do(获取我的班级列表)*/
NSString * const ge_api_achieveMyClassList = @"achieveMyClassList.do";

/** 3.3.4.20	achieveGenearchList.do(获取我家长通讯录列表)*/
NSString * const ge_api_achieveGenearchList = @"achieveGenearchList.do";

/** 3.3.4.21	kickFromClass.do(删除班级成员)*/
NSString * const ge_api_kickFromClass = @"kickFromClass.do";

/** 3.3.4.22	updateGradeCode.do(修改班级年级昵称)*/
NSString * const ge_api_updateClassNickName = @"updateClassNickName.do";

/** 3.4.4.243333333 achieveDistrictData.do(获取行政区划基础数据)*/
NSString * const ge_api_achieveDistrictData = @"achieveDistrictData.do";

/** 创建班级群聊*/
NSString * const ge_api_createClassGroup = @"createClassGroup.do";

/** 加入班级群聊*/
NSString * const ge_api_addClassGroup = @"addClassGroup.do";

/** 退出班级群聊*/
NSString * const ge_api_quitClassGroup = @"quitClassGroup.do";

/** 上传班级文件*/
NSString * const ge_api_uploadSyllabus = @"uploadTimeTable.do";

/** 获取备课科目列表*/
NSString * const ge_api_getLessonSubject = @"getLessonSubject.do";
/** 获取备课科目列表*/
NSString * const ge_api_getLessonChapter = @"getLessonChapter.do";
/** 获取备课资源列表*/
NSString * const ge_api_getLessonResource = @"getLessonResource.do";
/** 获取班级主页*/
NSString * const ge_api_getClassIndex = @"getClassIndex.do";
/** 上传班级头像、班级背景*/
NSString * const ge_api_uploadClassLogoOrBg = @"uploadClassLogoOrBg.do";
/** 班级直播间临时接口 */
NSString * const ge_api_getRoomInfo = @"getRoomInfo.do";
/** 删除班级公告*/
NSString * const ge_api_deleteClassNotice = @"deleteClassNotice.do";
/** 撤销创建班级*/
NSString * const ge_api_revokeCreateClass = @"revokeCreateClass.do";
/** 重新请求创建班级*/
NSString * const ge_api_repeatCreateClass = @"repeatCreateClass.do";
/** 撤销加入班级*/
NSString * const ge_api_membersRevokeApplyClass = @"membersRevokeApply.do";
/** 重新加入班级*/
NSString * const ge_api_repeatAddClass = @"repeatAddClass.do";

#pragma mark - 群组会话管理

/** 3.3.5.1	createGroup.do（创建群）*/
NSString * const ge_api_createGroup = @"createGroup.do";

/** 3.3.5.2	getGroupInfo.do（搜索群）*/
NSString * const ge_api_selectGroupInfo = @"selectGroupInfo.do";

/** 3.3.5.3 applyGroup.do（主动申请入群/群主同意入群）*/
NSString * const ge_api_applyGroup = @"applyGroup.do";

/** 3.3.5.4	inviteGroup.do（邀请入群）*/
NSString * const ge_api_inviteGroup = @"inviteGroup.do";

/** 3.3.5.5	agreeWithGroup.do（同意入群）*/
NSString * const ge_api_agreeWithGroup = @"agreeWithGroup.do";

/** 3.3.5.6	kickFromGroup.do（踢人）*/
NSString * const ge_api_kickFromGroup = @"kickFromGroup.do";

/** 3.3.5.7	leaveGroup.do（退群、解散群操作）*/
NSString * const ge_api_leaveGroup = @"leaveGroup.do";

/** 3.3.5.8 getGroupMemberInfo.do（获取群成员列表）*/
NSString * const ge_api_getGroupMemberInfo = @"getGroupMemberInfo.do";

/** 3.3.5.9	getGroupInfo.do（获取群详细信息）*/
NSString * const ge_api_getGroupInfo = @"getGroupInfo.do";

/** 3.3.5.10	operatorGroupAuthority.do(邀请权限开关)*/
NSString * const ge_api_operatorGroupAuthority = @"operatorGroupAuthority.do";

/** 3.3.5.11	makeOverGroup.do（转让群主）*/
NSString * const ge_api_makeOverGroup = @"makeOverGroup.do";

/** 3.3.5.12	getMyGroups.do（获取自己所有的群及加入的群列表）*/
NSString * const ge_api_getMyGroups = @"getMyGroups.do";

/** 3.3.5.13	updateGroupName.do(修改群名称)*/
NSString * const ge_api_updateGroupName = @"updateGroupName.do";

/** 3.3.5.14	agreeAcceptGroup.do(被转让者同意接受群主转让)*/
NSString * const ge_api_agreeAcceptGroup = @"agreeAcceptGroup.do";

/** 3.3.5.15	uploadGroupLogo.do(上传群头像)*/
NSString * const ge_api_uploadGroupLogo = @"uploadGroupLogo.do";


#pragma mark - 通知作业模块的API接口

/** 创建作业和通知需要请求的接口*/
NSString * const ge_api_createTask = @"createTask.do";

/** 创建作业获取科目列表*/
NSString * const ge_api_achieveSubjectList = @"achieveSubjectList.do";

/** 串讲作业和通知上传图片,语音,附件的接口*/
NSString * const ge_api_uploadClassTaskFile = @"uploadClassTaskFile.do";

/** 添加科目*/
NSString * const ge_api_addSubject = @"addSubject.do";

/** 获取科目基础信息表*/
NSString * const ge_api_achieveSubjectData = @"achieveSubjectData.do";

/** 获取作业通知列表*/
NSString * const ge_api_achieveTaskList = @"achieveTaskList.do";

/**  获得三天的作业*/
NSString * const ge_api_achieveThreeDaysTask = @"achieveThreeDaysTask.do";

/**  删除作业/通知*/
NSString * const ge_api_deleteTask = @"deleteTask.do";

/** 获取通知或者作业的详情*/
NSString * const ge_api_achieveTaskInfo = @"achieveTaskInfo.do";

/** 学生端接收到作业(已查看)/完成作业  2016.11.24  李文祥 */
NSString * const ge_api_receiveOrFulfilTask = @"receiveOrFulfilTask.do";

/** 老师端催作业  2016.11.27  李文祥 */
NSString * const ge_api_urgeTask = @"urgeTask.do";

/** 获取作业完成状态  2016.11.27  李文祥 */
NSString * const ge_api_getTaskStatus = @"getTaskStatus.do";

#pragma mark - 随笔模块

/** 3.4.6.1	uploadAttachment.do(上传动态附件)*/
NSString * const ge_api_uploadAttachment = @"uploadAttachment.do";

/** 3.4.6.2	sendMoment.do(发布随笔/班级圈)*/
NSString * const ge_api_sendMoment = @"sendMoment.do";

/** 3.4.6.3	deleteMoment.do(删除随笔/班级圈)*/
NSString * const ge_api_deleteMoment = @"deleteMoment.do";

/** 3.4.6.4	sendComent.do(发布评论)*/
NSString * const ge_api_sendComment = @"sendComment.do";

/** 3.4.6.5	deleteComent.do(删除评论)*/
NSString * const ge_api_deleteComment = @"deleteComment.do";

/** 3.4.6.6	setLike.do(点赞/取消赞)*/
NSString * const ge_api_setLike = @"setLike.do";

/** 3.4.6.7	getMomentList.do（获取好友动态列表）*/
NSString * const ge_api_getMomentList = @"getMomentList.do";

/** 3.4.6.8  getSelfMomentList.do（获取自己动态列表）*/
NSString * const ge_api_getSelfMomentList = @"getSelfMomentList.do";

/** 3.4.6.9	getMomentDetail.do（获取动态详情）*/
NSString * const ge_api_getMomentDetail = @"getMomentDetail.do";

/** 3.4.6.10	getCommentList.do（获取评论列表）*/
NSString * const ge_api_getCommentList = @"getCommentList.do";

/** 3.4.6.11	getForwardUserInfo.do(获取转发用户信息)*/
NSString * const ge_api_getForwardUserInfo = @"getForwardUserInfo.do";

/** 3.4.6.12	uploadClientLog.do(crash日志上传)*/
NSString * const ge_api_uploadClientLog = @"uploadClientLog.do";

/** 3.4.6.13	getPublicKey.do(获取公钥)*/
NSString * const ge_api_getPublicKey = @"getPublicKey.do";

/** 3.4.6.14	open/login.do(授权登录)*/
NSString * const ge_api_openLoginDo = @"open/login.do";

/** 3.4.6.15	iosupdate.do(热加载)*/
NSString * const ge_api_iosUpdate = @"iosupdate.do";

/** 3.4.6.16    getScoreDetail.do(个人积分明细)*/
NSString * const ge_api_getScoreDetail = @"getScoreDetail.do";

/** 3.4.6.17    getLevelClass.do(获取当前用户等级头衔基础数据)*/
NSString * const ge_api_getLevelClass = @"getLevelClass.do";

/** 3.4.6.18    setLevelClass.do(获取当前用户等级头衔基础数据)*/
NSString * const ge_api_setLevelClass = @"setLevelClass.do";

/** 3.4.6.19    completePhotoQueue.do(上传完一组图片后,发送随笔)*/
NSString * const ge_api_completePhotoQueue = @"completePhotoQueue.do";

/** 3.4.6.20    quickLogin.do*/
NSString * const ge_api_quickLogin = @"quickLogin.do";
/** 3.4.6.21    unbindQuickLogin.do*/
NSString * const ge_api_unbindQuickLogin = @"unbindQuickLogin.do";
#pragma mark - 发现 － 应用
/** 获取应用列表 */
NSString * const ge_api_appList = @"appList.do";

/** 应用详情 */
NSString *const ge_api_appInfo = @"appInfo.do";

/** 添加应用 */
NSString *const ge_api_appAdd = @"appAdd.do";

/** 删除应用 */
NSString *const ge_api_appDelete = @"appDelete.do";

/** 获取我的应用列表 */
NSString * const ge_api_myAppList = @"myAppList.do";

/** 获取应用状态 */
NSString * const ge_api_getAppState = @"getAppState.do";

#pragma  mark - 扫描登录
/** 获得班级/群/个人二维码 发起请求 */
NSString * const ge_api_getQrCode = @"getQrCode.do";

/** 扫出二维码 发起请求 */
NSString * const ge_api_scanQRcode = @"/plus/QRCode/QRCodeLogin.ashx?action=scanQRcode";

/** 确认登录接口 */
NSString * const ge_api_confirmLogin = @"/plus/QRCode/QRCodeLogin.ashx?action=confirmLogin";

/** 取消登录接口 */
NSString * const ge_api_quitLogin = @"/plus/QRCode/QRCodeLogin.ashx?action=quitLogin";

/** 获取广告	getAdvery.do(授权登录)*/
NSString * const ge_api_getAdvert = @"getAdvert.do";

/** 获取班级/群/个人二维码URL请求参数 */
//NSString * const ge_api_getQr  =  @"getQr";
/** 二维码扫描请求参数AuthKey */
NSString * const ge_api_AuthKey = @"AuthKey";

/** 二维码扫描请求参数SecretKey */
NSString * const ge_api_SecretKey = @"SecretKey";
/** 二维码扫描请求参数userId */
NSString * const ge_api_userId = @"userId";
/** 二维码扫描登录AES加密公钥 */
NSString * const ge_api_encryPublicKey = @"ha6pyel9h0o82hnh";




#pragma mark - 相册模块
NSString * const ge_api_getPhotoAlbum = @"getPhotoAlbum.do";
NSString * const ge_api_createPhotoAlbum = @"createPhotoAlbum.do";
NSString * const ge_api_getPhotoList = @"getPhotoList.do";
NSString * const ge_api_editPhotoAlbum = @"editPhotoAlbum.do";
NSString *const ge_api_photoScore = @"photoScore.do";
NSString *const ge_api_uploadPhoto = @"uploadPhoto.do";
NSString *const ge_api_getPhotoComment = @"getPhotoComment.do";
NSString *const ge_api_deletePhotoOrAlbum = @"deletePhotoOrAlbum.do";
NSString *const ge_api_photoSetLike = @"photoSetLike.do";

NSString *const ge_api_sendPhotoComment = @"sendPhotoComment.do";
NSString *const ge_api_deletePhotoComment = @"deletePhotoComment.do";
NSString *const ge_api_removePhoto = @"removePhoto.do";
NSString *const ge_api_editPhoto = @"editPhoto.do";
NSString *const ge_api_getPhotoListByPhoto = @"getPhotoListByPhoto.do";








