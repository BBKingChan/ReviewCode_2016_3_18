//
//  KECVNavigationController.m
//  KidEducationCircle
//
//  Created by jiong23 on 15/6/4.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECNavigationController.h"
#import "UIBarButtonItem+Extension.h"
//#import "KECSearchViewController.h"
//#import "KECPostViewController.h"
//#import "KECLoginViewController.h"

@interface KECNavigationController ()<UIAlertViewDelegate>

@end

@implementation KECNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBackgroundImage:[UIImage resizeImage:[UIImage imageNamed:@"NavigationBarBG"]] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:20], NSForegroundColorAttributeName : [UIColor whiteColor]};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//首次使用该类时调用一次
+ (void)initialize
{
    UIBarButtonItem *appearance =[UIBarButtonItem appearance];
    //普通
    NSMutableDictionary *textAtts = [NSMutableDictionary dictionary];
    textAtts[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAtts[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:textAtts forState:UIControlStateNormal];
    //高亮
    NSMutableDictionary *highTextAtts =[NSMutableDictionary dictionary];
    highTextAtts[NSForegroundColorAttributeName] = [UIColor redColor];
    highTextAtts[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:highTextAtts forState:UIControlStateHighlighted];
    //不可以用
    NSMutableDictionary *disableTextAtts = [NSMutableDictionary dictionary];
    disableTextAtts[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    disableTextAtts[NSFontAttributeName] =[UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:disableTextAtts forState:UIControlStateDisabled];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    if (self.viewControllers.count > 0) {
//        viewController.hidesBottomBarWhenPushed = YES;
//        
////        // 设置左边的返回按钮
////        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
////        
////        // 设置右边的更多按钮
////        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
//    }
    if (self.childViewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        if (![viewController isKindOfClass:NSClassFromString(@"KECPostViewController")]) {
            viewController.navigationItem.leftBarButtonItems = [UIBarButtonItem barButtonItemsWithImage:[UIImage imageNamed:@"icon_back"] highImage:[UIImage imageNamed:@"icon_backon"] target:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        }
    }else {
        
        if ([viewController isKindOfClass:NSClassFromString(@"GZQHomeViewController")] ||
            [viewController isKindOfClass:NSClassFromString(@"GZQCircleViewController")] || [viewController isKindOfClass:NSClassFromString(@"KECFourmViewController")])
        {
            viewController.navigationItem.leftBarButtonItems = [UIBarButtonItem barButtonItemsWithImage:[UIImage imageWithOriginalName:@"search"] highImage:[UIImage imageWithOriginalName:@"search"] target:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
            
            viewController.navigationItem.rightBarButtonItems = [UIBarButtonItem barButtonItemsWithImage:[UIImage imageWithOriginalName:@"edi"] highImage:[UIImage imageWithOriginalName:@"edi"] target:self action:@selector(message) forControlEvents:UIControlEventTouchUpInside];
        }
    }

    [super pushViewController:viewController animated:animated];
}

- (void)back{    
    [self popViewControllerAnimated:YES];
}

//- (void)search{
//    KECSearchViewController *searchViewController = [[KECSearchViewController alloc] init];
//    [self pushViewController:searchViewController animated:YES];
//}
//
//- (void)message{
//    BOOL isWalkingUser = [[KECDataManager dataManagerObjectForKey:WALKING_USER] boolValue];
//    if (isWalkingUser) {
//        KECLog(@"%d",isWalkingUser);
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"亲，你还未登录哦" message:@"登录就可以使用这个功能啦!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"登录", nil];
//        [alert show];
//        return;
//    }
//    KECPostViewController *postViewController = [[KECPostViewController alloc] init];
//    [self pushViewController:postViewController animated:YES];
//}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
//        KECLoginViewController *loginViewController = [[KECLoginViewController alloc] init];
//        KECNavigationController *navi = [[KECNavigationController alloc] initWithRootViewController:loginViewController];
//        [self presentViewController:navi animated:YES completion:nil];
    }
}
@end
