//
//  KECReplyBottomBar.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/27.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KECReplyBottomBar;
@protocol KECReplyBottomBarDelegate <NSObject>

- (void)clickReplyTextFieldWithBottomBar:(KECReplyBottomBar *)bottomBar;
- (void)clickPageButtonWithBottomBar:(KECReplyBottomBar *)bottomBar;

@end
@interface KECReplyBottomBar : UIView

@property (weak, nonatomic) IBOutlet UIButton *pageButton;
@property (weak, nonatomic) IBOutlet UITextField *replyTextField;
@property (nonatomic, weak) id<KECReplyBottomBarDelegate> delegate;

@end
