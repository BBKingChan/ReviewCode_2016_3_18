//
//  KECShare.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/7/14.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KECShare : NSObject
@property (nonatomic, copy) NSString *shareTitle;
@property (nonatomic, copy) NSString *shareContent;
@property (nonatomic, copy) NSString *shareUrl;
@property (nonatomic, copy) NSString *shareImage;
@property (nonatomic, copy) NSString *shareID;
@property (nonatomic, strong) UIImage *shareIcon;

@end
