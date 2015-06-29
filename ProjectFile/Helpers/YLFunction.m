//
//  YLFunction.m
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import "YLFunction.h"
#import "RegexKitLite.h"
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

#pragma mark - 验证信息
// 手机号码验证
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    NSString * phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    BOOL isMatch = [mobileNum isMatchedByRegex:phoneRegex];
    return isMatch;
}

// 邮箱验证
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [email isMatchedByRegex:emailRegex];
}

//用户名
+ (BOOL) validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{4,20}+$";
    return [name isMatchedByRegex:userNameRegex];
}

//密码
+ (BOOL) validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,12}+$";
    
    return [passWord isMatchedByRegex:passWordRegex];
}

//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    if (identityCard.length <= 0) {
        return NO;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    return [identityCard isMatchedByRegex:regex2];
}

//银行卡
+ (BOOL) validateBankCardNumber: (NSString *)bankCardNumber
{
    if (bankCardNumber.length <= 0) {

        return NO;
    }
    NSString *regex2 = @"^(\\d{15,30})";
    return [bankCardNumber isMatchedByRegex:regex2];
}

//银行卡后四位
+ (BOOL) validateBankCardLastNumber: (NSString *)bankCardNumber
{

    if (bankCardNumber.length != 4) {

        return NO;
    }
    NSString *regex2 = @"^(\\d{4})";
    return [bankCardNumber isMatchedByRegex:regex2];
}

//CVN
/*Card Vеrification Number，卡确认码/安全码。这是银行卡用于非直接场合，如网络支付等下交易使用的。可以识别银行卡交易的在场性。一般可见于银行卡背面的签名条一串数列的末三位。*/
+ (BOOL) validateCVNCode: (NSString *)cvnCode
{

    if (cvnCode.length <= 0) {

        return NO;
    }
    NSString *regex2 = @"^(\\d{3})";
    return [cvnCode isMatchedByRegex:regex2];
}

//verifyCode 验证码
+ (BOOL) validateVerifyCode: (NSString *)verifyCode
{

    if (!(verifyCode.length == 6)) {

        return NO;
    }
    NSString *regex2 = @"^(\\d{6})";
    return [verifyCode isMatchedByRegex:regex2];
}

#pragma mark - 获取当前日期，转换为字符串
+(NSString *)stringWithDateOfToday{
    //获取今日 日期
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}

#pragma mark - 晃动效果
+ (void)shakeAction:(UIView *)view
{
    // 晃动次数
    static int numberOfShakes = 4;
    // 晃动幅度（相对于总宽度）
    static float vigourOfShake = 0.04f;
    // 晃动延续时常（秒）
    static float durationOfShake = 0.5f;
    
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // 关键帧（点）
    CGPoint layerPosition = view.layer.position;
    
    // 起始点
    NSValue *value1=[NSValue valueWithCGPoint:view.layer.position];
    // 关键点数组
    NSMutableArray *values = [[NSMutableArray alloc] initWithObjects:value1, nil];
    for (int i = 0; i<numberOfShakes; i++) {
        // 左右晃动的点
        NSValue *valueLeft = [NSValue valueWithCGPoint:CGPointMake(layerPosition.x-view.frame.size.width*vigourOfShake*(1-(float)i/numberOfShakes), layerPosition.y)];
        NSValue *valueRight = [NSValue valueWithCGPoint:CGPointMake(layerPosition.x+view.frame.size.width*vigourOfShake*(1-(float)i/numberOfShakes), layerPosition.y)];
        
        [values addObject:valueLeft];
        [values addObject:valueRight];
    }
    // 最后回归到起始点
    [values addObject:value1];
    
    shakeAnimation.values = values;
    shakeAnimation.duration = durationOfShake;
    
    
    // 添加动画
    [view.layer addAnimation:shakeAnimation forKey:kCATransition];
}

#pragma mark - 删除本地个人登陆信息文件
+ (void)deleteAccountData{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    DLog(@"%@",kDocuments);
    
    NSString *filePath = [kDocuments stringByAppendingPathComponent:@"account.data"];
    BOOL res=[fileManager removeItemAtPath:filePath error:nil];
    if (res) {

    }else {
        DLog(@"文件删除失败");
    }
    DLog(@"文件是否存在: %@",[fileManager isExecutableFileAtPath:filePath]?@"YES":@"NO");
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
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(kScreenW * screenScale, kScreenH * screenScale), YES, 0);
    //设置截屏大小
    [[[[UIApplication sharedApplication] keyWindow] layer] renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    CGImageRef imageRef = viewImage.CGImage;
    CGRect rect = CGRectMake(0, 0, kScreenW * screenScale,kScreenH * screenScale);
    
    CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, rect);
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    return sendImage;
}

#pragma mark - 设备型号判断
+ (NSString *) platform{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString *) platformString{
    NSString *platform = [self platform];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (GSM)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air (CDMA)";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (CDMA)";
    
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini Retina (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini Retina (CDMA)";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad Mini 3 (WiFi)";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad Mini 3 (CDMA)";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad Mini 3 (CDMA)";
    
    
    if ([platform isEqualToString:@"i386"])         return [UIDevice currentDevice].model;
    if ([platform isEqualToString:@"x86_64"])       return [UIDevice currentDevice].model; // 模拟器
    
    return platform;
}

#pragma mark - 系统版本
+ (void)getIOSMessage
{
    
    UIDevice *device = [UIDevice currentDevice];
    NSString *name = device.name;		//获取设备所有者的名称
    NSString *model = device.name;		//获取设备的类别
    NSString *type = device.localizedModel; //获取本地化版本
    NSString *systemName = device.systemName;	//获取当前运行的系统
    NSString *systemVersion = device.systemVersion;//获取当前系统的版本
    NSString *identifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString]; //获取设备的唯一标示符
    float batteryLevel = [UIDevice currentDevice].batteryLevel; // 电池电量
    
    /**
     *  http://blog.csdn.net/decajes/article/details/41807977
     */
    
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *mCarrier = [NSString stringWithFormat:@"%@",[carrier carrierName]];   // 运营商信息
    
    DLog(@"name%@",name);
        DLog(@"model%@",model);
        DLog(@"type%@",type);
        DLog(@"systemName%@",systemName);
        DLog(@"systemVersion%@",systemVersion);
        DLog(@"identifier%@",identifier);
        DLog(@"batteryLevel%f",batteryLevel);
        DLog(@"mCarrier%@",mCarrier);

    
}

#pragma mark - 将对象转换为字符串
UIKIT_EXTERN NSString *NSStringFromIDValue(id value)
{
    return [NSString stringWithFormat:@"%@", value];
}



@end
