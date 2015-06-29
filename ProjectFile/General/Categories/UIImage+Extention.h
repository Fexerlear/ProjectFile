//
//  UIImage+Extention.h
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extention)

+ (UIImage *)resizedImage:(NSString *)name;

/*
 1.白色,参数:
 透明度 0~1,  0为白,   1为深灰色
 半径:默认30,推荐值 3   半径值越大越模糊 ,值越小越清楚
 色彩饱和度(浓度)因子:  0是黑白灰, 9是浓彩色, 1是原色  默认1.8
 “彩度”，英文是称Saturation，即饱和度。将无彩色的黑白灰定为0，最鲜艳定为9s，这样大致分成十阶段，让数值和人的感官直觉一致。
 */
- (UIImage *)imgWithLightAlpha:(CGFloat)alpha radius:(CGFloat)radius colorSaturationFactor:(CGFloat)colorSaturationFactor;
- (UIImage *)imgWithBlur;


@end
