//
//  UtilsMacro.h
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#ifndef ProjectFile_UtilsMacro_h
#define ProjectFile_UtilsMacro_h


#endif



/**
 *  沙盒中路径
 */
#define kDocuments [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define kCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]

/**
 *  屏幕宽高
 */
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

/**
 *  主要背景色
 */
#define kMainColor RGB(245,245,245)

#define RGB(r, g, b)    [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]



/** 度数 */
#define angle(d) ((M_PI / 180.0f) * d)

/**
 *  版本记录字段
 */

#define kNewFeatureVersionKey  @"kNewFeatureVersionKey"

