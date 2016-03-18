//
//  KECNetworkTool.h
//  KidEducationCircle
//
//  Created by jiong23 on 15/6/9.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KECNetworkTool : NSObject
+ (void)GET_Url:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure;

+ (void)POST_Url:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure;
@end
