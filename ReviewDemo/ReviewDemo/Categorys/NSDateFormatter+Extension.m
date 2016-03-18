//
//  NSDateFormatter+Extension.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/2.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "NSDateFormatter+Extension.h"

@implementation NSDateFormatter (Extension)
+ (id)dateFormatter
{
    return [[self alloc] init];
}

+ (id)dateFormatterWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (id)defaultDateFormatter
{
    return [self dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

@end
