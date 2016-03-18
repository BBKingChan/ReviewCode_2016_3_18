//
//  UIImageView+Extension.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/22.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "UIImageView+Extension.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (Extension)
- (void)setImageViewWithUrlString:(NSString *)urlString {
   [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"default"] options:SDWebImageLowPriority|SDWebImageRetryFailed];
}


- (void)setImageViewWithUrlString:(NSString *)urlString DefaultImage:(NSString *)defaultImage {
    [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:defaultImage] options:SDWebImageLowPriority|SDWebImageRetryFailed];
}

- (void)setImageViewRefreshCachedWithUrlString:(NSString *)urlString {
    [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"default"] options:SDWebImageLowPriority|SDWebImageRetryFailed|SDWebImageRefreshCached];
}

- (void)setScaleAspectFillMode {
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
}

- (void)setRoundImageView {
    self.layer.cornerRadius = self.width / 2;
    self.clipsToBounds = YES;
}

@end
