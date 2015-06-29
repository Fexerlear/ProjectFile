//
//  YLAccount.m
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import "YLAccount.h"

@implementation YLAccount


#pragma mark - 归档读取方法
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.name=[decoder decodeObjectForKey:@"name"];
        
    }
    return self;
}

#pragma mark - 归档存储方法
- (void)encodeWithCoder:(NSCoder *)enCoder
{
    [enCoder encodeObject:self.name forKey:@"name"];
    
}

@end
