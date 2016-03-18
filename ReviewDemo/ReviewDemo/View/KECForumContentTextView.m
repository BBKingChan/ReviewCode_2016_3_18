//
//  KECForumContentTextView.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/8/16.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECForumContentTextView.h"

@implementation KECForumContentTextView



// 绘制 回复XXX 的灰色矩形
- (void)drawRect:(CGRect)rect
{
    __weak KECForumContentTextView *wSelf = self;
    __block NSInteger num = 0;
    [self.layoutManager enumerateLineFragmentsForGlyphRange:NSMakeRange(0, self.text.length) usingBlock:^(CGRect rect, CGRect usedRect, NSTextContainer *textContainer, NSRange glyphRange, BOOL *stop) {
        
        if(num < wSelf.replyRowNum)
        {
            /// The frame of the rectangle.
            UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect:CGRectMake(usedRect.origin.x, usedRect.origin.y + 2, rect.size.width, usedRect.size.height + 5)];
            
            /// Set the background color for each line.
            [RGB(245, 245, 245) setFill];
            
            /// Build the rectangle.
            [rectanglePath fill];
            num ++;
        }
    }];
}
@end
