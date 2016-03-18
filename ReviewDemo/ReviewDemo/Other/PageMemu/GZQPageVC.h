//
//  GZQPageVC.h
//  guangzhouquan
//
//  Created by ouyangqiuping on 15/5/8.
//  Copyright (c) 2015年 广州盛成网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPageCellHeight 30

@class GZQPageVC;

@protocol GZQPageVCDelegate <NSObject>

@optional
- (void)pageVC:(GZQPageVC *)pageVC didSelectedCellOfIndex:(NSInteger)index;
- (void)pageVC:(GZQPageVC *)pageVC didClickedHeaderOrFooterButton:(UIButton *)button;

@end

@interface GZQPageVC : UIViewController

@property (nonatomic, weak) id<GZQPageVCDelegate> delegate;

@property (nonatomic, assign) NSInteger pageNumber;

@property (nonatomic, assign) NSInteger currentPage;

@end
