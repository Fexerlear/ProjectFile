//
//  YLAccountTool.m
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import "YLAccountTool.h"
#import "YLAccount.h"

#define HHAccountFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]



@implementation YLAccountTool

+ (void)save:(YLAccount *)account
{
    // 归档
    [NSKeyedArchiver archiveRootObject:account toFile:HHAccountFilepath];
}

+ (YLAccount *)account
{
    // 读取帐号
    YLAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:HHAccountFilepath];
    
    return account;
}

@end
