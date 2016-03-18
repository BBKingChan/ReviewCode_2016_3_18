//
//  KECHomeBottomBar.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/28.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KECHomePost.h"

@class KECHomeBottomBar;
@protocol KECHomeBottomBarDelegate <NSObject>

- (void)homeBottomBar:(KECHomeBottomBar *)bottomBar didSelectedButtonWithIndex:(NSInteger)index;

@end
@interface KECHomeBottomBar : UIView
@property (nonatomic, strong) KECHomePost *homePost;
@property (nonatomic, weak) id <KECHomeBottomBarDelegate> delegate;
@property (nonatomic, weak) UIButton *likeButton;
@end
