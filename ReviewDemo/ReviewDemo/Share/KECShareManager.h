//
//  KECShareManager.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/15.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KECShare;

@protocol KECShareManagerDelegate <NSObject>

- (void)friendsReward;

@end

@interface KECShareManager : NSObject
@property (nonatomic ,weak)id<KECShareManagerDelegate>delegate;
/**
 *  分享
 */
+ (void)share:(KECShare *)share toSnsName:(NSString *)snsName inViewController:(UIViewController *)viewController;

/**
 *  邀请好友
 */
- (void)inviteFriendWithShare:(KECShare *)share toSnsName:(NSString *)snsName inViewController:(UIViewController *)viewController;

/**
 *  商城分享
 */
+ (void)shareForShop:(KECShare *)share toSnsName:(NSString *)snsName inViewController:(UIViewController *)viewController;


/**
 *  美图分享
 */
+ (void)shareForMeitu:(KECShare *)share toSnsName:(NSString *)snsName inViewController:(UIViewController *)viewController;
@end
