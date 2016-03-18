//
//  KECHomePostCell.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/18.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECHomePostCell.h"
#import "KECHomePost.h"
#import "KECHomePostFrame.h"
#import "KECHotPostPhotosView.h"
#import "KECHomeBottomBar.h"
#import "KECChild.h"
#import "TTTAttributedLabel.h"
//#import "KECTopicDetailViewController.h"

static inline NSRegularExpression * topicRegularExpression() {
    static NSRegularExpression *_topicRegularExpression = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _topicRegularExpression = [[NSRegularExpression alloc] initWithPattern:@"#[^@#]+?#" options:NSRegularExpressionCaseInsensitive error:nil];
    });
    
    return _topicRegularExpression;
}

@interface KECHomePostCell ()<TTTAttributedLabelDelegate>
@property (nonatomic, weak) UIView *containerView;
@property (nonatomic, weak) UIImageView *avatarImageView;
@property (nonatomic, weak) UILabel *authorLabel;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *messageLabel;
@property (nonatomic, weak) TTTAttributedLabel *messageAttrLabel;

@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, weak) UIImageView *indicatorImageView;
@property (nonatomic, weak) UIImageView *roleImageView;
@property (nonatomic, weak) UILabel *infoLabel;
@end
@implementation KECHomePostCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        
        [self setUpChildViews];
    }
    return self;
}

- (void)setUpChildViews{
    UIView *containerView = [[UIView alloc] init];
    [self.contentView addSubview:containerView];
    self.containerView = containerView;
    [self.containerView setBackgroundColor:[UIColor clearColor]];
    
    UIImageView *avatarImageView = [[UIImageView alloc] init];
    avatarImageView.layer.cornerRadius = kAvatarWH / 2;
    avatarImageView.clipsToBounds = YES;
    self.avatarImageView = avatarImageView;
    [self.containerView addSubview:avatarImageView];
    
    UILabel *authorLabel = [[UILabel alloc] init];
    self.authorLabel = authorLabel;
    authorLabel.textColor = MainColor;
    authorLabel.numberOfLines = 1;
    authorLabel.font = [UIFont systemFontOfSize:kAuthorFontSize];
    [self.containerView addSubview:authorLabel];
    
    UIImageView *roleImageView = [[UIImageView alloc] init];
    self.roleImageView = roleImageView;
    [self.containerView addSubview:roleImageView];
    
    UILabel *infoLabel = [[UILabel alloc] init];
    self.infoLabel = infoLabel;
    self.infoLabel.textColor = [UIColor lightGrayColor];
    self.infoLabel.font = [UIFont systemFontOfSize:kInfoFontSize];;
    [self.containerView addSubview:infoLabel];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    self.titleLabel = titleLabel;
    titleLabel.numberOfLines = 2;
    titleLabel.textColor = black_80;
    titleLabel.font = [UIFont systemFontOfSize:kTitleFontSize];
    [self.containerView addSubview:titleLabel];
    
    UIImageView *indicatorImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Indicator"]];
    self.indicatorImageView = indicatorImageView;
    [self.containerView addSubview:indicatorImageView];
    
    UILabel *messageLabel = [[UILabel alloc] init];
    self.messageLabel = messageLabel;
    self.messageLabel.textColor = RGB(112, 112, 112);
    messageLabel.numberOfLines = 4;
    messageLabel.font = [UIFont systemFontOfSize:kMessageFontSize];
//    [self.containerView addSubview:messageLabel];
    
    TTTAttributedLabel *messageAttrLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.messageAttrLabel = messageAttrLabel;
    self.messageAttrLabel.delegate = self;
    self.messageAttrLabel.font = [UIFont systemFontOfSize:kMessageFontSize];
    self.messageAttrLabel.textColor = RGB(112, 112, 112);
//    self.messageAttrLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.messageAttrLabel.numberOfLines = 4;
    self.messageAttrLabel.linkAttributes = [NSDictionary dictionaryWithObject:(__bridge id)[MainColor CGColor] forKey:(NSString *)kCTForegroundColorAttributeName];
    self.messageAttrLabel.activeLinkAttributes = [NSDictionary dictionaryWithObject:(__bridge id)[MainColor CGColor] forKey:(NSString *)kCTForegroundColorAttributeName];
    [self.containerView addSubview:messageAttrLabel];
    
    KECHotPostPhotosView *imageView = [[KECHotPostPhotosView alloc] init];
    self.photosView = imageView;
    [self.containerView addSubview:imageView];
    
    KECHomeBottomBar *homeBottomBar = [[KECHomeBottomBar alloc] init];
    self.homeBottomBar = homeBottomBar;
    [self.containerView addSubview:homeBottomBar];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = TableViewBackgroundColor;
    self.lineView = lineView;
    [self.containerView addSubview:lineView];
    
}

+ (instancetype)homePostCellWithTableView:(UITableView *)tableView{
    static NSString *reuseID = @"KECHomePostCell";
    KECHomePostCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    return cell;
}

- (void)setPostFrame:(KECHomePostFrame *)postFrame{
    
    _postFrame = postFrame;
    
    KECHomePost *homePost = postFrame.homePost;
    
    self.containerView.frame = postFrame.containerFrame;
    
    NSString *imageStr=[NSString stringWithFormat:@"http://app.hzjyw.com.cn/bbs/uc_server/avatar.php?size=small&uid=%@",homePost.authorid];
    [self.avatarImageView setImageViewWithUrlString:imageStr];
    self.avatarImageView.frame = postFrame.avatarFrame;
    
    self.authorLabel.text = homePost.author;
    self.authorLabel.frame = postFrame.authorFrame;
    
    NSInteger roleType = [homePost.userinfo.roletype integerValue] - 1;
    UIImage *roleImage;
    if (roleType) {
        roleImage = [UIImage imageNamed:@"girl"];
    }else{
        roleImage = [UIImage imageNamed:@"boy"];
    }
    self.roleImageView.image = roleImage;
    self.roleImageView.frame = postFrame.roleFrame;
    
    self.titleLabel.text = homePost.title;
    self.titleLabel.frame = postFrame.titleFrame;
    
    NSInteger pregnancyStatus = [homePost.userinfo.pregnancystatus integerValue];
    NSString *info = @"";
    switch (pregnancyStatus) {
        case 0:
            info = @"备孕中";
            break;
        case 1:{
            if(homePost.userinfo.child.count){
                KECChild *child = [KECChild objectWithKeyValues:homePost.userinfo.child.lastObject];
                NSString *gender = child.gender == 1?@"男孩":@"女孩";
                NSString *grade = child.garde.length == 0?@"":child.garde;
                info = [NSString stringWithFormat:@"%@ %@",gender,grade];
            }
        }
            break;
        case 2:
            info = [NSString stringWithFormat:@"怀孕中 %@",homePost.userinfo.pregnancyperiod];
            break;
        default:
            break;
    }
    self.infoLabel.text = info;
    self.infoLabel.frame = postFrame.infoFrame;
    
    self.indicatorImageView.frame = postFrame.indicatorFrame;
    
    NSString *msg = [homePost.message stringByDecodingXMLEntities];
    NSString *newMessage = [NSString filterHTML:msg];
    
    self.messageLabel.text = [NSString filterHTML2:newMessage];
    self.messageLabel.frame = postFrame.messageFrame;
    
    self.messageAttrLabel.text = [NSString filterHTML2:newMessage];
    NSRegularExpression *regexp = topicRegularExpression();
    NSRange linkRange = [regexp rangeOfFirstMatchInString: self.messageAttrLabel.text options:0 range:NSMakeRange(0, [ self.messageAttrLabel.text length])];
    [self.messageAttrLabel addLinkToTransitInformation:@{@"topicID":homePost.hid} withRange:linkRange];
    self.messageAttrLabel.frame = postFrame.messageAttrFrame;
    
    
    if (homePost.attachments) {
        self.photosView.frame = postFrame.photosViewFrame;
        self.photosView.photos = homePost.attachments;
        self.photosView.hidden = NO;
    }else{
        self.photosView.hidden = YES;
    }
    
    self.homeBottomBar.frame = postFrame.bottomBarFrame;
    self.homeBottomBar.homePost = homePost;
    
    self.lineView.frame = postFrame.lineViewFrame;
}

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithTransitInformation:(NSDictionary *)components{
    NSLog(@"dic - %@",components);
    
//    NSString *topicID = [components objectForKey:@"topicID"];
//    KECTopicDetailViewController *topicHomeViewController = [[KECTopicDetailViewController alloc] init];
//    topicHomeViewController.hid = topicID;
//    if(_delegate){
//        [[(UIViewController *)self.delegate navigationController] pushViewController:topicHomeViewController animated:YES];
//    }
    
}

@end
