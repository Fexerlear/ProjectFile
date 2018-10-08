//
//  FDHTTPTools.h
//  FDProject
//
//  Created by yc on 16/4/28.
//  Copyright © 2016年 fexerlear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDHTTPTools : NSObject

#pragma mark - 专用方法






#pragma mark - 通用的请求方法，不涉及到j.s的验证
/**
 *  通用的GET请求方法
 *
 *  @param URLString  请求路径
 *  @param parameters 请求参数
 *  @param success    请求成功返回的数据
 *  @param failure    请求失败返回的数据
 */
+ (void)GETWithURL:(NSString *)URLString
        parameters:(NSDictionary *)params
           success:(void (^)(id responseObject))success
           failure:(void (^)(NSError *error))failure;


/**
 *  通用的POST请求方法
 *
 *  @param URLString  请求路径
 *  @param parameters 请求参数
 *  @param success    请求成功返回的数据
 *  @param failure    请求失败返回的数据
 */
+ (void)POSTWithURL:(NSString *)URLString
         parameters:(id)parameters
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure;


/**
 *  取消所有的请求
 */
+ (void)canceAllRequest;




@end
