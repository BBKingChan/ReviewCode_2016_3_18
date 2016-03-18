//
//  KECThreadDetailCell.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/7.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECThreadDetailCell.h"
#import "DTAttributedTextCell.h"
#import "DTCSSStylesheet.h"
#import "DTLog.h"
#import "DTLazyImageView.h"
@interface KECThreadDetailCell ()
@end
@implementation KECThreadDetailCell

+ (instancetype)postDetailCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseID = @"KECThreadDetailCell";
    KECThreadDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"KECThreadDetailCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)awakeFromNib{
    _avatarImageView.userInteractionEnabled = YES;
    _avatarImageView.layer.cornerRadius = _avatarImageView.width / 2;
    _avatarImageView.clipsToBounds = YES;
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(avatarTap:)];
    [_avatarImageView addGestureRecognizer:tapGR];
    
    _contentTextView.scrollEnabled = NO;
    _contentTextView.editable = NO;
//    _contentTextView.userInteractionEnabled = NO;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    KEGLog(@" point - %@",NSStringFromCGPoint(point));
//    return self;
//}

- (void)setThreadDetailFrame:(KECThreadDetailFrame *)threadDetailFrame{
    _threadDetailFrame = threadDetailFrame;
    
    KECThreadDetail *threadDetail = threadDetailFrame.threadDetail;
    
    _threadDetail = threadDetail;
    
    [_avatarImageView setImageViewWithUrlString:threadDetail.avatar];
    
    _nameLabel.text = threadDetail.username;
    
    _cityLabel.text = threadDetail.residecity;
    
    _floorLabel.text = [NSString stringWithFormat:@"%@楼",threadDetail.number];
    
    NSString *time = [NSDate intervalSinceNow:[NSDate dateWithTimeIntervalSince1970:[threadDetail.dateline integerValue]]];
    _timeLabel.text = time;
    
    
    
    if ([threadDetail.roleid integerValue] == 2) {
        NSString *major = threadDetail.major;
        if ([threadDetail.major containsString:@"null"]) {
            major = @"";
        }
        _majarLabel.text = major;
    }else{
        NSString *status;
        NSInteger pStatus = [threadDetail.pregnancystatus integerValue];
        switch (pStatus) {
            case 0:
                status = @"备孕中";
                break;
            case 1:{
                NSInteger count = 1;
                if (count == 1) {
                    status = @"一宝";
                }else if (count ==2){
                    status = @"二宝";
                }else{
                    status = @"有宝宝";
                }
            }
                break;
            case 2:
                status = @"怀孕中";
                break;
            default:
                break;
        }
        _majarLabel.text = status;
    }


    NSInteger ispraise = [threadDetail.ispraise integerValue];
    _likeButton.selected = ispraise > 0?YES:NO;
    
    
}

- (IBAction)clickThreadDetailAction:(UIButton *)sender {
    
    if (_actionDelegate && [_actionDelegate respondsToSelector:@selector(threadDetail:didSelectedActionButtonWithIndex:)]) {
        [_actionDelegate threadDetail:_threadDetail didSelectedActionButtonWithIndex:sender.tag];
    }
}

- (void)avatarTap:(UITapGestureRecognizer *)recognizer{
    if (_actionDelegate && [_actionDelegate respondsToSelector:@selector(clickThreadDetailAvatarWithThreadDetail:)]) {
        [_actionDelegate clickThreadDetailAvatarWithThreadDetail:_threadDetail];
    }
}
@end
