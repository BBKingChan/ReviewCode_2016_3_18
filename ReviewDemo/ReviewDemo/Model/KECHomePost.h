//
//  KECHomePost.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/18.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KECUser.h"
#define kHomePostBorder 5
#define kHomePostMargin 10
#define kAvatarWH 35
#define kAuthorFontSize 16
#define kTitleFontSize 15
#define kAdFontSize 12
#define kDownloadFontSize 15
#define kInfoFontSize 13
#define kMessageFontSize 16
#define kLabelHeight 21
#define kBottomBarH 20
@interface KECHomePost : NSObject

@property (nonatomic, copy) NSString *author;
@property (nonatomic, strong) NSNumber *authorid;
@property (nonatomic, strong) NSNumber *comments;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *dateline;
@property (nonatomic, copy) NSString *lastpost;
@property (nonatomic, strong) NSArray *attachments;
@property (nonatomic, copy) NSString *fid;
@property (nonatomic, copy) NSString *tid;
@property (nonatomic, copy) NSString *hid;
@property (nonatomic, strong) KECUser *userinfo;
/** 赞*/
@property (nonatomic, strong) NSNumber *views;
@property (nonatomic, strong) NSNumber *replies;
@property (nonatomic, assign) BOOL ispraise;

//广告
@property (nonatomic, copy) NSString *adimage;
@property (nonatomic, copy) NSString *adtitle;
@property (nonatomic, copy) NSString *adurl;
@property (nonatomic, copy) NSString *adcontent;
@property (nonatomic, strong) NSNumber *adtype;
@property (nonatomic, strong) NSNumber *isad;

@end
