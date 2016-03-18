//
//  KECThreadDetailCell.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/7.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTCoreText.h"
#import "KECThreadDetail.h"
#import "KECThreadDetailFrame.h"
#import "KECForumContentTextView.h"
@class KECThreadDetail;

@protocol KECThreadDetailCellDelegate <NSObject>

@optional
- (void)threadDetail:(KECThreadDetail *)threadDetail didSelectedActionButtonWithIndex:(NSInteger)index;

- (void)clickThreadDetailAvatarWithThreadDetail:(KECThreadDetail *)threadDetail;

@end

@interface KECThreadDetailCell : UITableViewCell

@property (nonatomic, weak) id<KECThreadDetailCellDelegate> actionDelegate;

@property (nonatomic, strong) KECThreadDetailFrame *threadDetailFrame;

@property (nonatomic, strong) KECThreadDetail *threadDetail;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *majarLabel;

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@property (weak, nonatomic) IBOutlet UILabel *floorLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIButton *reportButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;

@property (weak, nonatomic) IBOutlet UIButton *replyButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@property (weak, nonatomic) IBOutlet KECForumContentTextView *contentTextView;

+ (instancetype)postDetailCellWithTableView:(UITableView *)tableView;

@end
