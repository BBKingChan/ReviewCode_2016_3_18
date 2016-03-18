//
//  KECShareView.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/14.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECShareView.h"
@implementation KECShareView

- (void)awakeFromNib{
    _timeLineButton.layer.cornerRadius = 5;
    _timeLineButton.clipsToBounds = YES;
    
    _cancelButton.layer.cornerRadius = 5;
    _cancelButton.clipsToBounds = YES;
}

- (IBAction)didClickShareButton:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(shareView:didSelectedShareButtonWithIndex:)]) {
        UIButton *button = sender;
        [_delegate shareView:self didSelectedShareButtonWithIndex:button.tag];
    }
}


- (IBAction)cancel:(id)sender {
    [self dismiss];
}

- (void)show{
    [UIView animateWithDuration:0.3 animations:^{
        self.y = 0;
    }];
}

- (void)dismiss{
    [UIView animateWithDuration:0.5 animations:^{
        self.y = APP_HEIGHT;
    }];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}


@end
