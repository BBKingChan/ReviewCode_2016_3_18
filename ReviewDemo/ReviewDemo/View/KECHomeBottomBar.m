//
//  KECHomeBottomBar.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/28.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECHomeBottomBar.h"

@interface KECHomeBottomBar ()<UIAlertViewDelegate>
@property (nonatomic, weak) UIButton *locationButton;
@property (nonatomic, weak) UIButton *shareButton;
@property (nonatomic, weak) UIButton *commentButton;
@end
@implementation KECHomeBottomBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = RandomColor;
        
        [self setUpChildViews];
        
        [self.locationButton setTitle:@"广州省 广州市" forState:UIControlStateNormal];
        [self.locationButton sizeToFit];
        
        [self.shareButton setTitle:@"" forState:UIControlStateNormal];
        [self.shareButton sizeToFit];
        self.shareButton.tag = 1000;
        
        [self.commentButton setTitle:@"评论" forState:UIControlStateNormal];
        [self.commentButton sizeToFit];
        
        [self.likeButton setTitle:@"赞" forState:UIControlStateNormal];
        [self.likeButton sizeToFit];
        self.likeButton.tag  = 1001;

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.locationButton.x = 10;
    self.locationButton.y = 0;
    self.locationButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    self.locationButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    self.locationButton.width += 10;
    self.locationButton.height = self.height;
    
    self.commentButton.width = 70;
    self.commentButton.y = 0;
    self.commentButton.x = self.width - self.commentButton.width - 10;
    self.commentButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    self.commentButton.height = self.height;
    
    self.likeButton.width = 70;
    self.likeButton.y = 0;
    self.likeButton.x = self.commentButton.x - self.likeButton.width - 10;
    self.likeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    self.likeButton.height = self.height;
    
    self.shareButton.width = 70;
    self.shareButton.x =self.likeButton.x - self.shareButton.width - 10;
    self.shareButton.y = 0;
    self.shareButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    self.shareButton.height = self.height;
    
    
}

- (void)setUpChildViews{
    self.locationButton = [self setUpOneButtonWithColor:RGB(102, 102, 102) imageName:@"location"];
    self.shareButton = [self setUpOneButtonWithColor:RGB(102, 102, 102) imageName:@"share"];
    self.commentButton = [self setUpOneButtonWithColor:RGB(102, 102, 102) imageName:@"comment"];
    self.likeButton = [self setUpOneButtonWithColor:RGB(102, 102, 102) imageName:@"like" selectedImageName:@"likeon"];
}

- (UIButton *)setUpOneButtonWithColor:(UIColor *)color imageName:(NSString *)imageName{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button];
    
    button.userInteractionEnabled = YES;
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:10];
    
    UIImage *image = [UIImage imageNamed:imageName];
    [button setImage:image forState:UIControlStateNormal];
    
//    button.imageView.layer.cornerRadius = image.size.width * 0.5;
//    button.imageView.layer.masksToBounds = YES;
    
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (UIButton *)setUpOneButtonWithColor:(UIColor *)color imageName:(NSString *)imageName selectedImageName:(NSString *)selecetdImage{
     UIButton *button = [self setUpOneButtonWithColor:color imageName:imageName];
     [button setImage:[UIImage imageNamed:selecetdImage] forState:UIControlStateSelected];
     return button;
}

- (void)clickButton:(UIButton *)button{
    KECLog(@"btn tag - %ld",(long)button.tag);
    NSInteger index = button.tag - 1000;
    if(button.tag==1000){
//        [Statistics statisticClickEvent:CLICK_SHARE_BUTTON];
    }
    if(button.tag == 1001){
//        [Statistics statisticClickEvent:CLICK_LIKE_BUTTON];
    }
    if(button.tag == 0){
//        [Statistics statisticClickEvent:CLICK_REPLAY_BUTTON];
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(homeBottomBar:didSelectedButtonWithIndex:)]) {
        [_delegate homeBottomBar:self didSelectedButtonWithIndex:index];
    }
   
}

- (void)setHomePost:(KECHomePost *)homePost{
    
    _homePost = homePost;
    
    NSString *resideprovince = homePost.userinfo.resideprovince;
    NSString *residecity = homePost.userinfo.residecity;
    if ([resideprovince isEqualToString:@"其他"] || [residecity isEqualToString:@"其他"]) {
        resideprovince = @"";
        residecity= @"";
        self.locationButton.hidden = YES;
    }
    
    NSString *location = [NSString stringWithFormat:@"%@ %@",resideprovince,residecity];
    
    [self.locationButton setTitle:location forState:UIControlStateNormal];
    
    [self.likeButton setTitle:homePost.views.description forState:UIControlStateNormal];
    self.likeButton.selected = homePost.ispraise;
    
    [self.commentButton setTitle:homePost.replies.description forState:UIControlStateNormal];
}
@end
