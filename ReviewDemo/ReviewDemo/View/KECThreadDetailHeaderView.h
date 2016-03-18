//
//  KECThreadDetailHeaderView.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/10/20.
//  Copyright © 2015年 Chenjz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KECThreadDetail.h"
@class KECThreadDetailHeaderView;

@protocol KECThreadDetailHeaderViewDelegate <NSObject>

- (void)threadDetailHeaderView:(KECThreadDetailHeaderView *)headerView concerHost:(KECThreadDetail *)host;
- (void)threadDetailHeaderViewJumpToForum;
@end
@interface KECThreadDetailHeaderView : UIView

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *forumButton;
@property (nonatomic, strong) KECThreadDetail *threadDetail;
@property (nonatomic, weak) id<KECThreadDetailHeaderViewDelegate> delegate;


@end
