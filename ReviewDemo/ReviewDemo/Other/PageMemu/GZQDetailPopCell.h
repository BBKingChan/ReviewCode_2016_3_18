//
//  GZQMoreViewCell.h
//  guangzhouquan
//
//  Created by ouyangqiuping on 15/5/8.
//  Copyright (c) 2015年 广州盛成网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZQDetailPopCell : UITableViewCell

@property (nonatomic, weak) UIButton *button;

@property (nonatomic, assign) BOOL isButtonSelected;

+ (instancetype)detailPopCellWithTableView:(UITableView *)tableView;

@end
