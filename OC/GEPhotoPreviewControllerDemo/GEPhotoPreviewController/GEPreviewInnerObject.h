//
//  GEPreviewInnerObject.h
//  
//
//  Created by hjp on 16/11/27.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GEPreviewInnerObjectType) {
    
    GEPreviewInnerObjectTypeNet      = 1, //网络获取图片
    GEPreviewInnerObjectTypeLocal    = 2, //从本地获取图片
};

@interface GEPreviewInnerObject : NSObject

/** 隶属于某个表的id*/
@property(nonatomic, copy) NSString *attachId;

/** 附件的名字*/
@property(nonatomic, copy) NSString *name;

/** 附件原图的url地址  / 广告图片url地址*/
@property(nonatomic, copy) NSString *orignalUrl;

/** 附件缩略图的url地址*/
@property(nonatomic, copy) NSString *thumbnailUrl;

/** 文件管理图片预览,图片路径 */
@property (copy , nonatomic) NSString *origalLocalPath;

/** 缩略图*/
@property (nonatomic , copy) NSString *thumbLocalPath;

/** 占位*/
@property (nonatomic , copy) NSString *praceholder;


/** 预览图片类型  1:需要从网络加载  2:直接从本地获取 */
@property (nonatomic , assign) GEPreviewInnerObjectType photoType;

/** 扩展字段*/
@property (nonatomic , copy) NSString *extention;

/** scale*/
@property (nonatomic , assign) double zoomScale;

@end
