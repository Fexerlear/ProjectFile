//
//  YLNavigationController.m
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import "YLNavigationController.h"


@interface YLNavigationController ()

@end

@implementation YLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize
{
    
    [self setupNavigationBarTheme];
    
    // 设置UIBarButtonItem的主题
    [self setupBarButtonItemTheme];
}
+ (void)setupNavigationBarTheme
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    [appearance setBackgroundImage:[UIImage imageNamed:@"navbj"] forBarMetrics:UIBarMetricsDefault];

    
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName ]=[UIFont systemFontOfSize:18];
    [appearance setTitleTextAttributes:textAttrs];
}

+ (void)setupBarButtonItemTheme
{
    // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    [appearance setTintColor:[UIColor whiteColor]];
    
    /**设置文字属性**/
    // 设置普通状态的文字属性
//    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[UITextAttributeTextColor] = [UIColor orangeColor];
//    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:15];
//    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
//    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    
//    // 设置高亮状态的文字属性
//    NSMutableDictionary *highTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
//    highTextAttrs[UITextAttributeTextColor] = [UIColor redColor];
//    [appearance setTitleTextAttributes:highTextAttrs forState:UIControlStateHighlighted];
//    
//    // 设置不可用状态(disable)的文字属性
//    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
//    disableTextAttrs[UITextAttributeTextColor] = [UIColor lightGrayColor];
//    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    

}



//拦截所有的push操作
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    DLog(@"%@",[viewController class]);
//    if (self.viewControllers.count > 0) {
////                    viewController.hidesBottomBarWhenPushed = YES;
//        if ([viewController isKindOfClass:[MineCountViewController class]]){
//           viewController.hidesBottomBarWhenPushed = NO;
//            
//
//            
//
//        }else{
//        
//            viewController.hidesBottomBarWhenPushed = YES;
//        }
//        
//        viewController.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav-return"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
//    }
//    [super pushViewController:viewController animated:animated];
}

- (void)back
{

    [self popViewControllerAnimated:YES];
}


-(NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    

    if (self.canPop) {
        
        [super popToRootViewControllerAnimated:animated];
    }
    self.canPop=NO;
    return nil;
}
@end
