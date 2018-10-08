//
//  FDSDImageTools.m
//  FDProject
//
//  Created by yc on 16/4/28.
//  Copyright © 2016年 fexerlear. All rights reserved.
//

#import "FDSDImageTools.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"


static FDSDImageTools *imageInstance;
@implementation FDSDImageTools


+(FDSDImageTools*)imageInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        imageInstance = [[FDSDImageTools alloc] init];
    });
    
    return imageInstance;
}

+ (void)setImageToView:(UIImageView *)imageView WithImageURLString:(NSString *)imageURLString placeholderImage:(UIImage *)image {
    
    NSURL *URL = [NSURL URLWithString:imageURLString];
    [imageView sd_setImageWithURL:URL placeholderImage:image];
    
    
}


+ (void)setImageToView:(UIImageView *)imageView withCurrentNetworkURL:(NSURL *)url isWIFI:(BOOL)isWIFI isSwitchOn:(BOOL)isOn WIFIWithplaceholderImage:(UIImage *)placeholderImage {
    
    if (isOn) {
        isWIFI ? [imageView sd_setImageWithURL:url placeholderImage:placeholderImage]: [imageView setImage:placeholderImage];
    }else
    {
        [imageView sd_setImageWithURL:url placeholderImage:placeholderImage];
    }

}



+ (void)cancelAllDownload {
    [[SDWebImageManager sharedManager] cancelAll];
}

+ (void)clearMemoryImage {
    
    [[SDImageCache sharedImageCache] clearMemory];
    
}

+ (void)cleanDiskImage {
    
    [[SDImageCache sharedImageCache] cleanDisk];
    
}


@end
