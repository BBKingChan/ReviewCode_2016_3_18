//
//  KECDataManager.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/1.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECDataManager.h"

@implementation KECDataManager
+ (void)dataManagerSetObject:(id)obj forKey:(NSString *)key{
    if (!obj)return;
    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)dataManagerSetValue:(id)value forKey:(NSString *)key{
    if (!value)return;
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)dataManagerObjectForKey:(NSString *)key{
   return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
@end
