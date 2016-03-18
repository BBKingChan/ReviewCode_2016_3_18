//
//  KECHTTPManager.m
//  KidEducationCircle
//
//  Created by jiong23 on 15/6/9.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECHttpTool.h"
#import "AFNetworking.h"

@implementation KECHttpTool
+ (void)GET_Path:(NSString *)url
      parameters:(NSDictionary *)parameters
    onCompletion:(CompletionBlock)completionBlock
         onError:(NetworkErrorBlock)errorBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:url parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObj) {
             if (completionBlock) {
                 completionBlock(responseObj);
             }
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             KECLog(@"errmsg-%@",error.description);
             if (errorBlock) {
                 errorBlock(error);
             }
         }];
}

+ (void)POST_Path:(NSString *)url
       parameters:(NSDictionary *)parameters
     onCompletion:(CompletionBlock)completionBlock
          onError:(NetworkErrorBlock)errorBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/javascript",nil];
    [manager POST:url parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObj) {
              if (completionBlock) {
                  completionBlock(responseObj);
              }
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              KECLog(@"errmsg-%@",error.description);
               KECLog(@"responseString-%@",operation.responseString);
              if (errorBlock) {
                  errorBlock(error);
              }
          }];
    
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/javascript",nil];
//    [session POST:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
//        if (completionBlock) {
//            completionBlock(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        KECLog(@"errmsg-%@",error.description);
//        if (errorBlock) {
//            errorBlock(error);
//        }
//    }];
}


+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    [mgr GET:url parameters:params
     success:^(AFHTTPRequestOperation *operation, id responseObj) {
         if (success) {
             success(responseObj);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    [mgr POST:url parameters:params
      success:^(AFHTTPRequestOperation *operation, id responseObj) {
          if (success) {
              success(responseObj);
          }
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          if (failure) {
              failure(error);
          }
      }];
}

#pragma mark--get同步请求
+ (NSDictionary *)synchronousRequestFromUrlString:(NSString *)urlString
{
    //第一步，创建URL
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    //第二步，通过URL创建网络请求
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    //第三步，连接服务器
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *str = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
    
    NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
    //系统自带JSON解析
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
    
    return resultDic;
}
@end
