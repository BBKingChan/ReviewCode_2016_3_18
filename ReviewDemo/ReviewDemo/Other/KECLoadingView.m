//
//  KECLoadingView.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/21.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECLoadingView.h"
#define kImageCount 6

@interface KECLoadingView ()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UILabel *tipLabel;

@end

@implementation KECLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews
{
//    UIImageView *imageView = [[UIImageView alloc] init];
//    [self addSubview:imageView];
//    self.imageView = imageView;
//    NSMutableArray *imageArrayM = [NSMutableArray arrayWithCapacity:kImageCount];
//    for (NSInteger i = 1; i <= kImageCount; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading%ld", i]];
//        [imageArrayM addObject:image];
//    }
//    imageView.animationImages = imageArrayM;
//    imageView.animationDuration = kImageCount * 0.4;
//    imageView.animationRepeatCount = 0;
//    [imageView startAnimating];
    
    UILabel *tipLabel = [[UILabel alloc] init];
    [self addSubview:tipLabel];
    self.tipLabel = tipLabel;
    tipLabel.text = @"努力加载中...";
    tipLabel.textColor = RGB(153, 153, 153);
    [tipLabel sizeToFit];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    self.imageView.bounds = CGRectMake(0, 0, 75, 75);
//    self.imageView.center = CGPointMake(self.width * 0.5, self.height * 0.4);
//    self.tipLabel.center = CGPointMake(self.width * 0.5, CGRectGetMaxY(self.imageView.frame) + 20);
    self.tipLabel.center = CGPointMake(self.width * 0.5, self.height * 0.45);
}

+ (void)showLoadingViewToView:(UIView *)view
{
    KECLoadingView *loadingView = [[self alloc] init];
    loadingView.frame = view.bounds;
    [view addSubview:loadingView];
    
}
+ (void)showNewLoadingViewToView:(UIView *)view
{
    KECLoadingView *loadingView = [[self alloc] init];
    loadingView.frame = CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT-64);
    [view addSubview:loadingView];
    
}
+ (void)hideLoadingViewToView:(UIView *)view
{
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass:[KECLoadingView class]]) {
            [subview removeFromSuperview];
        }
    }
}

@end
