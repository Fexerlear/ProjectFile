//
//  YLAdvViewController.m
//  ProjectFile
//
//  Created by hh on 15/6/26.
//  Copyright (c) 2015年 Fexerlear. All rights reserved.
//

#import "YLAdvViewController.h"
#import "YLTabBarViewController.h"


#import "UIView+Extension.h"


#import "UIApplication+Extend.h"
#import "CoreArchive.h"


#import <ImagePlayerView.h>

#define kImageCount 5
@interface YLAdvViewController ()<ImagePlayerViewDelegate>
@property (nonatomic,strong) NSMutableArray * imageURLs;

@property (nonatomic,strong) ImagePlayerView *imagePlayerView;


@property (nonatomic,copy) void(^enterBlock)();

@end

@implementation YLAdvViewController

/*
 *  初始化
 */
+ (instancetype)newFeatureVCWithEnterBlock:(void (^)())enterBlock {
  
    YLAdvViewController *newFeatureVC = [[YLAdvViewController alloc] init];
    newFeatureVC.imageURLs = [NSMutableArray array];

    //记录block
    newFeatureVC.enterBlock =enterBlock;
    
    return newFeatureVC;
}

-(void)saveVersion{
    
    //系统直接读取的版本号
    NSString *versionValueStringForSystemNow=[UIApplication sharedApplication].version;
    
    //保存版本号
    [CoreArchive setStr:versionValueStringForSystemNow key:kNewFeatureVersionKey];
}



-(void)dismiss{
    
    if(self.enterBlock != nil) _enterBlock();
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self addScrollViewInView];
    
}

//监听按钮点击
-(void)btnClick
{
    
    YLTabBarViewController *tabBarVc=[[YLTabBarViewController alloc]init];
    tabBarVc.view.backgroundColor=[UIColor yellowColor];
    
//    [self presentViewController:tabBarVc animated:YES completion:nil];
    
    [self dismiss];
    
}

#pragma mark 新版添加轮播图
- (void)addScrollViewInView {
    
    self.imagePlayerView=[[ImagePlayerView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    
    self.imagePlayerView.imagePlayerViewDelegate = self;
    _imagePlayerView.scrollInterval = MAXFLOAT;
    _imagePlayerView.pageControlPosition = ICPageControlPosition_BottomCenter;
    _imagePlayerView.hidePageControl = NO;
    
    self.view = self.imagePlayerView;
    
    [self addPicInImagePlayView];
    
    [_imagePlayerView reloadData];
    
}

- (void)addPicInImagePlayView {
    
    for (int i=0; i < kImageCount; i++) {
        NSString *name=[NSString stringWithFormat:@"qd%d",i+1];
        UIImage *img=[UIImage imageNamed:name];
        [self.imageURLs addObject:img];
        
    }
    
}

#pragma mark - ImagePlayerViewDelegate
- (NSInteger)numberOfItems
{
    return self.imageURLs.count;
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{
    
    imageView.image = self.imageURLs[index];
    //最后一张图片
    if (index == kImageCount - 1) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"qdan02"] forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [imageView addSubview:btn];
        
        btn.center=CGPointMake(kScreenW*0.5, kScreenH-96);
        btn.bounds=CGRectMake(0, 0, 100,100);
        
    }
    
}



@end
