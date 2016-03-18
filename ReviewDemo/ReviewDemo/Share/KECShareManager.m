//
//  KECShareManager.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/15.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECShareManager.h"
#import "KECShare.h"
//#import "WXApi.h"
//#import "WeiboSDK.h"
@interface KECShareManager ()


@end

@implementation KECShareManager
+ (void)share:(KECShare *)share toSnsName:(NSString *)snsName inViewController:(UIViewController *)viewController {

//    //判断有没有安装QQ客户端，没有则不显示QQ登录按钮
//    BOOL qqAvailable = [TencentOAuth iphoneQQInstalled] && [TencentOAuth iphoneQQSupportSSOLogin];
//    BOOL qZoneAvailable = [TencentOAuth iphoneQZoneInstalled] && [TencentOAuth iphoneQZoneSupportSSOLogin];
//    BOOL oAuthAvaiable = qqAvailable || qZoneAvailable;
//    
//    //判断有没有安装微信客户端，没有则不显示
//    BOOL isWeixinInstall = [WXApi isWXAppInstalled];
//    //判断有没有安装QQ客户端，没有则不显示
//    BOOL isQQInstall = oAuthAvaiable;
//    //判断有没有安装微博客户端，没有则不显示
//    BOOL isWeiboInstall = [WeiboSDK isWeiboAppInstalled];
//    
//    
//    if ([snsName isEqualToString:UMShareToWechatSession]) {
//        if (!isWeixinInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装微信,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.wechatSessionData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.wechatSessionData.url = share.shareUrl;
//    }
//    
//    if ([snsName isEqualToString:UMShareToWechatTimeline]) {
//        if (!isWeixinInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装微信,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.wechatTimelineData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.wechatTimelineData.url = share.shareUrl;
//    }
//    
//    if ([snsName isEqualToString:UMShareToQQ]) {
//        if (!isQQInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装QQ,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.qqData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.qqData.url = share.shareUrl;
//        share.shareImage = @"http://o1wh05aeh.qnssl.com/image/view/app_icons/63c9b5fb1c2db88d1913b393211d8a1f/120";
//    }
//    
//    if ([snsName isEqualToString:UMShareToSina]) {
//        if (!isWeiboInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装微博,无法使用此功能"];
//            return;
//        }
//        NSString * sinaContont = [NSString stringWithFormat:@"%@ %@",share.shareContent,share.shareUrl];
//        share.shareContent = sinaContont;
//    }
//    
//    if ([snsName isEqualToString:UMShareToQzone]) {
//        if (!isQQInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装QQ,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.qzoneData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.qzoneData.url = share.shareUrl;
//        
//    }
//    
//    UMSocialUrlResource *UMUrl=[[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeImage url:share.shareImage];
//    
//    [[UMSocialDataService defaultDataService] postSNSWithTypes:@[snsName] content:share.shareContent image:share.shareIcon location:nil urlResource:UMUrl presentedController:viewController completion:^(UMSocialResponseEntity *response){
//        if (response.responseCode == UMSResponseCodeSuccess) {
//        }
//    }];
}

- (void)inviteFriendWithShare:(KECShare *)share toSnsName:(NSString *)snsName inViewController:(UIViewController *)viewController {
//    //判断有没有安装QQ客户端，没有则不显示QQ登录按钮
//    BOOL qqAvailable = [TencentOAuth iphoneQQInstalled] && [TencentOAuth iphoneQQSupportSSOLogin];
//    BOOL qZoneAvailable = [TencentOAuth iphoneQZoneInstalled] && [TencentOAuth iphoneQZoneSupportSSOLogin];
//    BOOL oAuthAvaiable = qqAvailable || qZoneAvailable;
//    
//    //判断有没有安装微信客户端，没有则不显示
//    BOOL isWeixinInstall = [WXApi isWXAppInstalled];
//    //判断有没有安装QQ客户端，没有则不显示
//    BOOL isQQInstall = oAuthAvaiable;
//    //判断有没有安装微博客户端，没有则不显示
//    BOOL isWeiboInstall = [WeiboSDK isWeiboAppInstalled];
//    
//    if ([snsName isEqualToString:UMShareToWechatSession]) {
//        if (!isWeixinInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装微信,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.wechatSessionData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.wechatSessionData.url = share.shareUrl;
//        [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeApp;
//
//    }
//    
//    if ([snsName isEqualToString:UMShareToWechatTimeline]) {
//        if (!isWeixinInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装微信,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.wechatTimelineData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.wechatTimelineData.url = share.shareUrl;
//        [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeApp;
//    }
//    
//    if ([snsName isEqualToString:UMShareToQQ]) {
//        if (!isQQInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装QQ,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.qqData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.qqData.url = share.shareUrl;
//        [UMSocialData defaultData].extConfig.qqData.qqMessageType = UMSocialQQMessageTypeDefault;
//        
//        UMSocialUrlResource *UMUrl=[[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:share.shareImage];
//        share.shareIcon = [UIImage imageNamed:ShareIcon];
//        [[UMSocialDataService defaultDataService] postSNSWithTypes:@[snsName] content:share.shareContent image:share.shareIcon location:nil urlResource:UMUrl presentedController:viewController completion:^(UMSocialResponseEntity *response){
//            if (response.responseCode == UMSResponseCodeSuccess) {
//                if (_delegate && [_delegate respondsToSelector:@selector(friendsReward)]) {
//                    [_delegate friendsReward];
//                }
//            }
//        }];
//        return;
//    }
//    
//    if ([snsName isEqualToString:UMShareToSina]) {
//        if (!isWeiboInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装微博,无法使用此功能"];
//            return;
//        }
//        NSString * sinaContont = @"我正在使用“孩教圈幼儿园版”APP,里面有千万家长和老师一起交流分享孩子教育经验,赶快点击链接下载吧http://www.61learn.com/AppShare.aspx";
//        share.shareContent = sinaContont;
//        UMSocialUrlResource *UMUrl=[[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeImage url:share.shareImage];
//        
//        
//        [[UMSocialDataService defaultDataService] postSNSWithTypes:@[snsName] content:share.shareContent image:share.shareIcon location:nil urlResource:UMUrl presentedController:viewController completion:^(UMSocialResponseEntity *response){
//            if (response.responseCode == UMSResponseCodeSuccess) {
//                [SVProgressHUD showImage:nil status:@"已成功分享到新浪微博"];
//                if (_delegate && [_delegate respondsToSelector:@selector(friendsReward)]) {
//                    [_delegate friendsReward];
//                }
//            }
//        }];
//        return;
//    }
//    
//    if ([snsName isEqualToString:UMShareToQzone]) {
//        //qq空间必须有图片和文字
//        if (!isQQInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装QQ,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.qzoneData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.qzoneData.url = share.shareUrl;
//        [UMSocialData defaultData].extConfig.qqData.qqMessageType = UMSocialQQMessageTypeDefault;
//        
//        UMSocialUrlResource *UMUrl=[[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:share.shareImage];
//        share.shareIcon = [UIImage imageNamed:ShareIcon];
//        [[UMSocialDataService defaultDataService] postSNSWithTypes:@[snsName] content:share.shareContent image:share.shareIcon location:nil urlResource:UMUrl presentedController:viewController completion:^(UMSocialResponseEntity *response){
//            if (response.responseCode == UMSResponseCodeSuccess) {
//                if (_delegate && [_delegate respondsToSelector:@selector(friendsReward)]) {
//                    [_delegate friendsReward];
//                }
//            }
//        }];
//        return;
//    }
//    
//    UMSocialUrlResource *UMUrl=[[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:share.shareImage];
//    
//    [[UMSocialDataService defaultDataService] postSNSWithTypes:@[snsName] content:share.shareContent image:nil location:nil urlResource:UMUrl presentedController:viewController completion:^(UMSocialResponseEntity *response){
//        if (response.responseCode == UMSResponseCodeSuccess) {
//            if (_delegate && [_delegate respondsToSelector:@selector(friendsReward)]) {
//                [_delegate friendsReward];
//            }
//            
//        }
//    }];
    
    
}

+ (void)shareForShop:(KECShare *)share toSnsName:(NSString *)snsName inViewController:(UIViewController *)viewController {
    
    //判断有没有安装QQ客户端，没有则不显示QQ登录按钮
//    BOOL qqAvailable = [TencentOAuth iphoneQQInstalled] && [TencentOAuth iphoneQQSupportSSOLogin];
//    BOOL qZoneAvailable = [TencentOAuth iphoneQZoneInstalled] && [TencentOAuth iphoneQZoneSupportSSOLogin];
//    BOOL oAuthAvaiable = qqAvailable || qZoneAvailable;
//    
//    //判断有没有安装微信客户端，没有则不显示
//    BOOL isWeixinInstall = [WXApi isWXAppInstalled];
//    //判断有没有安装QQ客户端，没有则不显示
//    BOOL isQQInstall = oAuthAvaiable;
//    //判断有没有安装微博客户端，没有则不显示
//    BOOL isWeiboInstall = [WeiboSDK isWeiboAppInstalled];
//    
//    if ([snsName isEqualToString:UMShareToWechatSession]) {
//        if (!isWeixinInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装微信,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.wechatSessionData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.wechatSessionData.url = share.shareUrl;
//    }
//    
//    if ([snsName isEqualToString:UMShareToWechatTimeline]) {
//        if (!isWeixinInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装微信,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.wechatTimelineData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.wechatTimelineData.url = share.shareUrl;
//    }
//    
//    if ([snsName isEqualToString:UMShareToQQ]) {
//        if (!isQQInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装QQ,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.qqData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.qqData.url = share.shareUrl;
//    }
//    
//    if ([snsName isEqualToString:UMShareToSina]) {
//        if (!isWeiboInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装微博,无法使用此功能"];
//            return;
//        }
//        NSString * sinaContont = [NSString stringWithFormat:@"%@ %@",share.shareContent,share.shareUrl];
//        share.shareContent = sinaContont;
//    }
//    
//    if ([snsName isEqualToString:UMShareToQzone]) {
//        if (!isQQInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装QQ,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.qzoneData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.qzoneData.url = share.shareUrl;
//    }
//     share.shareImage = @"http://o1wh05aeh.qnssl.com/image/view/app_icons/63c9b5fb1c2db88d1913b393211d8a1f/120";
//    
//    UMSocialUrlResource *UMUrl=[[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeImage url:share.shareImage];
//    
//    [[UMSocialDataService defaultDataService] postSNSWithTypes:@[snsName] content:share.shareContent image:nil location:nil urlResource:UMUrl presentedController:viewController completion:^(UMSocialResponseEntity *response){
//        if (response.responseCode == UMSResponseCodeSuccess) {
//        }
//    }];
}

+ (void)shareForMeitu:(KECShare *)share toSnsName:(NSString *)snsName inViewController:(UIViewController *)viewController {
//    //判断有没有安装QQ客户端，没有则不显示QQ登录按钮
//    BOOL qqAvailable = [TencentOAuth iphoneQQInstalled] && [TencentOAuth iphoneQQSupportSSOLogin];
//    BOOL qZoneAvailable = [TencentOAuth iphoneQZoneInstalled] && [TencentOAuth iphoneQZoneSupportSSOLogin];
//    BOOL oAuthAvaiable = qqAvailable || qZoneAvailable;
//    
//    //判断有没有安装微信客户端，没有则不显示
//    BOOL isWeixinInstall = [WXApi isWXAppInstalled];
//    //判断有没有安装QQ客户端，没有则不显示
//    BOOL isQQInstall = oAuthAvaiable;
//    //判断有没有安装微博客户端，没有则不显示
//    BOOL isWeiboInstall = [WeiboSDK isWeiboAppInstalled];
//    
//    if ([snsName isEqualToString:UMShareToWechatSession]) {
//        if (!isWeixinInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装微信,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.wechatSessionData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.wechatSessionData.url = share.shareUrl;
//        [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeImage;
//    }
//    
//    if ([snsName isEqualToString:UMShareToWechatTimeline]) {
//        if (!isWeixinInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装微信,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.wechatTimelineData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.wechatTimelineData.url = share.shareUrl;
//        [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeImage;
//    }
//    
//    if ([snsName isEqualToString:UMShareToQQ]) {
//        if (!isQQInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装QQ,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.qqData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.qqData.url = share.shareUrl;
//        [UMSocialData defaultData].extConfig.qqData.qqMessageType = UMSocialQQMessageTypeImage;
//    }
//    
//    if ([snsName isEqualToString:UMShareToSina]) {
//        if (!isWeiboInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装微博,无法使用此功能"];
//            return;
//        }
//        NSString * sinaContont = [NSString stringWithFormat:@"%@ %@",share.shareContent,share.shareUrl];
//        share.shareContent = sinaContont;
//    }
//    
//    if ([snsName isEqualToString:UMShareToQzone]) {
//        if (!isQQInstall) {
//            [SVProgressHUD showImage:nil status:@"你的还没安装QQ,无法使用此功能"];
//            return;
//        }
//        [UMSocialData defaultData].extConfig.qzoneData.title = share.shareTitle;
//        [UMSocialData defaultData].extConfig.qzoneData.url = share.shareUrl;
//    }
//    
//    UMSocialUrlResource *UMUrl=[[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeImage url:share.shareImage];
//    
//    [[UMSocialDataService defaultDataService] postSNSWithTypes:@[snsName] content:share.shareContent image:nil location:nil urlResource:UMUrl presentedController:viewController completion:^(UMSocialResponseEntity *response){
//        if (response.responseCode == UMSResponseCodeSuccess) {
//        }
//    }];
}


@end
