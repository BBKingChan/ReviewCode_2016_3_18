//
//  KECChild.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/8/31.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KECChild : NSObject
/** 性别 1=男 2=女*/
@property (nonatomic, assign) NSInteger gender;
/** 等级？ */
@property (nonatomic, copy) NSString *garde;
/** 生日 */
@property (nonatomic, copy) NSString *birthday;

@property (nonatomic, copy) NSString *childid;

@property (nonatomic, copy) NSString *grade;
/** 就读幼儿园 */
@property (nonatomic, copy) NSString *school;

@property (nonatomic, copy) NSString *uid;
/** 就读班级 */
@property (nonatomic, copy) NSString *classname;
@end
