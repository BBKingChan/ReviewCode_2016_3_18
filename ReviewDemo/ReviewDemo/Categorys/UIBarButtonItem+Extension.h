//
//  UIBarButtonItem+Extension.h
//  KidEducationCircle
//
//  Created by jiong23 on 15/6/4.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

+ (NSArray *)barButtonItemsWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
