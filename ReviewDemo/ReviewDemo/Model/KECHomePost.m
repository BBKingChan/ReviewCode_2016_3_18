//
//  KECHomePost.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/18.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECHomePost.h"
#import "KECPhoto.h"
@implementation KECHomePost
- (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"title" : @"subject"};
}

+ (NSDictionary *)objectClassInArray{
    return @{@"attachments" : [KECPhoto class],
             };
}
@end
