/*
 
    本类作为一个项目功能类，用于解决项目中遇到的各种验证，算法，工具
 
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YLFunction : NSObject

/*是否应该显示版本新特性界面*/
+(BOOL)canShowNewFeature;

/*手机号码验证*/
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/*密码验证*/
+ (BOOL) validatePassword:(NSString *)passWord;

/*获取当前日期的字符串*/
+(NSString *)stringWithDateOfToday;

/*晃动效果*/
+ (void)shakeAction:(UIView *)view;

/*删除本地个人信息*/
+ (void)deleteAccountData;

/*后台模糊效果*/
+(void)addBlurEffect;
+(void)removeBlurEffect;

/*判断设备型号*/
+ (NSString *) platform;
+ (NSString *) platformString;

/*设备信息*/
+ (void)getIOSMessage;

/*将对象转换为字符串*/
UIKIT_EXTERN NSString *NSStringFromIDValue(id value);

@end
