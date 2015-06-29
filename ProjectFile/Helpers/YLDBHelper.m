//
//  YLDBHelper.m
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import "YLDBHelper.h"
#import "FMDB.h"

@implementation YLDBHelper

static FMDatabase *db = nil;
+ (YLDBHelper *)sharedDBHelper {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

#pragma mark 打开数据库
- (void)openDB {
    if (db == nil) {
        NSString *dbPath = [kDocuments stringByAppendingPathComponent:@"Fexerlear.sqlite"];
        db = [FMDatabase databaseWithPath:dbPath];
        DLog(@"%@",dbPath);
    }
    [db open];
    
    if (self.isHome == YES) { //首页表
        // 首页表
        [db executeUpdate:@"CREATE TABLE HomeTable (name text)"];
        
    } else { // 投资页表
        [db executeUpdate:@"CREATE TABLE AllTable (name text)"];
        
        
    }
    
    
}

#pragma mark 关闭数据库
- (void)closeDB {
    [db close];
}






#pragma mark 删除首页项目
- (void)deleteHomeProject {
    
    [db executeUpdate:@"DELETE FROM HomeTable"];
    
}



#pragma mark - 我要投资页面的项目
#pragma mark 插入项目
- (void)insertAllProjects:(NSMutableArray *)array {
    
//    for (HHInves *inves in array) {
//        [db executeUpdate:@"INSERT INTO AllProjectsTable (guarantee, name, sn, annualRate, span, amount, currentAmount, state, idStr) values (?, ?, ?, ?, ?, ?, ?, ?, ?)", inves.guarantee, inves.name, inves.sn, [NSNumber numberWithDouble:inves.annualRate], inves.span, [NSNumber numberWithInt:inves.amount], [NSNumber numberWithInt:inves.currentAmount], [NSNumber numberWithInt:inves.state], inves.idStr];
//    }
}



#pragma mark 查询项目
- (NSMutableArray *)selectAllProjects {
    
    NSMutableArray *tmpArr = [NSMutableArray array];
    
    FMResultSet *resultSet = [db executeQuery:@"SELECT * FROM HomeTable"];
    
    while ([resultSet next]) {
        
//        HHInves *inves = [HHInves new];
//        inves.guarantee = [resultSet stringForColumn:@"guarantee"];
//        inves.annualRate = [resultSet doubleForColumn:@"annualRate"];
//        inves.amount = [resultSet intForColumn:@"amount"];
//        
//        [tmpArr addObject:inves];
    }
    
    [resultSet close];
    return tmpArr;
    
}


@end
