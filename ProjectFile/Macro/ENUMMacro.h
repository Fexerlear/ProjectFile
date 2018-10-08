//
//  ENUMMacro.h
//  FDProject
//
//  Created by yc on 16/5/18.
//  Copyright © 2016年 fexerlear. All rights reserved.
//



/**
 *  定义tag的范围
 *
 *  UIButton 11000 ~ 12000
 *
 *  UILable 12000 ~ 13000
 *
 *  UITextField 13000 ~ 14000
 *
 *  UIAlertView 15000 ~ 16000
 *
 *  UITabbarItem 16000 ~ 17000
 *
 *
 *
 *
 *
 *
 *  RequestTag 7000 ~ 8000
 *
 *
 *
 *
 */



#ifndef ENUMMacro_h
#define ENUMMacro_h




// 网络请求的TAG值
typedef NS_ENUM(NSInteger, RequestTag) {
    RequestTagFormal1 = 7000, // 正常请求的tag
    RequestTagFormal2,
    RequestTagFormal3,
    RequestTagFormal4,
    RequestTagFormal5,
    RequestTagFormal6,
    RequestTagFormal7,
    
    RequestTagOther1 = 7100, // 鉴权等tag
    RequestTagOther2,
    RequestTagOther3,
    RequestTagOther4,
    RequestTagOther5,
    
};

// 请求结果标识
typedef NS_ENUM(NSInteger, RequestResultTag) {
    RequestResultTagFormal1 = 7200, // 数据为空
    RequestResultTagFormal2, // 网络请求失败
    RequestResultTagFormal3, // 数据获取异常
    RequestResultTagFormalOther, // 预留
    
    
};


#endif /* ENUMMacro_h */
