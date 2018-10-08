//
//  URLsMacro.h
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#ifndef ProjectFile_URLsMacro_h
#define ProjectFile_URLsMacro_h

#define SERVERURL @"http://www.fexerlear.top/" // 测试环境 ，常开



// 服务器与APP接口公共入参
#define CON_APP_KEY @"101"// 通行证 101代表iOS 100代表Android
#define CON_Version @"1.0" // 协议版本号
#define CON_Secret @"ios_app" // 秘钥的使用



// 网络请求超时时间
#ifdef DEBUG
#define YLTimeOutInterval 8.0f
#else
#define YLTimeOutInterval 60.0f
#endif

// 获取验证码的时间.........
#define YLGetCodeNumberTime 60

// 这里的请求成功的参数均设置为 0
#define RequestSuccessCode @"0"



#endif




