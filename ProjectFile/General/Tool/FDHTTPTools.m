//
//  FDHTTPTools.m
//  FDProject
//
//  Created by yc on 16/4/28.
//  Copyright © 2016年 fexerlear. All rights reserved.
//

#import "FDHTTPTools.h"
#import "AFNetworking.h"




@implementation FDHTTPTools


#ifdef YL_ChoosePort_Macro
+ (void)initialize {
    [FDUserInfoTool setIPString:SERVERURL];
    
}
#endif







#pragma mark - ==============通用=============
/**
 *  验证--证书cer
 */
+ (AFSecurityPolicy*)customSecurityPolicy {
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"FDHttpsCer" ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式，是要验证整个证书的，包括日期等
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
//    securityPolicy.validatesDomainName = YES;
    
    securityPolicy.pinnedCertificates = [NSSet setWithObject:certData];
    
    return securityPolicy;
}


/**
 *  取消所有的请求
 */
+ (void)canceAllRequest {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.operationQueue cancelAllOperations];
}

/**
 *  通用POST请求方法
 *
 *  @param URLString  请求路径
 *  @param parameters 请求参数
 *  @param success    请求成功返回的数据
 *  @param failure    请求失败返回的数据
 */
+ (void)POSTWithURL:(NSString *)URLString
         parameters:(id)parameters
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [[self class] otherSetProperty:manager];
    
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        !success ? : success(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        !failure ? : failure(error);
    }];
}

/**
 *  通用GET请求方法
 *
 *  @param URLString  请求路径
 *  @param parameters 请求参数
 *  @param success    请求成功返回的数据
 *  @param failure    请求失败返回的数据
 */
+ (void)GETWithURL:(NSString *)URLString
        parameters:(NSDictionary *)params
           success:(void (^)(id responseObject))success
           failure:(void (^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [[self class] otherSetProperty:manager];
    [manager GET:URLString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        !success ? : success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        !failure ? : failure(error);
    }];
    
}



/**
 *  属性配置
 *
 *  @param manager AFHTTPSessionManager对象
 */
+ (void)otherSetProperty:(AFHTTPSessionManager *)manager {
    
    // 接受类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html", @"text/plain", nil]];
    [manager.requestSerializer setTimeoutInterval:YLTimeOutInterval];

    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    
}






@end
