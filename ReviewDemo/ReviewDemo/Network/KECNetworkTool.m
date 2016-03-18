//
//  KECNetworkTool.m
//  KidEducationCircle
//
//  Created by jiong23 on 15/6/9.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECNetworkTool.h"
#import "KECHttpTool.h"
#import "MJExtension.h"
@implementation KECNetworkTool
+ (void)GET_Url:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    NSDictionary *params = [param keyValues];
    
    [KECHttpTool GET_Path:url parameters:params onCompletion:^(id responseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:responseObj];
            success(result);
        }
    } onError:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}

+ (void)POST_Url:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    NSDictionary *params = [param keyValues];
    
    [KECHttpTool POST_Path:url parameters:params onCompletion:^(id responseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:responseObj];
            success(result);
        }
    } onError:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
