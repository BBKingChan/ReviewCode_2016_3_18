//
//  NSString+Extension.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/19.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (CGSize)sizeWith:(CGSize)maxsize fontSize:(CGFloat)fontSize;
//过滤html
+ (NSString *)filterHTML:(NSString *)html;
+ (NSString *)filterHTML2:(NSString *)html;
+ (NSString *)flattenAllHTML:(NSString *)html;

- (NSString *)stringByDecodingXMLEntities;

+ (BOOL)isBlankString:(NSString *)string;

//判断等级
+ (NSString *)creditsWithCredits:(NSUInteger)credits;

- (NSString*)urlEncodedString;
- (NSString*)urlDecodedString;
//过滤表情
+ (NSString *)filterFace:(NSString *)str;

//from GZQ
+ (NSString *)dealWithHTML:(NSString *)message;

+ (NSString *)filterDetail:(NSString *)html;

+ (NSString *)filterWeb:(NSString *)html;

+ (NSString *)emojiStringTran:(NSString * )text;
+ (BOOL)stringContainsEmoji:(NSString *)string;

//来自论坛
+ (NSString *)forumNameWithfid:(NSString *)fid;

//计算汉字的个数
+ (NSInteger)chineseCountOfString:(NSString *)string;
//计算字母的个数
+ (NSInteger)characterCountOfString:(NSString *)string;
//不同字符个数
+ (NSInteger)characterDifferentCountOfString:(NSString *)string;

+(NSString*)encodeString:(NSString*)unencodedString;
@end
