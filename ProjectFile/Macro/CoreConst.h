
/**
 *
 #pragma clang diagnostic push
 #pragma clang diagnostic ignored ""

 #pragma clang diagnostic pop
 */

// 补充id     com.orange.ci.orangeexpert          cn.com.zte.it.FDProject


/**************************************************************************************
 
 ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 本类主要是存放一些可变的宏定义，用在开发阶段使用，在需求改变的同时通过宏定义进行代码的自我判断过程，
 不用开发人员进行代码的注释及重新构写
 
 **************************************************************************************/



/**
 *  是否加密请求接口
 *  如果不需要，请注释此定义
 */
//#define ISENCRYPUSEDES_MACRO 1

/**
 *  是否加密过返回数据
 *  如果没加密返回数据，请注释此定义
 */
//#define ISENCRYPUSEDES_Response_MACRO 1

/**
 *  欢迎页面,不需要的时候注释此代码
 */
//#define WelcomePageMacro 1

/**
 *  导航栏隐藏是否需要动画，默认需要,注释表示不需要
 */
//#define YL_Nav_Animation 1

/**
 *  展示新版本特性
 */
//#define NewVersionInfoMacro 1

/**
 *  自输入端口验证，不需要请注释
 */
//#define YL_ChoosePort_Macro 1

/**
 *  开启弹框显示网络信息
 */
//#define AlertNotification_WiFi_Macro

//---------------------------------开放相关功能专用----------------------start
/**
 *  是否需要https验证，不需要请注释
 */
//#define YL_SecurityPolicy 1

/**
 *  检测应用更新
 */
//#define YL_APPUpdate_Plan 1

/**
 *  日志收集
 */
#define YL_LogInfo_Macro 1



//---------------------------------开放相关功能专用-----------------------end





#ifdef DEBUG


//#define YL_Test_Macro 1


#endif





