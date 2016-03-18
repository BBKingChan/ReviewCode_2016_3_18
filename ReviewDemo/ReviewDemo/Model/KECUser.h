//
//  KECUser.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/18.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KECUser : NSObject
/**  用户uid */
@property (nonatomic ,copy) NSString *uid;
/**  用户名 */
@property (nonatomic, copy) NSString *username;
/**  用户密码 */
@property (nonatomic, copy) NSString *password;
/**  用户登录账号(邮箱 / 手机 /用户名) */
@property (nonatomic, copy) NSString *account;
/**  用户昵称 */
@property (nonatomic, copy) NSString *nickname;
/**  用户头像 */
@property (nonatomic, copy) NSString *avatar;
/**  用户所在城市 */
@property (nonatomic, copy) NSString *cityname;
/**  用户状态*/
@property (nonatomic, strong) NSNumber *status;
/**  用户积分等级*/
@property (nonatomic, strong) NSNumber *credits;
/**  用户生日年份*/
@property (nonatomic, strong) NSNumber *birthyear;
/**  用户生日月份*/
@property (nonatomic, strong) NSNumber *birthmonth;
/**  用户生日日*/
@property (nonatomic, strong) NSNumber *birthday;
/**  用户性别*/
@property (nonatomic, strong) NSNumber *gender;
/**  用户个人描述*/
@property (nonatomic, copy) NSString *bio;
/**  用户省份*/
@property (nonatomic, copy) NSString *resideprovince;
/**  用户城市*/
@property (nonatomic, copy) NSString *residecity;
/**  用户发表的个数*/
@property (nonatomic, strong) NSNumber *threads;
/**  用户回复的个数*/
@property (nonatomic, strong) NSNumber *posts;
/**  用户关注的个数*/
@property (nonatomic, strong) NSNumber *following;
/**  用户粉丝的个数*/
@property (nonatomic, strong) NSNumber *follower;
/**  用户收藏的个数*/
@property (nonatomic, strong) NSNumber *collection;
/**  用户赞的个数*/
@property (nonatomic, strong) NSNumber *praise;
/**  怀孕周期*/
@property (nonatomic, copy) NSString *pregnancyperiod;
/**  老师类型 学校老师＝1 培训机构＝2 */
@property (nonatomic, strong) NSNumber *roletype;
/**  怀孕状态 怀孕状态,0备孕中，1有孩子，2怀孕中*/
@property (nonatomic, strong) NSNumber *pregnancystatus;
/**  是否被关注*/
@property (nonatomic, assign) NSNumber *isfollowing;
/**  孩子数*/
@property (nonatomic, strong) NSArray *child;
/**  职业*/
@property (nonatomic, copy) NSString *major;
/** 身份 家长＝1 老师/专家＝2 */
@property (nonatomic, strong) NSNumber *roleid;
/** 老师单位 */
@property(nonatomic,copy) NSString *teachercorp;
/** 老师职务 */
@property(nonatomic,copy) NSString *teacherposition;
/** 老师详细介绍 */
@property(nonatomic,copy) NSString *teacherintroduce;
/** 用户手机号 */
@property(nonatomic,copy) NSString *phoneAccount;
/** 所属幼儿园 */
@property (nonatomic, copy) NSString *parents_child_school_name;
/** 教龄 */
@property (nonatomic, copy) NSString *school_age;
/** 老师所在班级 */
@property (nonatomic, copy) NSString *teach_class;


@end
