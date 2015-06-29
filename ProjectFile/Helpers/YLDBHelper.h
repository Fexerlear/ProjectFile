//
//  YLDBHelper.h
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HHHomeInves;

@interface YLDBHelper : NSObject

@property (nonatomic,assign) BOOL isHome;
+ (YLDBHelper *)sharedDBHelper;

- (void)openDB;
- (void)closeDB;



@end
