/*
 
    本类作为一个项目功能类，用于解决项目中遇到的各种验证，算法，工具
 
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YLFunction : NSObject

/*是否应该显示版本新特性界面*/
+(BOOL)canShowNewFeature;



/*后台模糊效果*/
+(void)addBlurEffect;
+(void)removeBlurEffect;



/*将对象转换为字符串*/
UIKIT_EXTERN NSString *NSStringFromIDValue(id value);

@end
