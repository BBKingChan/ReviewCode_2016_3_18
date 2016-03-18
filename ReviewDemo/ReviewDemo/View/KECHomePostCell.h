//
//  KECHomePostCell.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/18.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KECHomePostFrame;
@class KECHomeBottomBar;
@class KECHotPostPhotosView;
@class KECHomePostCell;

@protocol KECHomePostCellDelegate <NSObject>

- (void)homePostCell:(KECHomePostCell *)cell didSelectLinkWithTransitInformation:(NSDictionary *)components;

@end

@interface KECHomePostCell : UITableViewCell

@property (nonatomic, strong) KECHomePostFrame *postFrame;
@property (nonatomic, weak) KECHomeBottomBar *homeBottomBar;
@property (nonatomic, weak) KECHotPostPhotosView *photosView;
@property (nonatomic, weak) id<KECHomePostCellDelegate> delegate;

+ (instancetype)homePostCellWithTableView:(UITableView *)tableView;

@end
