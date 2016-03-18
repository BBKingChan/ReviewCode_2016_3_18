//
//  KECShareView.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/14.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KECShareView;
@protocol KECShareViewDelegate <NSObject>

- (void)shareView:(KECShareView *)shareView didSelectedShareButtonWithIndex:(NSInteger )index;

@end

@interface KECShareView : UIView

@property (nonatomic, weak) id <KECShareViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *weixinButton;
@property (weak, nonatomic) IBOutlet UILabel *weixinLabel;

@property (weak, nonatomic) IBOutlet UIButton *timeLineButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLineLabel;

@property (weak, nonatomic) IBOutlet UIButton *qqButton;
@property (weak, nonatomic) IBOutlet UILabel *qqLabel;

@property (weak, nonatomic) IBOutlet UIButton *weiboButton;
@property (weak, nonatomic) IBOutlet UILabel *weiboLabel;

@property (weak, nonatomic) IBOutlet UIButton *qqZoomButton;
@property (weak, nonatomic) IBOutlet UILabel *qqZoomLabel;

@property (weak, nonatomic) IBOutlet UIButton *collectionButton;
@property (weak, nonatomic) IBOutlet UILabel *collectionLabel;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

- (void)show;
- (void)dismiss;
@end
