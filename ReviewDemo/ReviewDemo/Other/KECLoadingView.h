//
//  KECLoadingView.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/21.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KECLoadingView : UIView

+ (void)showLoadingViewToView:(UIView *)view;
+ (void)showNewLoadingViewToView:(UIView *)view;
+ (void)hideLoadingViewToView:(UIView *)view;
@end
