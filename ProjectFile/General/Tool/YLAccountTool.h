//
//  YLAccountTool.h
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YLAccount;
@interface YLAccountTool : NSObject

/**
 *  存储帐号
 */
+ (void)save:(YLAccount *)account;

/**
 *  读取帐号
 */
+ (YLAccount *)account;

@end
