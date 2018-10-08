//
//  YLFunction.m
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import "YLFunction.h"
#import "UIImage+Extend.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#import "CoreArchive.h"
#import "UIApplication+Extend.h"

// 获取运营商
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>


#define screenScale ([UIScreen mainScreen].scale)

#define effectTag 19999



@implementation YLFunction

#pragma mark - 是否进入新版本介绍页面
+(BOOL)canShowNewFeature{
    
    //系统直接读取的版本号
    NSString *versionValueStringForSystemNow=[UIApplication sharedApplication].version;
    
    //读取本地版本号
    NSString *versionLocal = [CoreArchive strForKey:kNewFeatureVersionKey];
    
    if(versionLocal!=nil && [versionValueStringForSystemNow isEqualToString:versionLocal]){//说明有本地版本记录，且和当前系统版本一致
        
        return NO;
        
    }else{//无本地版本记录或本地版本记录与当前系统版本不一致
        
        //保存
//        [CoreArchive setStr:versionValueStringForSystemNow key:kNewFeatureVersionKey];
        
        return YES;
    }
}


#pragma mark - 添加毛玻璃效果
+(void)addBlurEffect
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.tag = effectTag;
    imageView.image = [self blurImage];
    [[[UIApplication sharedApplication] keyWindow] addSubview:imageView];
}
+(void)removeBlurEffect
{
    NSArray *subViews = [[UIApplication sharedApplication] keyWindow].subviews;
    for (id object in subViews) {
        if ([[object class] isSubclassOfClass:[UIImageView class]]) {
            UIImageView *imageView = (UIImageView *)object;
            if(imageView.tag == effectTag)
            {
                [UIView animateWithDuration:1 animations:^{
                    imageView.alpha = 0;
                    [imageView removeFromSuperview];
                }];
                
            }
        }
    }
}


//毛玻璃效果
+(UIImage *)blurImage
{
    UIImage *image = [[self screenShot] imgWithBlur];
    //保存图片到照片库(test)
//    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    return image;
}
//屏幕截屏
+(UIImage *)screenShot
{
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(([UIScreen mainScreen].bounds.size.width) * screenScale, ([UIScreen mainScreen].bounds.size.height) * screenScale), YES, 0);
    //设置截屏大小
    [[[[UIApplication sharedApplication] keyWindow] layer] renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    CGImageRef imageRef = viewImage.CGImage;
    CGRect rect = CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width) * screenScale,([UIScreen mainScreen].bounds.size.height) * screenScale);
    
    CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, rect);
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    return sendImage;
}


#pragma mark - 将对象转换为字符串
UIKIT_EXTERN NSString *NSStringFromIDValue(id value)
{
    return [NSString stringWithFormat:@"%@", value];
}



@end
