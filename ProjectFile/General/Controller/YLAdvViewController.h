//
//  YLAdvViewController.h
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLAdvViewController : UIViewController
/*
 *  初始化
 */
+(instancetype)newFeatureVCWithEnterBlock:(void(^)())enterBlock;

@end
