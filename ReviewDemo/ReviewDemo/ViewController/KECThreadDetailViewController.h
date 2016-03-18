//
//  KECDetailController.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/8/17.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KECThreadDetail.h"

@class KECHomePost;
@interface KECThreadDetailViewController : UIViewController
@property (nonatomic, strong) KECHomePost *homePost;
@property (nonatomic, copy) NSString *tid;
@property (nonatomic, copy) NSString *fid;
@property (nonatomic, copy) NSString *topTitle;
@property (nonatomic, strong) KECThreadDetail *threadDetail;
@property (nonatomic, assign) BOOL isFromPost;

@end
 