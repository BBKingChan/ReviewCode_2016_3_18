//
//  GZQPageVC.m
//  guangzhouquan
//
//  Created by ouyangqiuping on 15/5/8.
//  Copyright (c) 2015年 广州盛成网络科技有限公司. All rights reserved.
//

#import "GZQPageVC.h"
#import "GZQDetailPopCell.h"

@interface GZQPageVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UIButton *headerButton;
@property (nonatomic, weak) UIButton *footerButton;
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, assign) NSInteger selectedIndex;

@end

@implementation GZQPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self setUpSubviews];
}

- (void)setUpSubviews
{
    self.headerButton = [self buttonWithTitle:@"首页"];
    
    self.footerButton = [self buttonWithTitle:@"尾页"];
    
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (UIButton *)buttonWithTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:RGB(220, 162, 32) forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)buttonClicked:(UIButton *)button
{
//    if (button == self.headerButton) {
//        self.footerButton.selected = NO;
//        self.footerButton.backgroundColor = [UIColor clearColor];
//    }else {
//        self.headerButton.selected = NO;
//        self.headerButton.backgroundColor = [UIColor clearColor];
//    }
    
//    button.backgroundColor = RGB(46, 50, 53);
//    button.selected = YES;
    self.selectedIndex = -1;
    [self.tableView reloadData];
    
    if ([self.delegate respondsToSelector:@selector(pageVC:didClickedHeaderOrFooterButton:)]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.delegate pageVC:self didClickedHeaderOrFooterButton:button];
        });
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.headerButton.width = self.view.width;
    self.headerButton.height = kPageCellHeight;
    
    self.footerButton.width = self.view.width;
    self.footerButton.height = kPageCellHeight;
    self.footerButton.y = self.view.height - kPageCellHeight;
    
    self.tableView.width = self.view.width;
    self.tableView.y = self.headerButton.height;
    self.tableView.height = self.view.height - 2 * kPageCellHeight;
    
//    [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionBottom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)setPageNumber:(NSInteger)pageNumber
{
    _pageNumber = pageNumber;
    
    [self.tableView reloadData];
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
    
    self.selectedIndex = currentPage - 1;
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:currentPage - 1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

#pragma mark - UITableViewDataSource and UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pageNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GZQDetailPopCell *cell = [GZQDetailPopCell detailPopCellWithTableView:tableView];
    if (self.selectedIndex == indexPath.row) {
        cell.isButtonSelected = YES;
        cell.backgroundColor = RGB(46, 50, 53);
    }else {
        cell.isButtonSelected = NO;
        cell.backgroundColor = [UIColor clearColor];
    }

    [cell.button setTitle:[NSString stringWithFormat:@"%ld", indexPath.row + 1] forState:UIControlStateNormal];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kPageCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.headerButton.selected = NO;
    self.footerButton.selected = NO;
    self.footerButton.backgroundColor = [UIColor clearColor];
    self.headerButton.backgroundColor = [UIColor clearColor];
    self.selectedIndex = indexPath.row;
    [tableView reloadData];
    
    if ([self.delegate respondsToSelector:@selector(pageVC:didSelectedCellOfIndex:)]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.delegate pageVC:self didSelectedCellOfIndex:indexPath.row];
        });
    }
}

@end
