//
//  KECHubView.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/18.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECHubView.h"
#import "MBProgressHUD.h"
#import "SVProgressHUD.h"

@interface KECHubView ()

@end
@implementation KECHubView

+ (void)showHubWithText:(NSString *)text AddedTo:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = text;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}

+ (void)showHubWithText:(NSString *)text AddedTo:(UIView *)view AfterDelay:(NSInteger)delay
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = text;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
}

+ (void)showHubWithSynchronousStatus:(NSString *)status
{
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    [SVProgressHUD showWithStatus:status maskType:SVProgressHUDMaskTypeClear];
}

+ (void)showHubWithStatus:(NSString *)status
{
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    [SVProgressHUD showWithStatus:status];
}

+ (void)dismiss{
    [SVProgressHUD dismiss];
}


@end
