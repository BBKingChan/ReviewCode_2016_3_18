//
//  UIImageView+Extension.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/22.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Extension)
- (void)setImageViewWithUrlString:(NSString *)urlString;
- (void)setImageViewWithUrlString:(NSString *)urlString DefaultImage:(NSString *)defaultImage;
- (void)setImageViewRefreshCachedWithUrlString:(NSString *)urlString;

- (void)setScaleAspectFillMode;
- (void)setRoundImageView;

@end
