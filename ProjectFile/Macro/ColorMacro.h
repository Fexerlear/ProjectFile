//
//  ColorMacro.h
//  FDProject
//
//  Created by yc on 16/5/19.
//  Copyright © 2016年 fexerlear. All rights reserved.
//

#ifndef ColorMacro_h
#define ColorMacro_h

// 头文件引入
#import "UIColor+JKHEX.h"


/*----------------------颜色----------------------*/
#define RGB(r, g, b)  RGBAlpha(r,g,b,1.0)
#define RGBAlpha(R,G,B,A) [UIColor colorWithRed:(float)R/255.0f green:(float)G/255.0f blue:(float)B/255.0f alpha:(float)A]

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromHex(hexString) [UIColor jk_colorWithHexString:hexString]

/**
 *  NavigationBarColor
 */
#define NavigationBarColor [UIColor blackColor]

/**
 *  ViewBackGroundColor
 */
#define ViewBackGroundColor [UIColor whiteColor]

/** 
 *  清除背景色
 */
#define CLEARCOLOR [UIColor clearColor]

/**
 *  按钮可以使用的颜色
 */
#define ButtonNormalColor [UIColor jk_colorWithHexString:"#ff6600"]
#define ButtonNormal_TitleColor [UIColor jk_colorWithHexString:"#ffffff"]
#define CancelButtonNormalColor [UIColor jk_colorWithHexString:"#8f8f8f"]
/**
 *  按钮不可使用
 */
#define ButtonDisableColor [UIColor jk_colorWithHexString:"#dfdfdf"]
#define ButtonDisable_TitleColor [UIColor jk_colorWithHexString:"#b9b8b8"]
/**
 *  文本可用
 */
#define TextFieldNormalColor [UIColor jk_colorWithHexString:"#666666"]


/**
 *  文本不可用
 */
#define TextFieldDisableColor [UIColor redColor]





#endif /* ColorMacro_h */
