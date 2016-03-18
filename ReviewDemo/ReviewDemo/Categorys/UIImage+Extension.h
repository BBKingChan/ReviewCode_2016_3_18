//
//  UIImage+Extension.h
//  KidEducationCircle
//
//  Created by jiong23 on 15/6/4.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  拉伸一张图片内部中间 1 * 1的区域，使其外部不变形
 *
 *  @param imageName 图片名称
 *
 *  @return 已拉伸好的图片
 */
+ (instancetype)resizeImage:(UIImage *)image;

/**
 *  加载最原始的没有渲染的图片，
 *
 *  @param imageName 图片名
 *
 *  @return 原始图片
 */
+ (instancetype)imageWithOriginalName:(NSString *)imageName;

/**
 *  缩放图片
 *
 *  @param size  size
 *  @param image 原图
 *
 *  @return 缩放后的图片
 */
+ (UIImage*)scaleToSize:(CGSize)size for:(UIImage*) image;
@end
