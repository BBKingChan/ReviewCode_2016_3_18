//
//  KECThreadDetailHeaderView.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/10/20.
//  Copyright © 2015年 Chenjz. All rights reserved.
//

#import "KECThreadDetailHeaderView.h"

@implementation KECThreadDetailHeaderView

- (void)awakeFromNib{
  
    
}

- (IBAction)concerHost:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(threadDetailHeaderView:concerHost:)]) {
        [_delegate threadDetailHeaderView:self concerHost:self.threadDetail];
        
    }
}


- (IBAction)clickFourm:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(threadDetailHeaderViewJumpToForum)]) {
        [_delegate threadDetailHeaderViewJumpToForum];
        
    }
}

- (void)setThreadDetail:(KECThreadDetail *)threadDetail{
    _threadDetail = threadDetail;
    
    self.titleLabel.text = threadDetail.subject;
    
    [self.forumButton setTitle:threadDetail.fid forState:UIControlStateNormal];
}


@end
