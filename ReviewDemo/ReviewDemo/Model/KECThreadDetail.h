//
//  KECThreadDetail.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/3.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KECThread.h"
//#import "KECChild.h"

@interface KECThreadDetail : NSObject
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSNumber *dateline;
@property (nonatomic, strong) NSNumber *roleid;
@property (nonatomic, strong) NSNumber *pregnancystatus;
@property (nonatomic, copy) NSString *residecity;
@property (nonatomic, copy) NSString *major;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, strong) NSNumber *ispraise;
@property (nonatomic, copy) NSString *tid;
@property (nonatomic, copy) NSString *fid;
//@property (nonatomic, strong) NSArray *child;

//@property (nonatomic, strong) KECThread *thread;

@end
