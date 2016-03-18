//
//  KECHTTPManager.h
//  KidEducationCircle
//
//  Created by jiong23 on 15/6/9.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionBlock)(id responseObj);
typedef void (^NetworkErrorBlock)(NSError* error);

@interface KECHttpTool : NSObject
+ (void)GET_Path:(NSString *)url
      parameters:(NSDictionary *)parameters
    onCompletion:(CompletionBlock)completionBlock
         onError:(NetworkErrorBlock)errorBlock;

+ (void)POST_Path:(NSString *)url
       parameters:(NSDictionary *)parameters
     onCompletion:(CompletionBlock)completionBlock
          onError:(NetworkErrorBlock)errorBlock;

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

#pragma mark--get同步请求
+ (NSDictionary *)synchronousRequestFromUrlString:(NSString *)urlString;
@end
