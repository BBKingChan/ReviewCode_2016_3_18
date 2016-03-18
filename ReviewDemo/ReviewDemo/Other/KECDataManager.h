//
//  KECDataManager.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/1.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KECDataManager : NSObject

/** NSUserDefault get/set方法 */
+ (void)dataManagerSetObject:(id)obj forKey:(NSString *)key;

+ (void)dataManagerSetValue:(id)value forKey:(NSString *)key;

+ (NSString *)dataManagerObjectForKey:(NSString *)key;

@end
