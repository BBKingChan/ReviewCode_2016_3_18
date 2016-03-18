//
//  NSString+Extension.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/19.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "NSString+Extension.h"
#import "RegexKitLite.h"
#include <netdb.h>
#include <sys/socket.h>


#define MULITTHREEBYTEUTF16TOUNICODE(x,y) (((((x ^ 0xD800) << 2) | ((y ^ 0xDC00) >> 8)) << 8) | ((y ^ 0xDC00) & 0xFF)) + 0x10000

@implementation NSString (Extension)
- (CGSize)sizeWith:(CGSize)maxsize fontSize:(CGFloat)fontSize
{
    return [self boundingRectWithSize:maxsize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
}

#pragma mark ---过滤--图片
+ (NSString *)filterHTML:(NSString *)html
{
    if (!html) {
        return @"";
    }
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO){
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:NULL];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    
    html = [html stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\\t" withString:@" "];
    html = [html stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\\s" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@" " withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"[br]" withString:@"\n"];
   
    
    NSString * regEx = @"<([^>]*)>";
    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    // html = [html stringByReplacingOccurrencesOfString:patternIFrame withString:@""];
    //  NSString *patternIFrame =@"^[#＃][^#＃]{0,12}[#＃]";
    @try {
//        if (html) {
            NSError * error;
            NSString * patternIFrame=@"\\[attach]+[\\d]+\\[/attach]";
            NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:patternIFrame options:0 error:&error];
            NSString * content  = [regularExpression stringByReplacingMatchesInString:html options:0 range:NSMakeRange(0, html.length) withTemplate:@""];
            return content;
//        }
        
    }
    @catch (NSException *exception){}
    @finally {}
    //  html = [html stringByReplacingOccurrencesOfString:regEx1 withString:@""];
    
    return html;
}

+ (NSString *)flattenAllHTML:(NSString *)html {
    
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [NSString stringWithFormat:@"%@>", text]
                                               withString:@""];
    } // while //
    
    NSLog(@"-----===%@",html);
    return html;
}


+ (NSString *)filterWeb:(NSString *)html
{
    
    html = [html stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\\t" withString:@" "];
    html = [html stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\\s" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"  " withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"[br]" withString:@"\n"];
    
//    
//    NSString * regEx = @"<([^>]*)>";
//    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    // html = [html stringByReplacingOccurrencesOfString:patternIFrame withString:@""];
    //  NSString *patternIFrame =@"^[#＃][^#＃]{0,12}[#＃]";
    @try {
        //        if (html) {
        NSError * error;
        NSString * patternIFrame=@"\\[attach]+[\\d]+\\[/attach]";
        NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:patternIFrame options:0 error:&error];
        NSString * content  = [regularExpression stringByReplacingMatchesInString:html options:0 range:NSMakeRange(0, html.length) withTemplate:@""];
        return content;
        //        }
        
    }
    @catch (NSException *exception){}
    @finally {}
    //  html = [html stringByReplacingOccurrencesOfString:regEx1 withString:@""];
    
    return html;
}


+ (NSString *)filterHTML2:(NSString *)html
{
    
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO){
        //找到标签的起始位置
        [scanner scanUpToString:@"[" intoString:NULL];
        //找到标签的结束位置
        [scanner scanUpToString:@"]" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@]",text] withString:@""];
    }
    
    html = [html stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\\t" withString:@" "];
    html = [html stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\\s" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@" " withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"[br]" withString:@"\n"];
    
    NSString * regEx = @"<([^>]*)>";
    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    // html = [html stringByReplacingOccurrencesOfString:patternIFrame withString:@""];
    //  NSString *patternIFrame =@"^[#＃][^#＃]{0,12}[#＃]";
    @try {
        //        if (html) {
        NSError * error;
        NSString * patternIFrame=@"\\[attach]+[\\d]+\\[/attach]";
        NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:patternIFrame options:0 error:&error];
        NSString * content  = [regularExpression stringByReplacingMatchesInString:html options:0 range:NSMakeRange(0, html.length) withTemplate:@""];
        return content;
        //        }
        
    }
    @catch (NSException *exception){}
    @finally {}
    //  html = [html stringByReplacingOccurrencesOfString:regEx1 withString:@""];
    
    return html;
}


//优先调用
- (NSString *)stringByDecodingXMLEntities{
    NSUInteger myLength = [self length];
    NSUInteger ampIndex = [self rangeOfString:@"&" options:NSLiteralSearch].location;
    // Short-circuit if there are no ampersands.
    if (ampIndex == NSNotFound) {
        return self;
    }
    // Make result string with some extra capacity.
        NSMutableString *result = [NSMutableString stringWithCapacity:(myLength * 1.25)];
    // First iteration doesn't need to scan to & since we did that already, but for code simplicity's sake we'll do it again with the scanner.
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner setCharactersToBeSkipped:nil];
    NSCharacterSet *boundaryCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@" \t\n\r;"];
    do {
        // Scan up to the next entity or the end of the string.
        NSString *nonEntityString;
        if ([scanner scanUpToString:@"&" intoString:&nonEntityString]) {
            [result appendString:nonEntityString];
        }
        if ([scanner isAtEnd]) {
            return result;
        }
        // Scan either a HTML or numeric character entity reference.
        if ([scanner scanString:@"&amp;" intoString:NULL])
            [result appendString:@"&"];
        else if ([scanner scanString:@"&apos;" intoString:NULL])
            [result appendString:@"'"];
        else if ([scanner scanString:@"&quot;" intoString:NULL])
            [result appendString:@"\""];
        else if ([scanner scanString:@"&lt;" intoString:NULL])
            [result appendString:@"<"];
        else if ([scanner scanString:@"&gt;" intoString:NULL])
            [result appendString:@">"];
        else if ([scanner scanString:@"&#" intoString:NULL]) {
            BOOL gotNumber;
            unsigned charCode;
            NSString *xForHex = @"";
            
            // Is it hex or decimal?
            if ([scanner scanString:@"x" intoString:&xForHex]) {
                gotNumber = [scanner scanHexInt:&charCode];
            }
            else {
                gotNumber = [scanner scanInt:(int*)&charCode];
            }
            
            if (gotNumber) {
                [result appendFormat:@"%C", (unichar)charCode];
                
                [scanner scanString:@";" intoString:NULL];
            }
            else {
                NSString *unknownEntity = @"";
                
                [scanner scanUpToCharactersFromSet:boundaryCharacterSet intoString:&unknownEntity];
                
                
                [result appendFormat:@"&#%@%@", xForHex, unknownEntity];
                
                //[scanner scanUpToString:@";" intoString:&unknownEntity];
                //[result appendFormat:@"&#%@%@;", xForHex, unknownEntity];
                NSLog(@"Expected numeric character entity but got &#%@%@;", xForHex, unknownEntity);
                
            }
            
        }
        else {
            NSString *amp;
            
            [scanner scanString:@"&" intoString:&amp];      //an isolated & symbol
            [result appendString:amp];
            
            
        }
        
    }
    while (![scanner isAtEnd]);
    
    return result;
}


+ (NSString *)filterFace:(NSString *)str
{
    
    NSString *patternIFrame =@"\\{:[^\\{\\}]*:\\}";
    
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:patternIFrame options:0 error:nil];
    
    NSString * content  = [regularExpression stringByReplacingMatchesInString:str options:0 range:NSMakeRange(0, str.length) withTemplate:@""];
    
    
    
    return content;
    
}

+ (BOOL)isBlankString:(NSString *)string{
    
    if (string == nil || string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]]) {
        
        if ([string isEqualToString:@""]) {
            return YES;
        }
        if (string.length==0) {
            return YES;
        }
        
        if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
            return YES;
        }
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        
        return YES;
        
    }
    return NO;
}

- (NSString*)urlEncodedString{
    
    CFStringRef encodedCFString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                          (__bridge CFStringRef) self,
                                                                          nil,
                                                                          CFSTR("?!@#$^&%*+,:;='\"`<>()[]{}/\\| "),
                                                                          kCFStringEncodingUTF8);
    
    NSString *encodedString = [[NSString alloc] initWithString:(__bridge_transfer NSString*) encodedCFString];
    
    if(!encodedString)
        encodedString = @"";
    
    return encodedString;
    
    
}

+(NSString*)encodeString:(NSString*)unencodedString{
    
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

- (NSString*)urlDecodedString {
    
    CFStringRef decodedCFString = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                          (__bridge CFStringRef) self,
                                                                                          CFSTR(""),
                                                                                          kCFStringEncodingUTF8);
    
    // We need to replace "+" with " " because the CF method above doesn't do it
    NSString *decodedString = [[NSString alloc] initWithString:(__bridge_transfer NSString*) decodedCFString];
    return (!decodedString) ? @"" : [decodedString stringByReplacingOccurrencesOfString:@"+" withString:@" "];
}


+ (NSString *)creditsWithCredits:(NSUInteger)credits
{
    NSString *creadits;
    if (credits<1000) {
        creadits=@"白丁";
    }
    if (credits>1000) {
        creadits=@"书童";
    }
    if (credits>3000) {
        creadits=@"秀才";
    }
    if (credits>8000) {
        creadits=@"举人";
    }
    if (credits>15000) {
        creadits=@"探花";
    }
    if (credits>30000) {
        creadits=@"榜眼";
    }
    if (credits>50000) {
        creadits=@"状元";
    }
    if (credits>80000) {
        creadits=@"侍郎";
    }
    if (credits>110000) {
        creadits=@"尚书";
    }
    if (credits>150000) {
        creadits=@"学士";
    }
    if (credits>200000) {
        creadits=@"司徒";
    }
    if (credits>260000) {
        creadits=@"太傅";
    }
    if (credits>320000) {
        creadits=@"宰相";
    }
    if (credits>400000) {
        creadits=@"太师";
    }
    if (credits>500000) {
        creadits=@"圣贤";
    }
    
    return creadits;
}

+ (NSString *)forumNameWithfid:(NSString *)fid{
    NSDictionary *mapping = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"教育",@"forum1",
                             @"生活",@"forum36",
                             @"爱购",@"forum37",
                             @"同城",@"forum38",
                             @"创业",@"forum195",
                             @"广播专区",@"forum192",
                             @"怀孕胎教",@"forum122",
                             @"早教0-3岁",@"forum126",
                             @"幼教3-6岁",@"forum127",
                             @"小学教育",@"forum120",
                             @"小升初",@"forum181",
                             @"初中教育",@"forum124",
                             @"高中教育",@"forum125",
                             @"家庭教育",@"forum194",
                             @"兴趣特长",@"forum134",
                             @"留学游学",@"forum123",
                             @"活动讲座",@"forum132",
                             @"亲子阅读",@"forum175",
                             @"婚姻情感",@"forum91",
                             @"晒图自拍",@"forum45",
                             @"辣妈生活",@"forum178",
                             @"谈天说地",@"forum176",
                             @"精品特卖",@"forum96",
                             @"母婴购物",@"forum95",
                             @"北京",@"forum97",
                             @"上海",@"forum119",
                             @"广州",@"forum118",
                             @"深圳",@"forum117",
                             @"爸妈创业",@"forum196",
                             @"广播专版",@"forum193",
                             @"幼儿教育",@"forum206",
                             @"幼儿园生活",@"forum207",
                             @"幼儿性格教育",@"forum208",
                             @"幼儿行为习惯",@"forum209",
                             @"家庭教育",@"forum210",
                             @"儿童安全",@"forum211",
                             @"亲子活动",@"forum220",
                             @"儿童饮食",@"forum221",
                             @"儿童健康",@"forum222",
                             @"宝贝照片秀",@"forum226",
                             @"宝贝才艺秀",@"forum227",
                             @"辣妈亲子秀",@"forum228",
                             @"家长学堂",@"forum223",
                             @"老师天地",@"forum224",
                             @"宝宝秀场",@"forum225",
                             nil];
    
    NSString *key = [NSString stringWithFormat:@"forum%@",fid];
    NSString *forumName = [mapping objectForKey:key];
    if (!forumName) {
        forumName = @"孩教圈";
    }
    return forumName;
}

//根据域名获取ip地址
//+ (NSString *) getIPWithHostName:(const NSString *)hostName
//{
//    const char *hostN= [hostName UTF8String];
//    struct hostent* phot;
//    
//    @try {
//        phot = gethostbyname(hostN);
//        
//    }
//    @catch (NSException *exception) {
//        return nil;
//    }
//    
//    struct in_addr ip_addr;
//    memcpy(&ip_addr, phot->h_addr_list[0], 4);
//    char ip[20] = {0};
//    inet_ntop(AF_INET, &ip_addr, ip, sizeof(ip));
//    
//    NSString* strIPAddress = [NSString stringWithUTF8String:ip];
//    return strIPAddress;
//}

#pragma mark - 将正文内容处理为HTML格式数据
+ (NSString *)dealWithHTML:(NSString *)message
{
    NSString *html;
    html = message;
    KECLog(@"dealWithHTML - message:%@",message);
    html = [html stringByReplacingOccurrencesOfString:@"[url=http://citylife.mama.cn/thread/findpost/pid/96/ptid/1][img]http://citylife.mama.cn/images/common/back.gif[/img][/url]" withString:@""];
    
//    //过滤mamaquanimg
//    html = [html stringByReplacingOccurrencesOfRegex:@"[img]http://www\\.gzmama\\.com/api/img/mamaquanimg\\.php\\?img=.+index\\.php[/img]" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"　" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\\t" withString:@""];
    
    html = [html stringByReplacingOccurrencesOfString:@"<strong>" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"</strong>" withString:@""];
    // 把P标签替换掉
    html = [html stringByReplacingOccurrencesOfRegex:@"<p(.*?)>" withString:@""];
    html = [html stringByReplacingOccurrencesOfRegex:@"<font (.*?)>" withString:@""];
    html = [html stringByReplacingOccurrencesOfRegex:@"<table (.*?)>" withString:@""];
    html = [html stringByReplacingOccurrencesOfRegex:@"&lt;span (.*?)>" withString:@""];
    
    html = [html stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"</font>" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"</font>" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"</span>" withString:@""];
    
    html = [html stringByReplacingOccurrencesOfString:@"[quote]" withString:@"<div class=\"othersInfo\">\""];
    html = [html stringByReplacingOccurrencesOfString:@"[/quote]" withString:@"\"</div>\n\n"];
    html = [html stringByReplacingOccurrencesOfString:@"[/size]" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"http://tonglingquan.mama.cn/api/img/mamaquanimg.php?img=" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"[img]{xiguamamaquan" withString:@"<img src=emo_"];
    html = [html stringByReplacingOccurrencesOfString:@"}[/img]" withString:@">"];
    html = [html stringByReplacingOccurrencesOfString:@"[img]" withString:@"<img src="];
    html = [html stringByReplacingOccurrencesOfString:@"[/img]" withString:@" width=\"300\" height=\"200\">"];
    html = [html stringByReplacingOccurrencesOfString:@"[IMG]" withString:@"<img src="];
    html = [html stringByReplacingOccurrencesOfString:@"[/IMG]" withString:@" width=\"300\" height=\"200\">"];
    
    //    html = [html stringByReplacingOccurrencesOfRegex:@"\\?img=.+?\\s" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\\n" withString:@"<br>"];
    //    html = [html stringByReplacingOccurrencesOfString:@"n" withString:@"<br>"];
    html = [html stringByReplacingOccurrencesOfString:@"[smile]" withString:@"<img src="];
    html = [html stringByReplacingOccurrencesOfString:@"[/smile]" withString:@">"];
    
    //过滤link标签
    html = [html stringByReplacingOccurrencesOfString:@"[link]" withString:@"<a style=\"color:rgb(238,194,131)\" href=\""];
    //    html = [html stringByReplacingOccurrencesOfRegex:@"<link>.+\\|\\^\\|" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"|^|" withString:@"\">"];
    html = [html stringByReplacingOccurrencesOfString:@"[/link]" withString:@"</a>"];
    html = [html stringByReplacingOccurrencesOfString:@"</blockquote>" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"<blockquote>" withString:@""];
    
    //过滤表情
//    html = [EmojiUtil forumSymbolToEmotion:html withSize:CGSizeMake(30, 30)];
    
    NSString *htmlStrForDTCell = [NSString stringWithFormat:@"<meta charset=\"UTF-8\"><html><head><style type=\"text/css\">body{padding:0px;margin:0px;padding-left:0px;padding-right:0px;padding-top:0px;font-size:16px;color:rgb(71,68,68);line-height:22px;font-weight:200;text-align:justify;float:left;word-wrap:break-word;} .bottomArea{padding-bottom:0px;} .othersInfo{font-size:14px;line-height:18px; color:rgb(156,156,156);}</style></head><body>%@</body></html>",html];
    
//    GZQLog(@"htmlStr:%@", htmlStrForDTCell);
    return htmlStrForDTCell;
}


#pragma mark ---
+ (NSString *)filterDetail:(NSString *)html
{
    
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO){
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:NULL];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    
//    html = [html stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
//    html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
//    html = [html stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
//    html = [html stringByReplacingOccurrencesOfString:@"\t" withString:@""];
//    html = [html stringByReplacingOccurrencesOfString:@"\\t" withString:@" "];
//    html = [html stringByReplacingOccurrencesOfString:@"\r" withString:@""];
//    html = [html stringByReplacingOccurrencesOfString:@"\\s" withString:@""];
//    html = [html stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
//    html = [html stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    html = [html stringByReplacingOccurrencesOfString:@" " withString:@""];
//    html = [html stringByReplacingOccurrencesOfString:@"[br]" withString:@"\n"];
    html = [html stringByReplacingOccurrencesOfString:@"&#13;" withString:@""];
    
    NSString * regEx = @"<([^>]*)>";
    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    // html = [html stringByReplacingOccurrencesOfString:patternIFrame withString:@""];
    //  NSString *patternIFrame =@"^[#＃][^#＃]{0,12}[#＃]";
    @try {
        //        if (html) {
        NSError * error;
        NSString * patternIFrame=@"\\[attach]+[\\d]+\\[/attach]";
        NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:patternIFrame options:0 error:&error];
        NSString * content  = [regularExpression stringByReplacingMatchesInString:html options:0 range:NSMakeRange(0, html.length) withTemplate:@""];
        return content;
        //        }
        
    }
    @catch (NSException *exception){}
    @finally {}
    //  html = [html stringByReplacingOccurrencesOfString:regEx1 withString:@""];
    
    return html;
}


//转化emoji为uinicode
+ (NSString *)emojiStringTran:(NSString * )text{
    NSString *hexstr = @"";
    if (text.length==0) {
        //等于删除键
        
        return @"";
    }
    
    
    
    for (int i=0;i< [text length];i++)
    {
        hexstr = [hexstr stringByAppendingFormat:@"%@",[NSString stringWithFormat:@"0x%1X ",[text characterAtIndex:i]]];
    }
    NSLog(@"UTF16 [%@]",hexstr);
    
    hexstr = @"";
    
    unsigned long slen = strlen([text UTF8String]);
    
    for (int i = 0; i < slen; i++)
    {
        //fffffff0 去除前面六个F & 0xFF
        hexstr = [hexstr stringByAppendingFormat:@"%@",[NSString stringWithFormat:@"0x%X ",[text UTF8String][i] & 0xFF ]];
    }
    NSLog(@"UTF8 [%@]",hexstr);
    
    hexstr = @"";
    
    if ([text length] >= 2) {
        
        for (int i = 0; i < [text length] / 2 && ([text length] % 2 == 0) ; i++)
        {
            // three bytes
            if (([text characterAtIndex:i*2] & 0xFF00) == 0 ) {
                hexstr = [hexstr stringByAppendingFormat:@"Ox%1X 0x%1X",[text characterAtIndex:i*2],[text characterAtIndex:i*2+1]];
            }
            else
            {// four bytes
                hexstr = [hexstr stringByAppendingFormat:@"%1X",MULITTHREEBYTEUTF16TOUNICODE([text characterAtIndex:i*2],[text characterAtIndex:i*2+1])];
            }
            
        }
        NSLog(@"(unicode) [%@]",hexstr);
    }
    else
    {
        NSLog(@"(unicode) %1X",[text characterAtIndex:0]);
    }
    return hexstr;
}

//判断emoji
+ (BOOL)stringContainsEmoji:(NSString *)string {
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    return returnValue;
}

//计算汉字的个数
+ (NSInteger)chineseCountOfString:(NSString *)string{
    int ChineseCount = 0;
    if (string.length == 0) {
        return 0;
    }
    for (int i = 0; i<string.length; i++) {
        unichar c = [string characterAtIndex:i];
        if (c >=0x4E00 && c <=0x9FA5) {
            ChineseCount++ ;//汉字
        }
    }
    return ChineseCount;
}
    
//计算字母的个数
+ (NSInteger)characterCountOfString:(NSString *)string{
    int characterCount = 0;
    if (string.length == 0) {
        return 0;
    }
    for (int i = 0; i<string.length; i++) {
        unichar c = [string characterAtIndex:i];
        if (c >=0x4E00 && c <=0x9FA5){
            
        }else{
            characterCount++;//英文
        }
    }
    return characterCount;
}

+ (NSInteger)characterDifferentCountOfString:(NSString *)string{
    char str[256]={"??????....测试"};
    int num;
    
    num=fun(str);
    
    return num;
}


int fun(char* str)
{
    char *p;
    char ch[256]={};
    int count=0,i,flag=0;
    
    for(p=str;*p!='\0';p++)
    {
        flag=0;
        for(i=0;i<count;i++)
        {
            if(ch[i]==*p) flag=1;
        }
        
        if(flag==0) ch[count++]=*p;
    }
    
    return count;
}


@end
