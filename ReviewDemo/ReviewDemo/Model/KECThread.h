//
//  KECThread.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/2.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KECUser.h"

@interface KECThread : NSObject
/** 帖子摘要 */
@property (nonatomic, copy) NSString *subject;
/** 帖子内容 */
@property (nonatomic, copy) NSString *message;
/** 赞数 */
@property (nonatomic, copy) NSNumber *views;
/** 是否赞 */
@property (nonatomic, assign) NSNumber *ispraise;
/** 时间戳 */
@property (nonatomic, copy) NSString *dateline;
/** 回复数 */
@property (nonatomic, copy) NSString *replies;
/** 帖子ID */
@property (nonatomic, copy) NSString *tid;
/** 论坛ID */
@property (nonatomic, copy) NSString *fid;
/** 话题ID */
@property (nonatomic, copy) NSString *hid;
/** PID */
@property (nonatomic, copy) NSString *pid;
/** 精 */
@property (nonatomic, strong) NSNumber *digest;
/** 顶 */
@property (nonatomic, strong) NSNumber *displayorder;
/** 发表帖子的用户 */
@property (nonatomic, strong) KECUser *user;
/** 发表帖子的用户 */
@property (nonatomic, strong) KECUser *userinfo;
/** 图片 */
@property (nonatomic, strong) NSArray *attachments;
/** 广告图片 */
@property (nonatomic, copy) NSString *adimage;
/** 广告标题 */
@property (nonatomic, copy) NSString *adtitle;
/** 广告URL */
@property (nonatomic, copy) NSString *adurl;
/** 广告标题 */
@property (nonatomic, copy) NSString *adcontent;
/** 广告类型 */
@property (nonatomic, strong) NSNumber *adtype;
/** 是否广告 */
@property (nonatomic, strong) NSNumber *isad;
/** 帖子用户名 */
@property (nonatomic, copy) NSString *author;


@end
