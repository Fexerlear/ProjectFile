//
//  AppDelegate.m
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import "AppDelegate.h"
#import "CALayer+Transition.h"
#import "YLAdvViewController.h"
#import <UMMobClick/MobClick.h>
#import "FDSDImageTools.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 是否是新版本，并选择
    [self newFeature];
    
    return YES;
}

- (void)newFeature {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window = window;
    [self loadUMPara];
    
    
    if ([YLFunction canShowNewFeature]) {
        
        window.rootViewController = [YLAdvViewController newFeatureVCWithEnterBlock:^{
            
            [self enter];
            
        }];
        
    } else {
        
        [self enter];
    }
    
    [window makeKeyAndVisible];
}

- (void)enter{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    UIViewController *vc = [storyboard instantiateInitialViewController];
    
    self.window.rootViewController = vc;
    [self.window.layer transitionWithAnimType:TransitionAnimTypeRamdom subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:2.0f];
}

- (void)loadUMPara {
    
    UMConfigInstance.appKey = UM_AppKey;
    UMConfigInstance.channelId = UM_channelId;
    [MobClick startWithConfigure:UMConfigInstance];
    [MobClick setEncryptEnabled:YES]; // 将日志信息做加密处理
    
#ifdef DEBUG
    [MobClick setCrashReportEnabled:YES];
#endif
    
    
}

#pragma mark - 内存处理
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    
    [FDSDImageTools cancelAllDownload];
    [FDSDImageTools clearMemoryImage];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
