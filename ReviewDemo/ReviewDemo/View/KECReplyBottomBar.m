//
//  KECReplyBottomBar.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/27.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECReplyBottomBar.h"

@interface KECReplyBottomBar ()<UITextFieldDelegate>

@end
@implementation KECReplyBottomBar

- (void)awakeFromNib{
    _pageButton.layer.cornerRadius = 5;
    _pageButton.clipsToBounds = YES;
    
    _replyTextField.delegate = self;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (_delegate && [_delegate respondsToSelector:@selector(clickReplyTextFieldWithBottomBar:)]) {
        [_delegate clickReplyTextFieldWithBottomBar:self];
    }
    return NO;
}

- (IBAction)clickButton:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(clickPageButtonWithBottomBar:)]) {
        [_delegate clickPageButtonWithBottomBar:self];
    }
    
}
@end
