//
//  GZQMoreViewCell.m
//  guangzhouquan
//
//  Created by ouyangqiuping on 15/5/8.
//  Copyright (c) 2015年 广州盛成网络科技有限公司. All rights reserved.
//

#import "GZQDetailPopCell.h"

@interface GZQDetailPopCell ()

@end

@implementation GZQDetailPopCell

+ (instancetype)detailPopCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseID = @"moreViewCell";
    GZQDetailPopCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:button];
        self.button = button;
        
        button.userInteractionEnabled = NO;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:RGB(220, 162, 32) forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    }
    return self;
}

- (void)setIsButtonSelected:(BOOL)isButtonSelected
{
    _isButtonSelected = isButtonSelected;
    
    self.button.selected = isButtonSelected;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.button.frame = self.bounds;
}

@end
