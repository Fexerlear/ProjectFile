//
//  RectMacro.h
//  FDProject
//
//  Created by yc on 16/5/30.
//  Copyright © 2016年 fexerlear. All rights reserved.
//

#ifndef RectMacro_h
#define RectMacro_h


/*----------------------屏幕宽高----------------------*/
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_Frame [UIScreen mainScreen].bounds
#define SCREEN_Bounds [UIScreen mainScreen].bounds
#define SCREEN_Size [UIScreen mainScreen].bounds.size

/**
 *  屏幕比例
 */
#define SCREEN_X_Width_Scacle (SCREEN_WIDTH / 375.0)
#define SCREEN_Y_Height_Scacle (SCREEN_HEIGHT / 667.0)


/**
 *  状态栏和导航栏的高度
 */
#define VIEW_BODY_OFFSET_Y (64.0f)

/**
 *  statusbar高度
 */
#define Statusbar_Height (20.0f)

/**
 *  NavigationBar高度
 */
#define NavigationBarHeight (44.0f)

/**
 *  tabbar高度
 */
#define Tabbar_Height (49.0f)

/**
 *  tabbar icon 尺寸
 */
#define Tabbar_Icon_Size (30.0f)

/**
 *  工具栏高度
 */
#define ToolBar_Height (44.0f)

/**
 *  默认零
 */
#define YLFrame_Zero 0


/*------------------设备-------------------*/
#define iPhone6_Last (SCREEN_WIDTH > 320.0)

#endif /* RectMacro_h */
