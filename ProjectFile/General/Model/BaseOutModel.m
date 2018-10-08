//
//  BaseOutModel.m
//  ProjectFile
//
//  Created by Fexerlear on 2018/10/8.
//  Copyright © 2018年 Fexerlear. All rights reserved.
//

#import "BaseOutModel.h"

@implementation BaseOutModel
@synthesize resmsg = _resmsg;

/**
 *  统一的返回消息的处理，判定是否为空，统一返回 @""
 */
- (NSString *)resmsg {
    if (IsStrEmpty(_resmsg)) {
        _resmsg = @"未知错误";
    }
    return _resmsg;
}


@end
