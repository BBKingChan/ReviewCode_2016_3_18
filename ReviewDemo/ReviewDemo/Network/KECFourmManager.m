//
//  KECHomeManager.m
//  KidEducationCircle
//
//  Created by jiong23 on 15/6/9.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECFourmManager.h"
#import "KECHttpTool.h"
@implementation KECFourmManager

static NSString * const kServerScheme = @"http";
static NSString * const kServerHost = @"app.hzjyw.com.cn/bbs";
static NSString * const kServerPath = @"/mobile.php";
static NSString * const kQueryRequestBody = @"r";
static NSString * const kQueryTimeStamp = @"t";

static NSString * const nkServerScheme = @"http";
static NSString * const nkServerHost = @"app.hzjyw.com.cn/bbs";
static NSString * const nkServerPath = @"/mobile.php";
static NSString * const nkQueryRequestBody = @"r";
static NSString * const nkQueryTimeStamp = @"t";

//首页
+ (void)homeWithParameters:(NSDictionary *)parameters
     onCompletion:(CompletionBlock)completionBlock
          onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00070"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
         if (completionBlock) {
             completionBlock(responseObj);
         }
     } onError:^(NSError *error) {
         if (errorBlock) {
             errorBlock(error);
         }
     }];
}

//首页广告
+ (void)bannerWithParameters:(NSDictionary *)parameters
       onCompletion:(CompletionBlock)completionBlock
            onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00009"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}
//新帖
+ (void)newPostWithParameters:(NSDictionary *)parameters
     onCompletion:(CompletionBlock)completionBlock
          onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00071"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//我关注的
+ (void)myConcern_Path:(NSString *)url
          parameters:(NSDictionary *)parameters
        onCompletion:(CompletionBlock)completionBlock
             onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00082"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//我发起的
+ (void)originatorWithParameters:(NSDictionary *)parameters
          onCompletion:(CompletionBlock)completionBlock
               onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00081"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//热门话题
+ (void)hotTopicWithParameters:(NSDictionary *)parameters
          onCompletion:(CompletionBlock)completionBlock
               onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00085"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//论坛栏目
+ (void)columnWithParameters:(NSDictionary *)parameters
                  onCompletion:(CompletionBlock)completionBlock
                       onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00008"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//帖子详情
+ (void)threadDetailWithParameters:(NSDictionary *)parameters
                onCompletion:(CompletionBlock)completionBlock
                     onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00135"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//搜索
+ (void)searchWithParameters:(NSDictionary *)parameters
                     svcCode:(NSString *)svcCode
                onCompletion:(CompletionBlock)completionBlock
                     onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:svcCode] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//话题收藏
+ (void)collectionTopicWithParams:(NSDictionary *)params{
    
    NSString *base64Param = [[self jsonDataWithParam:params svcCode:@"00039"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:params onCompletion:^(id responseObj) {
#warning TODO finish
//        [KECHubView showHubWithStatus:@""]
    } onError:^(NSError *error) {

    }];
}

//发表帖子
+ (void)postThreadWithParameters:(NSDictionary *)parameters
                    onCompletion:(CompletionBlock)completionBlock
                         onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00037"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//点赞
+ (void)thumbWithParameters:(NSDictionary *)parameters
                    onCompletion:(CompletionBlock)completionBlock
                         onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00038"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//话题列表
+ (void)topicListWithParameters:(NSDictionary *)parameters
               onCompletion:(CompletionBlock)completionBlock
                    onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00073"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//回复话题
+ (void)replyTopicWithParameters:(NSDictionary *)parameters
                   onCompletion:(CompletionBlock)completionBlock
                        onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00036"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//举报
+ (void)reportWithParameters:(NSDictionary *)parameters
                    onCompletion:(CompletionBlock)completionBlock
                         onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00016"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//最新话题 && 话题资料
+ (void)newestTopicWithParameters:(NSDictionary *)parameters
                onCompletion:(CompletionBlock)completionBlock
                     onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00109"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//关注论坛
+ (void)attendColumnWithParameters:(NSDictionary *)parameters
                     onCompletion:(CompletionBlock)completionBlock
                          onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00075"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//精华
+ (void)essenceWithParameters:(NSDictionary *)parameters
                onCompletion:(CompletionBlock)completionBlock
                     onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00110"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//关注人列表
+ (void)attentionPeopleListWithParameters:(NSDictionary *)parameters
                 onCompletion:(CompletionBlock)completionBlock
                      onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00111"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//论坛美图
+ (void)meituForumWithParameters:(NSDictionary *)parameters
                             onCompletion:(CompletionBlock)completionBlock
                                  onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00029"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//论坛列表
+ (void)columnListWithParameters:(NSDictionary *)parameters
                    onCompletion:(CompletionBlock)completionBlock
                         onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00018"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//论坛成员
+ (void)columnMemberWithParameters:(NSDictionary *)parameters
                    onCompletion:(CompletionBlock)completionBlock
                         onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00020"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//保存个人信息
+ (void)saveProfileWithParameters:(NSDictionary *)parameters
                      onCompletion:(CompletionBlock)completionBlock
                           onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00004"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//创建话题
+ (void)createTopicWithParameters:(NSDictionary *)parameters
                     onCompletion:(CompletionBlock)completionBlock
                          onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00180"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//创建新话题
+ (void)createNewTopicWithParameters:(NSDictionary *)parameters
                        onCompletion:(CompletionBlock)completionBlock
                             onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00178"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//关注其他人
+ (void)attendPeopleWithParameters:(NSDictionary *)parameters
                      onCompletion:(CompletionBlock)completionBlock
                           onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00028"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//收藏
+ (void)starTopicWithParameters:(NSDictionary *)parameters
                      onCompletion:(CompletionBlock)completionBlock
                           onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00039"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//论坛选择列表
+ (void)columnSelectedMenuWithParameters:(NSDictionary *)parameters
                   onCompletion:(CompletionBlock)completionBlock
                        onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00006"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//添加喜欢的论坛
+ (void)addFavoriteColumnWithParameters:(NSDictionary *)parameters
                            onCompletion:(CompletionBlock)completionBlock
                                 onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00007"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

//取消喜欢的论坛
+ (void)cancalColumnWithParameters:(NSDictionary *)parameters
                           onCompletion:(CompletionBlock)completionBlock
                                onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00019"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}
//话题关键词列表搜索
+ (void)keyWordsListWithParameters:(NSDictionary *)parameters
                      onCompletion:(CompletionBlock)completionBlock
                           onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00113"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, kServerScheme, kServerHost, kServerPath, kQueryRequestBody, base64Param, kQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url- %@",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

+ (void)launchAppInfomationWithParameters:(NSDictionary *)parameters
                   onCompletion:(CompletionBlock)completionBlock
                        onError:(NetworkErrorBlock)errorBlock{
    
    NSString *base64Param = [[self jsonDataWithParam:parameters svcCode:@"00141"] base64EncodedStringWithOptions:kNilOptions];
    NSString *timeStamp = [self timestamp];
    NSString *stringFormat = @"%@://%@%@?api=00141&%@=%@&%@=%@";
    NSString *urlString = [NSString stringWithFormat:stringFormat, nkServerScheme, nkServerHost, nkServerPath, nkQueryRequestBody, base64Param, nkQueryTimeStamp, timeStamp];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    KECLog(@"url-%@  - end",urlString);
    [KECHttpTool POST_Path:urlString parameters:parameters onCompletion:^(id responseObj) {
        if (completionBlock) {
            completionBlock(responseObj);
        }
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}


+ (NSData *)jsonDataWithParam:(NSDictionary *)param svcCode:(NSString *)svcCode
{
    NSDictionary *jsonObject = [self jsonObjectWithParam:param svcCode:svcCode];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:kNilOptions error:&error];
    if (error) {
        KECLog(@"Error occured:%@", [error localizedDescription]);
        abort();
        return nil;
    }
    return jsonData;
}

+ (NSDictionary *)jsonObjectWithParam:(NSDictionary *)param svcCode:(NSString *)svcCode{
    KECLog(@"请求数据----%@",@{@"svc":svcCode,
                          @"version":[self applicationVersionStrng],
                          @"channel":@"Apple App Store",
                          @"p":param
                          });
    
    return @{@"svc":svcCode,
             @"version":[self applicationVersionStrng],
             @"channel":@"Apple App Store",
             @"p":param};
}
//APP版本
+ (NSString *)applicationVersionStrng{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
}


//时间戳
+ (NSString *)timestamp{
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0f", interval];
}


+ (NSString*)base64Param:(NSDictionary*)param svnCode:(NSString *)svcCode{
#warning TODO 图片参数加密
    return [[self jsonDataWithParam:param svcCode:svcCode] base64EncodedStringWithOptions:kNilOptions];
    
}
@end
