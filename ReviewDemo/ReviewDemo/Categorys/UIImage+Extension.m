//
//  UIImage+Extension.m
//  KidEducationCircle
//
//  Created by jiong23 on 15/6/4.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (instancetype)resizeImage:(UIImage *)image
{
    return [image stretchableImageWithLeftCapWidth:image.size.width / 3 topCapHeight:image.size.height / 2];
}

+ (instancetype)imageWithOriginalName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage*)scaleToSize:(CGSize)size for:(UIImage*) image
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    //    UIGraphicsBeginImageContext(size);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}
@end
