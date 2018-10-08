//
//  UtilsMacro.h
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#ifndef ProjectFile_UtilsMacro_h
#define ProjectFile_UtilsMacro_h


/**
 *  沙盒中路径
 */
#define kDocuments [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define kCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]


/** 度数 */
#define angle(d) ((M_PI / 180.0f) * d)

/**
 *  版本记录字段
 */

#define kNewFeatureVersionKey  @"kNewFeatureVersionKey"

/**
 *  应用的版本号
 */
#define KAppVersion_YL ([[NSBundle mainBundle].infoDictionary valueForKey:(__bridge NSString*)kCFBundleVersionKey])

/**
 *  工程名称
 */
#define kAppDisplayName_YL ([[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString*)kCFBundleNameKey])

/**   定义不同的模式下的输出函数   */
#ifdef DEBUG

#ifndef YLog
#   define YLog(fmt, ...) {DDLogError((@"\n%s [Line %d] \n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#endif

#ifndef ELog
#   define ELog(err) {if(err) DLog(@"%@", err)}
#endif

#else
#ifndef YLog
//#   define YLog(...)
#   define YLog(fmt, ...) {DDLogError((@"\n%s [Line %d] \n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}

#endif
#ifndef ELog
#   define ELog(err)
#endif
#endif


//是否为空或是[NSNull null]
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))





/**
 *  列表请求的页数
 */
#define FDListPageCount 10



/**
 *  时间格式显示,科特的显示，只作用于时间戳，过期时间什么的不变
 */
#define FDDateFormatterString @"dd/MM/yyyy HH:mm:ss,SSS"

/**
 *  不带毫秒的时间格式
 */
#define FDDateOtherFormatterString @"dd/MM/yyyy HH:mm:ss"


/**
 *  按照年月日的显示
 */
#define FDNormalFormatterString @"yyyyMMddHHmmssSSS"



#endif




