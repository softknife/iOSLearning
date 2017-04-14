//
//  HTTPAPIParameterConst.m
//  ExcellentLearning
//
//  Created by hjp on 16/11/7.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/** session*/
NSString * const ge_api_ss = @"ss";
/** message id*/
NSString * const ge_api_id  =  @"id";
/** 访问API结果返回值*/
NSString * const ge_api_result = @"result";
/** 访问API成功与否结果返回值*/
NSString * const ge_api_retcode  =  @"retcode";
/** 访问API成功与否结果返回*/
NSString * const ge_api_cid = @"cid";
/** 访问API成功与否结果返回值*/
NSString * const ge_api_cn  =  @"cn";
/**      */
NSString * const ge_api_srcname = @"srcname";
NSString * const ge_api_src = @"src";

NSString * const ge_api_privacy = @"privacy";
NSString * const ge_api_fuid = @"fuid";
NSString * const ge_api_isprofile = @"isprofile";

#pragma mark - 动态
/** 动态发送请求队列,名称 */
NSString * const sendMomentQueue  =  @"sendMomentQueue";
/** 动态类型*/
NSString * const ge_api_mt  =  @"mt";
/** 动态附件URL地址*/
NSString * const ge_api_furl = @"furl";
/** 成功发送动态返回的动态*/
NSString * const ge_api_mtid  =  @"mtid";
/** 成功发送动态返回的动态ID*/
NSString * const ge_api_d = @"d";
/** 成功发送动态返回的班级动态*/
NSString * const ge_api_c  =  @"c";
/** 动态文本内容*/
NSString * const ge_api_text = @"text";
/** 动态本地ID*/
NSString * const ge_api_cmtid  =  @"cmtid";
/** 动态附件的URL地址*/
NSString * const ge_api_image = @"image";
/** 班级id*/
NSString * const ge_api_classid  =  @"classid";
/** 转发动态id*/
NSString * const ge_api_forward = @"forward";
/** 动态权限*/
NSString * const ge_api_privlist  =  @"privlist";
/** 隐私状态-黑名单*/
NSString * const ge_api_state = @"state";
/** 黑名单对象列表字段*/
NSString * const ge_api_list  =  @"list";
/** Moment对象key*/
NSString * const ge_api_moment = @"moment";
/** 发布评论的动态id ctid*/
NSString * const ge_api_ctid = @"ctid";
/** 发布评论的动态 mnt*/
NSString * const ge_api_mnt = @"mnt";
/** 点赞动态 like*/
NSString * const ge_api_like = @"like";
/** 访问API成功与否结果返回值 随笔列表 mlist*/
NSString * const ge_api_mlist = @"mlist";
/** 访问API成功与否结果返回值 lt*/
NSString * const ge_api_lt = @"lt";
/** 访问API成功与否结果返回值 lcount*/
NSString * const ge_api_lcount = @"lcount";
/** 访问API成功与否结果返回值 ct*/
NSString * const ge_api_ct = @"ct";
/** 访问API成功与否结果返回值 rcount*/
NSString * const ge_api_rcount = @"rcount";
/** 访问API成功与否结果返回值 islike*/
NSString * const ge_api_islike = @"islike";
/** 访问API成功与否结果返回值 isvalid*/
NSString * const ge_api_isvalid = @"isvalid";
/** 访问API成功与否结果返回值 rctid*/
NSString * const ge_api_rctid = @"rctid";
/** 访问API成功与否结果返回值 ruid*/
NSString * const ge_api_ruid = @"ruid";

#pragma mark 班级使用到的JSON的Key字符串
/** 访问API成功与否结果返回值sdk groupId*/
NSString * const ge_api_sgid  =  @"sgid";
/**  访问API成功与否结果返回值classInfo*/
NSString * const ge_api_classInfo = @"classInfo";
/** 访问API成功与否结果返回值班级名称*/
NSString * const ge_api_cname  =  @"cname";

/** 访问API成功与否结果返回值班级老师名称*/
NSString * const ge_api_cteacher  =  @"cteacher";
/** 错误信息描述*/
NSString * const ge_api_errmsg = @"errmsg";
/** 访问API成功与否结果返回值classList*/
NSString * const ge_api_classList  =  @"classList";
/** 访问API成功与否结果返回值noticeList*/
NSString * const ge_api_noticeList = @"noticeList";
/** 访问API成功与否结果返回值noticeInfo*/
NSString * const ge_api_noticeInfo  =  @"noticeInfo";
/** 访问API成功后JSON对应的用户id*/
NSString * const ge_api_uid = @"uid";
/** 访问API成功后JSON对应的公告id*/
NSString * const ge_api_noticeid  =  @"noticeid";
/** 访问API成功后JSON对应的发布公告人id*/
NSString * const ge_api_memberid = @"memberid";
/** 访问API成功后JSON对应的公告列表时间*/
NSString * const ge_api_pubTime  =  @"pubTime";
/** 访问API成功后JSON对应的公告发布时间*/
NSString * const ge_api_pubtime  =  @"pubtime";
/** 访问API成功后JSON对应的公告内容*/
NSString * const ge_api_content  =  @"content";
/** 访问API成功后JSON对应的用户是否激活*/
NSString * const ge_api_isactive = @"isactive";
/** 访问API成功后JSON对应的用户类型*/
NSString * const ge_api_utype  =  @"utype";
/** 访问API成功后JSON对应的sdk账号*/
NSString * const ge_api_sdkacc = @"sdkacc";
/** 访问API成功后JSON对应的sdk密码*/
NSString * const ge_api_sdkpwd  =  @"sdkpwd";
/** 访问API成功后JSON对应的文件服务器地址*/
NSString * const ge_api_fdfs  =  @"fdfs";
/** 登录访问API成功后JSON对应的user*/
NSString * const ge_api_user = @"user";
/** 注册访问API成功后JSON对应的sdk*/
NSString * const ge_api_sdk  =  @"sdk";

/** 访问API成功与否结果返回值classUserList*/
NSString * const ge_api_classUserList = @"classUserList";
/** 访问API成功与否结果返回值uname*/
NSString * const ge_api_uname  =  @"uname";
/** 访问API成功与否结果返回值ulogo*/
NSString * const ge_api_ulogo = @"ulogo";
/** 访问API成功与否结果返回值memtype*/
NSString * const ge_api_memtype  =  @"memtype";
/** 访问API成功与否结果返回值teacherInfo*/
NSString * const ge_api_teacherInfo = @"teacherInfo";
/** 访问API成功与否结果返回值isAudit*/
NSString * const ge_api_isAudit  =  @"isAudit";
/** 班级检索类型*/
NSString * const ge_api_st = @"st";
/** 查找班级条件：班主任号或手机号*/
NSString * const ge_api_sm  =  @"sm";
/** 查找班级条件：学校id*/
NSString * const ge_api_scid  =  @"scid";
/** 访问API成功后JSON对应的家长通讯录数组*/
NSString * const ge_api_addressList = @"addressList";

/** 班级的ID*/
NSString * const ge_api_ccid = @"ccid";
/** 入学年份stay*/
NSString * const ge_api_stay = @"stay";
/** 添加班级类型rt*/
NSString * const ge_api_rt = @"rt";
/** 获取公告页数page*/
NSString * const ge_api_page = @"page";
/** 班级转让状态duid*/
NSString * const ge_api_duid = @"duid";
/** 班级解散状态quit*/
NSString * const ge_api_quid = @"quit";
/** 删除班级成员members*/
NSString * const ge_api_members = @"members";
/** 文件来源ft */
NSString * const ge_api_ft = @"ft";
/** 文件类型mime */
NSString * const ge_api_mime = @"mime";

NSString * const ge_api_addtime = @"addtime";

/** 访问API成功返回班级转让状态dStatus*/

NSString * const ge_api_status = @"status";

NSString * const ge_api_dStatus = @"dStatus";
/** 访问API成功返回班级班级解散状态qStatus*/
NSString * const ge_api_qStatus = @"qStatus";
/** 访问API成功返回公告nid*/
NSString * const ge_api_nid = @"nid";
/** 访问API成功返回parname*/
NSString * const ge_api_parname = @"parname";
/** 访问API成功返回parmobile*/
NSString * const ge_api_parmobile = @"parmobile";
/** 访问API成功返回cfileList*/
NSString * const ge_api_cfileList = @"cfileList";
/** 访问API成功返回cfid*/
NSString * const ge_api_cfid = @"cfid";
/** 访问API成功返回cfname*/
NSString * const ge_api_cfname = @"cfname";
/** 访问API成功返回created*/
NSString * const ge_api_created = @"created";
/** 访问API成功返回creator*/
NSString * const ge_api_creator = @"creator";
/** 访问API成功返回cfaddr*/
NSString * const ge_api_cfaddr = @"cfaddr";
/** 访问API成功返回fsize*/
NSString * const ge_api_fsize = @"fsize";
/** 访问API成功返回provinceList*/
NSString * const ge_api_provinceList = @"provinceList";
/** 访问API成功返回ID*/
NSString * const ge_api_ID = @"ID";
/** 访问API成功返回Name*/
NSString * const ge_api_Name = @"Name";
/** 访问API成功返回cityList*/
NSString * const ge_api_cityList = @"cityList";
/** 访问API成功返回ParentID*/
NSString * const ge_api_ParentID = @"ParentID";
/** 访问API成功返回distri3ctList*/
NSString * const ge_api_districtList = @"districtList";
/** 访问API成功返回rname*/
NSString * const ge_api_rname = @"rname";
/** 访问API成功返回time*/
NSString * const ge_api_time = @"time";
/** 访问API成功返回kmemberNames*/
NSString * const ge_api_kmemberNames = @"kmemberNames";
/** 访问API成功返回班级二维码*/
NSString * const ge_api_qrurl = @"qrurl";
/** 访问API成功返回班级课程表*/
NSString * const ge_api_timetableurl = @"timetableurl";
/** 访问API成功返回班级成长值*/
NSString * const ge_api_score = @"score";
/** 访问API成功返回班级背景图*/
NSString * const ge_api_bgurl = @"bgurl";
/** 访问API成功返回班级头像*/
NSString * const ge_api_logourl = @"logourl";
/** 访问API成功返回是否是正式班级成员*/
NSString * const ge_api_isMember = @"isMember";
#pragma mark - 作业通知使用
/** 作业或通知ID */
NSString * const ge_api_tid  =  @"tid";
/** 作业/通知发送参数,类型:1:作业/语音  2:通知/文档 */
NSString * const ge_api_1  =  @"1";
/** 作业/通知发送参数,类型:1:作业/语音  2:通知/文档 */
NSString * const ge_api_2  =  @"2";
/** 类型:作业还是通知*/
NSString * const ge_api_ty = @"ty";
/** 年级的ID */
NSString * const ge_api_gcid  =  @"gcid";
/**  科目ID*/
NSString * const ge_api_subid  =  @"subid";
/**  作业出版社版本号ID*/
NSString * const ge_api_vid  =  @"vid";
/** 作业科目全称 */
NSString * const ge_api_sub_name = @"name";
/** 语音文件（最多一段，时长不超过5min） */
NSString * const ge_api_vf  =  @"vf";
/**  语音时长（如上传语音文件，则语音时长参数必须传递）*/
NSString * const ge_api_vfl = @"vfl";
/**  图片（最多6张图片）*/
NSString * const ge_api_imf  =  @"imf";
/** 附件（最多一个 */
NSString * const ge_api_attf = @"attf";
/** 服务器返回的通知或者作业的id */
NSString * const ge_api_taskid  =  @"taskid";
/** 作业通知语音附件*/
NSString * const ge_api_amr  =  @"amr";
/** 作业通知文档参数*/
NSString * const ge_api_attr  =  @"attr";

/** 作业通知id*/
NSString * const ge_api_serverId = @"serverId";
/** 作业通知参数*/
NSString * const ge_api_object  =  @"object";
/** 作业/通知上传附件参数,班级编号:cids */
NSString * const ge_api_cids =  @"cids";
/** 作业/通知语音附件,语音时长参数fLength,该参数需要换算成秒,不能大于五分钟 */
NSString * const ge_api_fLength  =  @"fLength";
/** 作业科目的id/兴趣的ID */
NSString * const ge_api_eid  =  @"eid";
/** 作业/通知发送参数,草稿/正式 */
NSString * const ge_api_isdraft  =  @"isdraft";
/** 作业/通知上传图片附件原图URL */
NSString * const ge_api_iaddr  =  @"iaddr";
/** 作业/通知下载图片附件原图URL */
NSString * const ge_api_iAddr  =  @"iAddr";
/** 作业/通知上传图片附件缩略图URL */
NSString * const ge_api_taddr  =  @"taddr";
/** 作业/通知下载图片附件缩略图URL */
NSString * const ge_api_thumAddr  =  @"thumAddr";

/** 作业/通知上传图片附件顺序 */
NSString * const ge_api_orderId  =  @"orderId";
/** 作业/通知上传附件类型ftype 1.语音 2.附件 */
NSString * const ge_api_ftype  =  @"ftype";
/** 作业/通知下载附件类型fType 1.语音 2.附件 */
NSString * const ge_api_fType  =  @"fType";
/** 作业/通知上传附件路径 */
NSString * const ge_api_faddr  =  @"faddr";
/** 作业/通知下载附件路径 */
NSString * const ge_api_fAddr  =  @"fAddr";
/** 作业/通知上传附件文档文件名字 */
NSString * const ge_api_fname  =  @"fname";
/** 作业/通知上传附件图片字典 */
NSString * const ge_api_imagesInfo  =  @"imagesInfo";
/** 作业/通知上传附件语音字典 */
NSString * const ge_api_filesInfo  =  @"filesInfo";
/** 作业/通知列表拉取数据上传参数,分页加载数据--Value */
NSString * const ge_api_pr  =  @"pr";
/** 作业/通知列表拉取数据上传参数,不分页加载数据--Value */
NSString * const ge_api_all  =  @"all";
/** 作业/通知列表拉取数据上传参数,分页加载数据--key */
NSString * const ge_api_rtype  =  @"rtype";
/**  查询时间，可进行过滤查询*/
NSString * const ge_api_seldate  =  @"seldate";
/** 通知是否由自己创建  1:自己创建的通知  0:别人创建的通知 */
NSString * const ge_api_isself  =  @"isself";
/** 作业/通知请求返回数据中是否有图片 */
NSString * const ge_api_isimage  =  @"isimage";
/** 作业/通知请求返回数据中是否有语音 */
NSString * const ge_api_isvoice  =  @"isvoice";
/** 作业/通知请求返回数据中是否有文档 */
NSString * const ge_api_isattr  =  @"isattr";
/** 作业/通知,附件语音name */
NSString * const ge_api_voiceName  =  @"voiceName";
/** 作业/通知,附件文档name */
NSString * const ge_api_fileName  =  @"fileName";

/** 作业/通知请求返回数据中是否有文字内容 */
NSString * const ge_api_istext  =  @"istext";
/** 作业/通知请求返回数据,创建者名字 */
NSString * const ge_api_mrname  =  @"mrname";
/** 作业/通知请求返回数据,用户Id */
NSString * const ge_api_mid  =  @"mid";
/** 作业/通知请求返回数据,作业科目名称 */
NSString * const ge_api_subName  =  @"subName";
/** 小优催作业通知,作业科目名称 */
NSString * const ge_api_subname  =  @"subname";
/** 创建作业/通知 */
NSString * const ge_api_taskInfo  =  @"taskInfo";
/** 创建作业/通知 类型:1,创建作业  2,创建通知 */
NSString * const ge_api_tType  =  @"tType";

/** 作业科目id */
NSString * const ge_api_sid  =  @"sid";
/** 作业班级id */
//NSString * const ge_api_gid  =  @"gid";
/** 作业版本id */
//NSString * const ge_api_vid  =  @"vid";
/** 作业科目请求返回字段 */
NSString * const ge_api_subData  =  @"subData";
/** 作业科目, 类型级别:1:科目  2:年级  3:版本 */
NSString * const ge_api_nstar  =  @"nstar";
/** 作业科目,排列顺序 */
NSString * const ge_api_orderno  =  @"orderno";
/** 作业科目, 上一级id */
NSString * const ge_api_pid  =  @"pid";

/** 作业/通知请求队列,名称 */
NSString * const NoticeAndHomeWorkUploadQueue  =  @"NoticeAndHomeWorkUploadQueue";
/** 获得作业,请求返回数据 */
NSString * const ge_api_taskList  =  @"taskList";
/** 作业/通知,请求返回数据附件信息 */
NSString * const ge_api_taskFiles  =  @"taskFiles";
/** 作业/通知,请求返回数据附件图片信息 */
NSString * const ge_api_taskImages  =  @"taskImages";
/** 获取作业科目列表请求返回字段 */
NSString * const ge_api_subInfo  =  @"subInfo";
/** 添加科目 */
NSString * const ge_api_subjectInfo  =  @"subjectInfo";

// FIXME: 2016.11.16 李文祥 作业新增功能字段
/** 已接收作业学生人数 2016.11.16 李文祥 */
NSString * const ge_api_receivenum  =  @"receivenum";
/** 已完成作业学生人数 2016.11.16 李文祥 */
NSString * const ge_api_fulfilnum  =  @"fulfilnum";
/** 已查看作业学生ID 2016.11.16 李文祥 */
NSString * const ge_api_haveSeeStuId  =  @"haveSeeStuId";
/** 已完成作业学生ID 2016.11.16 李文祥 */
NSString * const ge_api_beenCompleteStuId  =  @"beenCompleteStuId";


#pragma mark 群组创建使用到的JSON的Key字符串
/** 群Id */
NSString * const ge_api_gid  =  @"gid";
/** 名称*/
NSString * const ge_api_gname  =  @"gname";
/** 创建者名称*/
NSString * const ge_api_gonwer  =  @"gowner";
/** 创建者ID*/
NSString * const ge_api_goid  =  @"goid";
/** 邀请人的名称*/
NSString * const ge_api_iuname  =  @"iuname";
/** 邀请人的ID*/
NSString * const ge_api_iuid  =  @"iuid";
/** 加入用户的ID*/
NSString * const ge_api_juid  =  @"juid";
/** 加入用户的名称*/
NSString * const ge_api_juname  =  @"juname";
/** 加入用户的ID */
NSString * const ge_api_join  =  @"join";
/** 新群主的ID */
NSString * const ge_api_tuid  =  @"tuid";
/** 新群主的名称 */
NSString * const ge_api_tuname  =  @"tuname";
/** 允许邀请 */
NSString * const ge_api_invite  =  @"invite";

/** 备注 */
NSString * const ge_api_mark  =  @"mark";
/**  */
NSString * const ge_api_pver  =  @"pver";
/**  */
NSString * const ge_api_gpname = @"gpname";
/**  */
NSString * const ge_api_glogo           =  @"glogo";
/** 会话id*/
NSString * const ge_api_sessionId       =  @"sessionId";
/** 群头像*/
NSString * const ge_api_groupavatar     = @"groupavatar";
/** 文件*/
NSString * const ge_api_file            =  @"file";
/** 小头像*/
NSString * const ge_api_thumbnail       = @"thumbnail";
/** 原头像*/
NSString * const ge_api_origin          = @"origin";
/**  */
NSString * const ge_api_background      =  @"background";
/** 头像版本 */
NSString * const ge_api_hver            =  @"hver";
/**  */
NSString * const ge_api_isappuser       =  @"isappuser";
/**  */
NSString * const ge_api_sp              =  @"sp";
/**  */
NSString * const ge_api_face            =  @"face";
/** 群详情信息*/
NSString * const ge_api_groupInfo       = @"groupInfo";
/** 群成员信息*/
NSString * const ge_api_userInfo        = @"userInfo";


#pragma marl - 系统通知
/** 通知标题/通知标题/作业科目名称 */
NSString * const ge_api_title = @"title";
/** 小优富文本链接*/
NSString * const ge_api_link = @"link";
/** 小优催作业消息老师名字 */
NSString * const ge_api_tname = @"tname";


#pragma mark - 基础信息
/** 服务器返回的被踢人ID */
NSString * const ge_api_kmembers = @"kmembers";
/**  群邀请需要验证的用户*/
NSString * const ge_api_needCheckMembers  =  @"needCheckMembers";
/** 群邀请不需要验证的用户 */
NSString * const ge_api_noNeedCheckMembers = @"noNeedCheckMembers";
/** 真实姓名 */
NSString * const ge_api_name = @"name";
/**  性别*/
NSString * const ge_api_gender  =  @"gender";
/** 省市县码表 6位数字 */
NSString * const ge_api_districtid  =  @"districtid";
/** 学校ID */
NSString * const ge_api_schoolid = @"schoolid";
/**  学段*/
NSString * const ge_api_phase  =  @"phase";
/** 邮箱 */
NSString * const ge_api_email = @"email";
/** 身份证 */
NSString * const ge_api_idcode  =  @"idcode";
/** 入学年份 */
NSString * const ge_api_inyear = @"inyear";
/** 家长姓名 */
NSString * const ge_api_pname  =  @"pname";
/** 家长手机号 */
NSString * const ge_api_pphone = @"pphone";
/** 手机号*/
NSString * const ge_api_phone = @"phone";
/** 类型*/
NSString * const ge_api_type  =  @"type";
/** 密码*/
NSString * const ge_api_pwd = @"pwd";
/** 验证码*/
NSString * const ge_api_code  =  @"code";
/** 账号*/
NSString * const ge_api_acc = @"acc";


#pragma mark - 公共文件的JSON的Key字符串
/**  省市区，科目，班级，出版商的  保存日期*/
NSString * const ge_api_Date = @"Date";
/** 科目列表 */
NSString * const ge_api_subjectList  =  @"subjectList";
/**班级列表*/
NSString * const ge_api_igradeList = @"igradeList";
/** 出版商列表 */
NSString * const ge_api_publishList  =  @"publishList";
/**省市区，科目，班级，出版商的  数组*/
NSString *const ge_api_addressCodePlist = @"addressCodePlist";


#pragma mark - 文件保存，拼接本地目录用到的字符串
/** 班级文件 */
NSString * const ge_api_classFile  =  @"classFile";
/** 群文件*/
NSString * const ge_api_sessionFile = @"sessionFile";
/** 个人文件 */
NSString * const ge_api_personFile  =  @"personFile";
/** 资源文件*/
NSString * const ge_api_resourceFile = @"resourceFile";
/** 备课资源文件*/
NSString * const ge_api_Lesson_ResourceFile = @"lessonResourceFile";

//********************************************************************************
#pragma mark - 第三方app用到的
/**  ios */
NSString * const ge_api_thirdApp_os  =  @"os";
/**  IOS  */
NSString * const ge_api_thirdApp_IOS = @"IOS";
/** app id */
NSString * const ge_api_thirdApp_appid =  @"appid";
/** 第三方应用列表*/
NSString * const ge_api_thirdApp_applist =  @"apps";
/** 我的应用列表*/
NSString * const ge_api_thirdApp_myapps = @"myapps";
/** 应用详情*/
NSString * const ge_api_thirdApp_appinfo = @"appinfo";
/** 应用图表*/
NSString * const ge_api_thirdApp_icon = @"icon";
/** 应用缩略图*/
NSString * const ge_api_thirdApp_appthumb = @"appthumb";
/** 应用列名*/
NSString * const ge_api_thirdApp_name = @"appname";
/** 是否已添加该应用*/
NSString * const ge_api_thirdApp_isadd  =  @"isadd";
/** 第三方应用appstoreurl*/
NSString * const ge_api_thirdApp_appstoreurl = @"appstoreurl";
/** 是否为推荐应用*/
NSString * const ge_api_thirdApp_istop = @"istop";
/** 排序*/
NSString * const ge_api_thirdApp_orders = @"orders";
/** 第三方应用package*/
//NSString * const ge_api_thirdApp_package = @"package";
/** 应用状态*/
NSString * const ge_api_thirdApp_state = @"state";
/** 应用类型*/
NSString * const ge_api_thirdApp_type = @"type";
/** 第三方应用url scheme*/
NSString * const ge_api_thirdApp_urlscheme = @"urlscheme";
/** web第三方应用url*/
NSString * const ge_api_thirdApp_weburl = @"weburl";
/** 维护状态*/
NSString * const ge_api_thirdApp_maintain = @"maintain";
/** 应用描述*/
NSString * const ge_api_thirdApp_describe = @"describe";
/** 开发商name*/
NSString * const ge_api_thirdApp_devname = @"devname";
/** 下载数目*/
NSString * const ge_api_thirdApp_installnum = @"installnum";
/** 试用学段*/
NSString * const ge_api_thirdApp_phase = @"phase";
/** 权限范围*/
NSString * const ge_api_thirdApp_powerrange = @"powerrange";
/** 价格类型*/
NSString * const ge_api_thirdApp_pricetype = @"pricetype";
/** 评价*/
NSString * const ge_api_thirdApp_score = @"score";
/** 相关推荐APP*/
NSString * const ge_api_thirdApp_relatedApps = @"relatedApps";
/** pagesize*/
NSString * const ge_api_thirdApp_pagesize = @"pagesize";
/** pagenum*/
NSString * const ge_api_thirdApp_pagenum = @"pagenum";

#pragma mark - 二维码扫

/** Success */
NSString * const ge_api_Success = @"Success";
/** status */
//NSString * const ge_api_QRStatus = @"status";
/** AuthKey_Used */
NSString * const ge_api_AuthKeyUsed = @"AuthKey_Used";
/** AuthKey_Missing */
NSString * const ge_api_AuthKeyMissing = @"AuthKey_Missing";


#pragma mark - Album

NSString * const ge_api_pageSize = @"pagesize";
NSString * const ge_api_pageTime = @"pagetime";
NSString * const ge_api_descript = @"descript";
/** 相册id*/
NSString * const ge_api_paid = @"paid";
NSString * const ge_api_coverid = @"coverid";
/** 图片id*/
NSString * const ge_api_pids = @"pids"; //删除目标id


NSString * const uploadPhotoQueue  =  @"uploadPhotoQueue";

NSString *const ge_api_contactid = @"contactid";
NSString *const ge_api_contactname = @"contactname";
NSString *const ge_api_onwerid = @"onwerid";
NSString *const ge_api_albumstate = @"albumstate";
NSString *const ge_api_photoalbum = @"photoalbum";
NSString *const ge_api_coverurl = @"coverurl";
NSString *const ge_api_createtime = @"createtime";
NSString *const ge_api_photonum = @"photonum";
NSString *const ge_api_thumburl = @"thumburl";
NSString *const ge_api_hits = @"hits";
NSString *const ge_api_photolist = @"photolist";
NSString *const ge_api_photourl = @"photourl";
NSString *const ge_api_cmtnum = @"cmtnum";
NSString *const ge_api_likenum = @"likenum";









