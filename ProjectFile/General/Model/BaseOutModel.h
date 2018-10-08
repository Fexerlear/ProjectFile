//
//  BaseOutModel.h
//  ProjectFile
//
//  Created by Fexerlear on 2018/10/8.
//  Copyright © 2018年 Fexerlear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseOutModel : NSObject


// 基本的输出信息
/**
 *  请求返回的Code值
 */
@property (copy, nonatomic, readonly) NSString *rescode;
/**
 *  和Code绑定的信息
 */
@property (copy, nonatomic, readonly) NSString *resmsg;
/**
 *  请求完成的当前时间
 */
@property (nonatomic, copy, readonly) NSString *timestamp;





@end
