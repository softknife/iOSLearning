//
//  HTTPAPIParameterConst.h
//  ExcellentLearning
//
//  Created by hjp on 16/11/3.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/** session*/
FOUNDATION_EXTERN NSString * const ge_api_ss;
/** message id*/
FOUNDATION_EXTERN NSString * const ge_api_id;
/** 访问API结果返回值*/
FOUNDATION_EXTERN NSString * const ge_api_result;
/** 访问API成功与否结果返回值*/
FOUNDATION_EXTERN NSString * const ge_api_retcode;
/** 访问API成功与否结果返回*/
FOUNDATION_EXTERN NSString * const ge_api_cid;
/** 访问API成功与否结果返回值*/
FOUNDATION_EXTERN NSString * const ge_api_cn;
/**      */
FOUNDATION_EXTERN NSString * const ge_api_srcname;
/**      */
FOUNDATION_EXTERN NSString * const ge_api_src;
/**      */
FOUNDATION_EXTERN NSString * const ge_api_privacy;
/**      */
FOUNDATION_EXTERN NSString * const ge_api_fuid;
/**      */
FOUNDATION_EXTERN NSString * const ge_api_isprofile;

#pragma mark - 动态
/** 动态发送请求队列,名称 */
FOUNDATION_EXTERN NSString * const sendMomentQueue;
/** 动态类型*/
FOUNDATION_EXTERN NSString * const ge_api_mt;
/** 动态附件URL地址*/
FOUNDATION_EXTERN NSString * const ge_api_furl;
/** 成功发送动态返回的动态*/
FOUNDATION_EXTERN NSString * const ge_api_mtid;
/** 成功发送动态返回的动态ID*/
FOUNDATION_EXTERN NSString * const ge_api_d;
/** 成功发送动态返回的班级动态*/
FOUNDATION_EXTERN NSString * const ge_api_c;
/** 动态文本内容*/
FOUNDATION_EXTERN NSString * const ge_api_text;
/** 动态本地ID*/
FOUNDATION_EXTERN NSString * const ge_api_cmtid;
/** 动态附件的URL地址*/
FOUNDATION_EXTERN NSString * const ge_api_image;
/** 班级id*/
FOUNDATION_EXTERN NSString * const ge_api_classid;
/** 转发动态id*/
FOUNDATION_EXTERN NSString * const ge_api_forward;
/** 动态权限*/
FOUNDATION_EXTERN NSString * const ge_api_privlist;
/** 隐私状态-黑名单*/
FOUNDATION_EXTERN NSString * const ge_api_state;
/** 黑名单对象列表字段*/
FOUNDATION_EXTERN NSString * const ge_api_list;
/** Moment对象key*/
FOUNDATION_EXTERN NSString * const ge_api_moment;
/** 发布评论的动态id ctid*/
FOUNDATION_EXTERN NSString * const ge_api_ctid;
/** 发布评论的动态 mnt*/
FOUNDATION_EXTERN NSString * const ge_api_mnt;
/** 点赞动态 like*/
FOUNDATION_EXTERN NSString * const ge_api_like;
/** 访问API成功与否结果返回值 随笔列表 mlist*/
FOUNDATION_EXTERN NSString * const ge_api_mlist;
/** 访问API成功与否结果返回值 lt*/
FOUNDATION_EXTERN NSString * const ge_api_lt;
/** 访问API成功与否结果返回值 lcount*/
FOUNDATION_EXTERN NSString * const ge_api_lcount;
/** 访问API成功与否结果返回值 ct*/
FOUNDATION_EXTERN NSString * const ge_api_ct;
/** 访问API成功与否结果返回值 rcount*/
FOUNDATION_EXTERN NSString * const ge_api_rcount;
/** 访问API成功与否结果返回值 islike*/
FOUNDATION_EXTERN NSString * const ge_api_islike;
/** 访问API成功与否结果返回值 isvalid*/
FOUNDATION_EXTERN NSString * const ge_api_isvalid;
/** 访问API成功与否结果返回值 rctid*/
FOUNDATION_EXTERN NSString * const ge_api_rctid;
/** 访问API成功与否结果返回值 ruid*/
FOUNDATION_EXTERN NSString * const ge_api_ruid;

#pragma mark 班级使用到的JSON的Key字符串
/** 访问API成功与否结果返回值sdk groupId*/
FOUNDATION_EXTERN NSString * const ge_api_sgid;
/**  访问API成功与否结果返回值classInfo*/
FOUNDATION_EXTERN NSString * const ge_api_classInfo;
/** 访问API成功与否结果返回值班级名称*/
FOUNDATION_EXTERN NSString * const ge_api_cname;

/** 访问API成功与否结果返回值班级老师名称*/
FOUNDATION_EXTERN NSString * const ge_api_cteacher;
/** 错误信息描述*/
FOUNDATION_EXTERN NSString * const ge_api_errmsg;
/** 访问API成功与否结果返回值classList*/
FOUNDATION_EXTERN NSString * const ge_api_classList;
/** 访问API成功与否结果返回值noticeList*/
FOUNDATION_EXTERN NSString * const ge_api_noticeList;
/** 访问API成功与否结果返回值noticeInfo*/
FOUNDATION_EXTERN NSString * const ge_api_noticeInfo;
/** 访问API成功后JSON对应的用户id*/
FOUNDATION_EXTERN NSString * const ge_api_uid;
/** 访问API成功后JSON对应的公告id*/
FOUNDATION_EXTERN NSString * const ge_api_noticeid;
/** 访问API成功后JSON对应的发布公告人id*/
FOUNDATION_EXTERN NSString * const ge_api_memberid;
/** 访问API成功后JSON对应的公告列表时间*/
FOUNDATION_EXTERN NSString * const ge_api_pubTime;
/** 访问API成功后JSON对应的公告发布时间*/
FOUNDATION_EXTERN NSString * const ge_api_pubtime;
/** 访问API成功后JSON对应的公告内容*/
FOUNDATION_EXTERN NSString * const ge_api_content;
/** 访问API成功后JSON对应的用户是否激活*/
FOUNDATION_EXTERN NSString * const ge_api_isactive ;
/** 访问API成功后JSON对应的用户类型*/
FOUNDATION_EXTERN NSString * const ge_api_utype ;
/** 访问API成功后JSON对应的sdk账号*/
FOUNDATION_EXTERN NSString * const ge_api_sdkacc;
/** 访问API成功后JSON对应的sdk密码*/
FOUNDATION_EXTERN NSString * const ge_api_sdkpwd ;
/** 访问API成功后JSON对应的文件服务器地址*/
FOUNDATION_EXTERN NSString * const ge_api_fdfs;
/** 登录访问API成功后JSON对应的user*/
FOUNDATION_EXTERN NSString * const ge_api_user;
/** 注册访问API成功后JSON对应的sdk*/
FOUNDATION_EXTERN NSString * const ge_api_sdk ;

/** 访问API成功与否结果返回值classUserList*/
FOUNDATION_EXTERN NSString * const ge_api_classUserList;
/** 访问API成功与否结果返回值uname*/
FOUNDATION_EXTERN NSString * const ge_api_uname;
/** 访问API成功与否结果返回值ulogo*/
FOUNDATION_EXTERN NSString * const ge_api_ulogo;
/** 访问API成功与否结果返回值memtype*/
FOUNDATION_EXTERN NSString * const ge_api_memtype;
/** 访问API成功与否结果返回值teacherInfo*/
FOUNDATION_EXTERN NSString * const ge_api_teacherInfo;
/** 访问API成功与否结果返回值isAudit*/
FOUNDATION_EXTERN NSString * const ge_api_isAudit;
/** 班级检索类型*/
FOUNDATION_EXTERN NSString * const ge_api_st;
/** 查找班级条件：班主任号或手机号*/
FOUNDATION_EXTERN NSString * const ge_api_sm;
/** 查找班级条件：学校id*/
FOUNDATION_EXTERN NSString * const ge_api_scid;
/** 访问API成功后JSON对应的家长通讯录数组*/
FOUNDATION_EXTERN NSString * const ge_api_addressList;

/** 班级的ID*/
FOUNDATION_EXTERN NSString * const ge_api_ccid ;
/** 入学年份stay*/
FOUNDATION_EXTERN NSString * const ge_api_stay;
/** 添加班级类型rt*/
FOUNDATION_EXTERN NSString * const ge_api_rt;
/** 获取公告页数page*/
FOUNDATION_EXTERN NSString * const ge_api_page;
/** 班级转让状态duid*/
FOUNDATION_EXTERN NSString * const ge_api_duid ;
/** 班级解散状态quit*/
FOUNDATION_EXTERN NSString * const ge_api_quid ;
/** 删除班级成员members*/
FOUNDATION_EXTERN NSString * const ge_api_members;
/** 文件来源ft*/
FOUNDATION_EXTERN NSString * const ge_api_ft ;
/** 文件类型mime*/
FOUNDATION_EXTERN NSString * const ge_api_mime;
/** 加班时间addtime*/
FOUNDATION_EXTERN NSString * const ge_api_addtime;

/** 访问API成功返回状态status */
FOUNDATION_EXTERN NSString * const ge_api_status;
/** 访问API成功返回班级转让状态dStatus*/
FOUNDATION_EXTERN NSString * const ge_api_dStatus;
/** 访问API成功返回班级班级解散状态qStatus*/
FOUNDATION_EXTERN NSString * const ge_api_qStatus;
/** 访问API成功返回公告nid*/
FOUNDATION_EXTERN NSString * const ge_api_nid;
/** 访问API成功返回parname*/
FOUNDATION_EXTERN NSString * const ge_api_parname ;
/** 访问API成功返回parmobile*/
FOUNDATION_EXTERN NSString * const ge_api_parmobile ;
/** 访问API成功返回cfileList*/
FOUNDATION_EXTERN NSString * const ge_api_cfileList;
/** 访问API成功返回cfid*/
FOUNDATION_EXTERN NSString * const ge_api_cfid;
/** 访问API成功返回cfname*/
FOUNDATION_EXTERN NSString * const ge_api_cfname;
/** 访问API成功返回created*/
FOUNDATION_EXTERN NSString * const ge_api_created ;
/** 访问API成功返回creator*/
FOUNDATION_EXTERN NSString * const ge_api_creator;
/** 访问API成功返回cfaddr*/
FOUNDATION_EXTERN NSString * const ge_api_cfaddr;
/** 访问API成功返回fsize*/
FOUNDATION_EXTERN NSString * const ge_api_fsize ;
/** 访问API成功返回provinceList*/
FOUNDATION_EXTERN NSString * const ge_api_provinceList ;
/** 访问API成功返回ID*/
FOUNDATION_EXTERN NSString * const ge_api_ID ;
/** 访问API成功返回Name*/
FOUNDATION_EXTERN NSString * const ge_api_Name;
/** 访问API成功返回cityList*/
FOUNDATION_EXTERN NSString * const ge_api_cityList;
/** 访问API成功返回ParentID*/
FOUNDATION_EXTERN NSString * const ge_api_ParentID;
/** 访问API成功返回distri3ctList*/
FOUNDATION_EXTERN NSString * const ge_api_districtList ;
/** 访问API成功返回rname*/
FOUNDATION_EXTERN NSString * const ge_api_rname;
/** 访问API成功返回time*/
FOUNDATION_EXTERN NSString * const ge_api_time ;
/** 访问API成功返回kmemberNames*/
FOUNDATION_EXTERN NSString * const ge_api_kmemberNames ;
/** 访问API成功返回班级课程表*/
FOUNDATION_EXTERN NSString * const ge_api_timetableurl;
/** 访问API成功返回班级二维码*/
FOUNDATION_EXTERN NSString * const ge_api_qrurl;
/** 访问API成功返回班级成长值*/
FOUNDATION_EXTERN NSString * const ge_api_score;
/** 访问API成功返回班级背景图*/
FOUNDATION_EXTERN NSString * const  ge_api_bgurl;
/** 访问API成功返回班级头像*/
FOUNDATION_EXTERN NSString * const  ge_api_logourl;
/** 访问API成功返回是否正式是班级成员*/
FOUNDATION_EXTERN NSString * const  ge_api_isMember;

#pragma mark - 作业通知使用
/** 作业或通知ID */
FOUNDATION_EXTERN NSString * const ge_api_tid ;
/** 作业/通知发送参数,类型:1:作业  2:通知 */
FOUNDATION_EXTERN NSString * const ge_api_1;
/** 作业/通知发送参数,类型:1:作业  2:通知 */
FOUNDATION_EXTERN NSString * const ge_api_2;
/** 类型:作业还是通知*/
FOUNDATION_EXTERN NSString * const ge_api_ty ;
/** 年级的ID */
FOUNDATION_EXTERN NSString * const ge_api_gcid ;
/**  科目ID*/
FOUNDATION_EXTERN NSString * const ge_api_subid  ;
/**  作业出版社版本号ID*/
FOUNDATION_EXTERN NSString * const ge_api_vid;
/** 作业科目全称 */
FOUNDATION_EXTERN NSString * const ge_api_sub_name;
/** 语音文件（最多一段，时长不超过5min） */
FOUNDATION_EXTERN NSString * const ge_api_vf ;
/**  语音时长（如上传语音文件，则语音时长参数必须传递）*/
FOUNDATION_EXTERN NSString * const ge_api_vfl ;
/**  图片（最多6张图片）*/
FOUNDATION_EXTERN NSString * const ge_api_imf ;
/** 附件（最多一个 */
FOUNDATION_EXTERN NSString * const ge_api_attf ;
/** 服务器返回的通知或者作业的id */
FOUNDATION_EXTERN NSString * const ge_api_taskid ;
/** 作业通知语音附件*/
FOUNDATION_EXTERN NSString * const ge_api_amr ;
/** 作业通知文档参数*/
FOUNDATION_EXTERN NSString * const ge_api_attr;
/** 作业通知id*/
FOUNDATION_EXTERN NSString * const ge_api_serverId ;
/** 作业通知参数*/
FOUNDATION_EXTERN NSString * const ge_api_object ;
/** 作业/通知上传附件参数,班级编号:cids */
FOUNDATION_EXTERN NSString * const ge_api_cids;
/** 作业/通知语音附件,语音时长参数fLength */
FOUNDATION_EXTERN NSString * const ge_api_fLength;
/** 作业科目的id/兴趣的ID */
FOUNDATION_EXTERN NSString * const ge_api_eid;
/** 作业/通知发送参数,草稿/正式 */
FOUNDATION_EXTERN NSString * const ge_api_isdraft;
/** 作业/通知上传图片附件原图URL */
FOUNDATION_EXTERN NSString * const ge_api_iaddr;
/** 作业/通知下载图片附件原图URL */
FOUNDATION_EXTERN NSString * const ge_api_iAddr;
/** 作业/通知上传图片附件缩略图URL */
FOUNDATION_EXTERN NSString * const ge_api_taddr;
/** 作业/通知下载图片附件缩略图URL */
FOUNDATION_EXTERN NSString * const ge_api_thumAddr;

/** 作业/通知上传图片附件顺序 */
FOUNDATION_EXTERN NSString * const ge_api_orderId;
/** 作业/通知上传附件类型ftype 1.语音 2.附件 */
FOUNDATION_EXTERN NSString * const ge_api_ftype;
/** 作业/通知下载附件类型fType 1.语音 2.附件 */
FOUNDATION_EXTERN NSString * const ge_api_fType;
/** 作业/通知上传附件文件路径 */
FOUNDATION_EXTERN NSString * const ge_api_faddr;
/** 作业/通知下载附件路径 */
FOUNDATION_EXTERN NSString * const ge_api_fAddr;
/** 作业/通知上传附件文档文件名字 */
FOUNDATION_EXTERN NSString * const ge_api_fname;
/** 作业/通知上传附件图片字典 */
FOUNDATION_EXTERN NSString * const ge_api_imagesInfo;
/** 作业/通知上传附件语音字典 */
FOUNDATION_EXTERN NSString * const ge_api_filesInfo;
/** 作业/通知列表拉取数据上传参数,分页加载数据--Value */
FOUNDATION_EXTERN NSString * const ge_api_pr;
/** 作业/通知列表拉取数据上传参数,不分页加载数据--Value */
FOUNDATION_EXTERN NSString * const ge_api_all;
/** 作业/通知列表拉取数据上传参数,分页加载数据--key */
FOUNDATION_EXTERN NSString * const ge_api_rtype;
/**  查询时间，可进行过滤查询*/
FOUNDATION_EXTERN NSString * const ge_api_seldate ;
/** 通知是否由自己创建  1:自己创建的通知  0:别人创建的通知 */
FOUNDATION_EXTERN NSString * const ge_api_isself;
/** 作业/通知请求返回数据中是否有图片 */
FOUNDATION_EXTERN NSString * const ge_api_isimage;
/** 作业/通知请求返回数据中是否有语音 */
FOUNDATION_EXTERN NSString * const ge_api_isvoice;
/** 作业/通知请求返回数据中是否有文档 */
FOUNDATION_EXTERN NSString * const ge_api_isattr;
/** 作业/通知,附件语音name */
FOUNDATION_EXTERN NSString * const ge_api_voiceName;
/** 作业/通知,附件文档name */
FOUNDATION_EXTERN NSString * const ge_api_fileName;

/** 作业/通知请求返回数据中是否有文字内容 */
FOUNDATION_EXTERN NSString * const ge_api_istext;
/** 作业/通知请求返回数据,创建者名字 */
FOUNDATION_EXTERN NSString * const ge_api_mrname;
/** 作业/通知请求返回数据,用户Id */
FOUNDATION_EXTERN NSString * const ge_api_mid;
/** 作业/通知请求返回数据,作业科目名称 */
FOUNDATION_EXTERN NSString * const ge_api_subName;
/** 小优催作业通知,作业科目名称 */
FOUNDATION_EXTERN NSString * const ge_api_subname;
/** 创建作业/通知 */
FOUNDATION_EXTERN NSString * const ge_api_taskInfo;
/** 创建作业/通知 类型:1,创建作业  2,创建通知 */
FOUNDATION_EXTERN NSString * const ge_api_tType;


/** 作业科目id */
FOUNDATION_EXTERN NSString * const ge_api_sid;
/** 作业班级id */
//FOUNDATION_EXTERN NSString * const ge_api_gid;
/** 作业版本id */
//FOUNDATION_EXTERN NSString * const ge_api_vid;
/** 作业科目请求返回字段 */
FOUNDATION_EXTERN NSString * const ge_api_subData;
/** 作业科目, 类型级别:1:科目  2:年级  3:版本 */
FOUNDATION_EXTERN NSString * const ge_api_nstar;
/** 作业科目,排列顺序 */
FOUNDATION_EXTERN NSString * const ge_api_orderno;
/** 作业科目, 上一级id */
FOUNDATION_EXTERN NSString * const ge_api_pid;


/** 作业/通知请求队列,名称 */
FOUNDATION_EXTERN NSString * const NoticeAndHomeWorkUploadQueue;
/** 获得作业,请求返回数据 */
FOUNDATION_EXTERN NSString * const ge_api_taskList;
/** 作业/通知,请求返回数据附件信息 */
FOUNDATION_EXTERN NSString * const ge_api_taskFiles;
/** 作业/通知,请求返回数据附件图片信息 */
FOUNDATION_EXTERN NSString * const ge_api_taskImages;
/** 获取作业科目列表请求返回字段 */
FOUNDATION_EXTERN NSString * const ge_api_subInfo;
/** 添加科目 */
FOUNDATION_EXTERN NSString * const ge_api_subjectInfo;

// FIXME: 2016.11.16 李文祥 作业新增功能字段
/** 已接收作业学生人数 2016.11.16 李文祥 */
FOUNDATION_EXTERN NSString * const ge_api_receivenum;
/** 已完成作业学生人数 2016.11.16 李文祥 */
FOUNDATION_EXTERN NSString * const ge_api_fulfilnum;
/** 已查看作业学生ID 2016.11.16 李文祥 */
FOUNDATION_EXTERN NSString * const ge_api_haveSeeStuId;
/** 已完成作业学生ID 2016.11.16 李文祥 */
FOUNDATION_EXTERN NSString * const ge_api_beenCompleteStuId;



#pragma mark 群组创建使用到的JSON的Key字符串
/** 群Id */
FOUNDATION_EXTERN NSString * const ge_api_gid;
/** 名称*/
FOUNDATION_EXTERN NSString * const ge_api_gname;
/** 创建者名称*/
FOUNDATION_EXTERN NSString * const ge_api_gonwer;
/** 创建者ID*/
FOUNDATION_EXTERN NSString * const ge_api_goid;
/** 邀请人的名称*/
FOUNDATION_EXTERN NSString * const ge_api_iuname ;
/** 邀请人的ID*/
FOUNDATION_EXTERN NSString * const ge_api_iuid ;
/** 加入用户的ID*/
FOUNDATION_EXTERN NSString * const ge_api_juid ;
/** 加入用户的名称*/
FOUNDATION_EXTERN NSString * const ge_api_juname;
/** 加入用户的ID */
FOUNDATION_EXTERN NSString * const ge_api_join;
/** 新群主的ID */
FOUNDATION_EXTERN NSString * const ge_api_tuid ;
/** 新群主的名称 */
FOUNDATION_EXTERN NSString * const ge_api_tuname;
/** 允许邀请 */
FOUNDATION_EXTERN NSString * const ge_api_invite ;

/** 备注 */
FOUNDATION_EXTERN NSString * const ge_api_mark ;
/**  */
FOUNDATION_EXTERN NSString * const ge_api_pver ;
/**  */
FOUNDATION_EXTERN NSString * const ge_api_gpname ;
/**  */
FOUNDATION_EXTERN NSString * const ge_api_glogo ;
/** 会话id*/
FOUNDATION_EXTERN NSString * const ge_api_sessionId;
/** 群头像*/
FOUNDATION_EXTERN NSString * const ge_api_groupavatar;
/** 文件*/
FOUNDATION_EXTERN NSString * const ge_api_file  ;
/** 小头像*/
FOUNDATION_EXTERN NSString * const ge_api_thumbnail ;
/** 原头像*/
FOUNDATION_EXTERN NSString * const ge_api_origin ;
/**  */
FOUNDATION_EXTERN NSString * const ge_api_background ;
/** 头像版本 */
FOUNDATION_EXTERN NSString * const ge_api_hver;
/**  */
FOUNDATION_EXTERN NSString * const ge_api_isappuser ;
/**  */
FOUNDATION_EXTERN NSString * const ge_api_sp ;
/**  */
FOUNDATION_EXTERN NSString * const ge_api_face ;
/** 群详情信息*/
FOUNDATION_EXTERN NSString * const ge_api_groupInfo;
/** 群成员信息*/
FOUNDATION_EXTERN NSString * const ge_api_userInfo;

#pragma marl - 会话
/** 通知标题 */
FOUNDATION_EXTERN NSString * const ge_api_title;
/** 小优富文本链接*/
FOUNDATION_EXTERN NSString * const ge_api_link;
/** 小优催作业消息老师名字 */
FOUNDATION_EXTERN NSString * const ge_api_tname;

#pragma mark - 基础信息
/** 服务器返回的被踢人ID */
FOUNDATION_EXTERN NSString * const ge_api_kmembers ;
/**  群邀请需要验证的用户*/
FOUNDATION_EXTERN NSString * const ge_api_needCheckMembers;
/** 群邀请不需要验证的用户 */
FOUNDATION_EXTERN NSString * const ge_api_noNeedCheckMembers;
/** 真实姓名 */
FOUNDATION_EXTERN NSString * const ge_api_name ;
/**  性别*/
FOUNDATION_EXTERN NSString * const ge_api_gender;
/** 省市县码表 6位数字 */
FOUNDATION_EXTERN NSString * const ge_api_districtid ;
/** 学校ID */
FOUNDATION_EXTERN NSString * const ge_api_schoolid ;
/**  学段*/
FOUNDATION_EXTERN NSString * const ge_api_phase ;
/** 邮箱 */
FOUNDATION_EXTERN NSString * const ge_api_email;
/** 身份证 */
FOUNDATION_EXTERN NSString * const ge_api_idcode;
/** 入学年份 */
FOUNDATION_EXTERN NSString * const ge_api_inyear;
/** 家长姓名 */
FOUNDATION_EXTERN NSString * const ge_api_pname;
/** 家长手机号 */
FOUNDATION_EXTERN NSString * const ge_api_pphone;
/** 手机号*/
FOUNDATION_EXTERN NSString * const ge_api_phone ;
/** 类型*/
FOUNDATION_EXTERN NSString * const ge_api_type  ;
/** 密码*/
FOUNDATION_EXTERN NSString * const ge_api_pwd ;
/** 验证码*/
FOUNDATION_EXTERN NSString * const ge_api_code ;
/** 账号*/
FOUNDATION_EXTERN NSString * const ge_api_acc;


#pragma mark - 公共文件的JSON的Key字符串
/**  省市区，科目，班级，出版商的  保存日期*/
FOUNDATION_EXTERN NSString * const ge_api_Date;
/** 科目列表 */
FOUNDATION_EXTERN NSString * const ge_api_subjectList;
/**班级列表*/
FOUNDATION_EXTERN NSString * const ge_api_igradeList;
/** 出版商列表 */
FOUNDATION_EXTERN NSString * const ge_api_publishList;
/**省市区，科目，班级，出版商的  数组*/
FOUNDATION_EXTERN NSString *const ge_api_addressCodePlist;


#pragma mark - 文件保存，拼接本地目录用到的字符串
/** 班级文件 */
FOUNDATION_EXTERN NSString * const ge_api_classFile;
/** 群文件*/
FOUNDATION_EXTERN NSString * const ge_api_sessionFile;
/** 个人文件 */
FOUNDATION_EXTERN NSString * const ge_api_personFile;
/** 资源文件*/
FOUNDATION_EXTERN NSString * const ge_api_resourceFile;
/** 备课资源文件*/
FOUNDATION_EXTERN NSString * const ge_api_Lesson_ResourceFile;
//********************************************************************************
#pragma mark - 第三方app用到的
/**  os */
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_os;
/**  IOS  */
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_IOS;
/** app id */
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_appid;
/** 第三方应用列表*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_applist;
/** 我的应用列表*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_myapps;
/** 应用详情*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_appinfo;
/** 应用图表*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_icon;
/** 应用缩略图*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_appthumb;
/** 应用列名*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_name;
/** 是否已添加该应用*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_isadd;
/** 第三方应用appstoreurl*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_appstoreurl;
/** 是否为推荐应用*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_istop;
/** 排序*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_orders;
/** 第三方应用package*/
//FOUNDATION_EXTERN NSString * const ge_api_thirdApp_package;
/** 应用状态*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_state;
/** 第三方应用类型*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_type;
/** 第三方应用url scheme*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_urlscheme;
/** web应用url*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_weburl;
/** 维护状态*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_maintain;
/** 应用描述*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_describe;
/** 开发商name*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_devname;
/** 下载数目*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_installnum;
/** 试用学段*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_phase;
/** 权限范围*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_powerrange;
/** 价格类型*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_pricetype;
/** 评价*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_score;
/** 相关推荐APP*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_relatedApps;
/** pagesize*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_pagesize;
/** pagenum*/
FOUNDATION_EXTERN NSString * const ge_api_thirdApp_pagenum;

#pragma mark - 二维码扫
/** Success */
FOUNDATION_EXTERN NSString * const ge_api_Success;
/** status */
//FOUNDATION_EXTERN NSString * const ge_api_QRStatus;
/** AuthKey_Used */
FOUNDATION_EXTERN NSString * const ge_api_AuthKeyUsed;
/** AuthKey_Missing */
FOUNDATION_EXTERN NSString * const ge_api_AuthKeyMissing;


#pragma mark - Album
FOUNDATION_EXTERN NSString * const ge_api_pageSize;
FOUNDATION_EXTERN NSString * const ge_api_pageTime;
FOUNDATION_EXTERN NSString * const ge_api_descript;
/** 相册id*/
FOUNDATION_EXTERN NSString * const ge_api_paid;  //相册id
FOUNDATION_EXTERN NSString * const ge_api_coverid;
/** 图片id*/
FOUNDATION_EXTERN NSString * const ge_api_pids;//删除目标id
FOUNDATION_EXTERN NSString * const uploadPhotoQueue;  //上传图片的队列名称


FOUNDATION_EXTERN NSString *const ge_api_contactid;
FOUNDATION_EXTERN NSString *const ge_api_contactname;
FOUNDATION_EXTERN NSString *const ge_api_onwerid;
FOUNDATION_EXTERN NSString *const ge_api_albumstate;
FOUNDATION_EXTERN NSString *const ge_api_photoalbum;
FOUNDATION_EXTERN NSString *const ge_api_coverurl;
FOUNDATION_EXTERN NSString *const ge_api_createtime;
FOUNDATION_EXTERN NSString *const ge_api_photonum;
FOUNDATION_EXTERN NSString *const ge_api_thumburl;
FOUNDATION_EXTERN NSString *const ge_api_hits;
FOUNDATION_EXTERN NSString *const ge_api_photolist;
FOUNDATION_EXTERN NSString *const ge_api_photourl;
FOUNDATION_EXTERN NSString *const ge_api_cmtnum;
FOUNDATION_EXTERN NSString *const ge_api_likenum;





