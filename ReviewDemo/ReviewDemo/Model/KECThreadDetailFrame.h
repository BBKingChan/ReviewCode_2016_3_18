//
//  KECThreadDetailFrame.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/3.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KECThreadDetail.h"
#import <UIKit/UIKit.h>

@interface KECThreadDetailFrame : NSObject
@property (nonatomic, strong) KECThreadDetail *threadDetail;
//@property (nonatomic, assign, readonly) CGRect avatarFrame;
//@property (nonatomic, assign, readonly) CGRect authorFrame;
//@property (nonatomic, assign, readonly) CGRect titleFrame;
//@property (nonatomic, assign, readonly) CGRect floorFrame;
//@property (nonatomic, assign, readonly) CGRect timeFrame;
//@property (nonatomic, assign, readonly) CGRect messageFrame;
//@property (nonatomic, assign, readonly) CGRect bottomBarFrame;
//@property (nonatomic, assign, readonly) CGRect containerFrame;
//@property (nonatomic, assign, readonly) CGRect lineViewFrame;

@property (nonatomic, assign, readonly) CGRect contentFrame;
@property (nonatomic, assign, readonly) CGFloat height;
@end
