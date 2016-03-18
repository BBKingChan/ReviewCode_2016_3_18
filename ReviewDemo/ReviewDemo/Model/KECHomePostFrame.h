//
//  KECHomePostFrame.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/18.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KECHomePost.h"
#import "KECThread.h"

@interface KECHomePostFrame : NSObject

@property (nonatomic, strong) KECHomePost *homePost;

@property (nonatomic, strong) KECThread *thread;

@property (nonatomic, assign, readonly) CGRect avatarFrame;
@property (nonatomic, assign, readonly) CGRect authorFrame;
@property (nonatomic, assign, readonly) CGRect titleFrame;
@property (nonatomic, assign, readonly) CGRect roleFrame;
@property (nonatomic, assign, readonly) CGRect infoFrame;
@property (nonatomic, assign, readonly) CGRect indicatorFrame;
@property (nonatomic, assign, readonly) CGRect downloadFrame;
@property (nonatomic, assign, readonly) CGRect messageFrame;
@property (nonatomic, assign, readonly) CGRect messageAttrFrame;
@property (nonatomic, assign, readonly) CGRect photosViewFrame;
@property (nonatomic, assign, readonly) CGRect bottomBarFrame;
@property (nonatomic, assign, readonly) CGRect adImageViewFrame;
@property (nonatomic, assign, readonly) CGRect containerFrame;
@property (nonatomic, assign, readonly) CGRect lineViewFrame;
@property (nonatomic, assign, readonly) CGFloat height;
@end
