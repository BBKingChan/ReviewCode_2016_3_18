//
//  NSDateFormatter+Extension.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/2.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Extension)

+ (id)dateFormatter;
+ (id)dateFormatterWithFormat:(NSString *)dateFormat;

+ (id)defaultDateFormatter;/*yyyy-MM-dd HH:mm:ss*/
@end
