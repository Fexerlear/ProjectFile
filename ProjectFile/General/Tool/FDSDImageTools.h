//
//  FDSDImageTools.h
//  FDProject
//
//  Created by yc on 16/4/28.
//  Copyright © 2016年 fexerlear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDSDImageTools : NSObject

+(FDSDImageTools*)imageInstance;

/**
 *  异步加载图片
 *
 *  @param imageView      需要加载图片的View
 *  @param imageURLString 图片的路径
 *  @param image          占位图
 */
+ (void)setImageToView:(UIImageView *)imageView WithImageURLString:(NSString *)imageURLString placeholderImage:(UIImage *)image;

/**
 *  根据网络状态显示图片
 *
 *  @param url              URL
 *  @param isWIFI           是否是WIFI
 *  @param isOn             是否开启了无图模式
 *  @param placeholderImage 占位图
 */
+ (void)setImageToView:(UIImageView *)imageView withCurrentNetworkURL:(NSURL *)url isWIFI:(BOOL)isWIFI isSwitchOn:(BOOL)isOn WIFIWithplaceholderImage:(UIImage *)placeholderImage;



/**
 *  取消下载中的任务
 */
+ (void)cancelAllDownload;

/**
 *  清除内存图片
 */
+ (void)clearMemoryImage;

/**
 *  清除磁盘缓存图片
 */
+ (void)cleanDiskImage;


@end
