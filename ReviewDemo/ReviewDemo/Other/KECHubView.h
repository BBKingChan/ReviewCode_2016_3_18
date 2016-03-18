//
//  KECHubView.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/18.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KECHubView : NSObject
+ (void)showHubWithText:(NSString *)text AddedTo:(UIView *)view;
+ (void)showHubWithText:(NSString *)text AddedTo:(UIView *)view AfterDelay:(NSInteger)delay;

+ (void)showHubWithSynchronousStatus:(NSString *)status;
+ (void)showHubWithStatus:(NSString *)status;
+ (void)dismiss;
@end
