//
//  YLTabBarViewController.m
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import "YLTabBarViewController.h"

#import "YLNavigationController.h"



#import "YLAccount.h"
#import "YLAccountTool.h"

@interface YLTabBarViewController ()<UITabBarDelegate,UITabBarControllerDelegate>

@property (nonatomic,assign) BOOL isLogin;

@end

@implementation YLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self setupChildVc];
    

    self.delegate=self;
   

    
}

//接收到退出当前账号的通知
-(void)logoutNote
{
    
    

}

-(void)loginSucess
{
    

}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
    int index=(int)self.selectedIndex;

    DLog(@"%d",index);
    
    
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];

}

//添加子控制器
-(void)setupChildVc
{
    //添加首页控制器
//    HomeViewController *homeVc=[UIStoryboard storyboardWithName:@"HomeViewController" bundle:nil].instantiateInitialViewController;
//    [self addOneChlildVc:homeVc title:@"首页" imageName:@"normal－home" selectedImageName:@"selected－home"];
//    

    

}

- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] =[UIColor colorWithRed:203/255.0 green:203/255.0 blue:203/255.0 alpha:1.0];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12.5];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:157/255.0 green:15/255.0 blue:21/255.0 alpha:1.0];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    
    
    // 添加为tabbar控制器的子控制器
    YLNavigationController *nav = [[YLNavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
}

#pragma mark - 备份
- (void)checkLogin {

    
}

@end
