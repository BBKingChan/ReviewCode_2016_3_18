//
//  KECHomeManager.h
//  KidEducationCircle
//
//  Created by jiong23 on 15/6/9.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KECNetworkTool.h"


typedef void (^CompletionBlock)(id responseObj);
typedef void (^NetworkErrorBlock)(NSError* error);
@interface KECFourmManager : KECNetworkTool

//上传图片所需，之后将修改AFN
+ (NSString*)base64Param:(NSDictionary*)param svnCode:(NSString *)svcCode;
+ (NSString *)timestamp;


/**
 *  加载首页论坛数据
 */
+ (void)homeWithParameters:(NSDictionary *)parameters
              onCompletion:(CompletionBlock)completionBlock
                   onError:(NetworkErrorBlock)errorBlock;
/**
 *  加载首页广告
 */
+ (void)bannerWithParameters:(NSDictionary *)parameters
     onCompletion:(CompletionBlock)completionBlock
          onError:(NetworkErrorBlock)errorBlock;

/**
 *  加载新帖
 */
+ (void)newPostWithParameters:(NSDictionary *)parameters
        onCompletion:(CompletionBlock)completionBlock
             onError:(NetworkErrorBlock)errorBlock;

/**
 *  加载我关注的
 */
+ (void)myConcern_Path:(NSString *)url
            parameters:(NSDictionary *)parameters
          onCompletion:(CompletionBlock)completionBlock
               onError:(NetworkErrorBlock)errorBlock;

/**
 *  加载发起的
 */
+ (void)originatorWithParameters:(NSDictionary *)parameters
                    onCompletion:(CompletionBlock)completionBlock
                         onError:(NetworkErrorBlock)errorBlock;

/**
 *  加载热门话题
 */
+ (void)hotTopicWithParameters:(NSDictionary *)parameters
                  onCompletion:(CompletionBlock)completionBlock
                       onError:(NetworkErrorBlock)errorBlock;

/**
 *  加载栏目
 */
+ (void)columnWithParameters:(NSDictionary *)parameters
                onCompletion:(CompletionBlock)completionBlock
                     onError:(NetworkErrorBlock)errorBlock;

/**
 *  加载帖子详情
 */
+ (void)threadDetailWithParameters:(NSDictionary *)parameters
                      onCompletion:(CompletionBlock)completionBlock
                           onError:(NetworkErrorBlock)errorBlock;

/**
 *  搜索
 */
+ (void)searchWithParameters:(NSDictionary *)parameters
                     svcCode:(NSString *)svcCode
                onCompletion:(CompletionBlock)completionBlock
                     onError:(NetworkErrorBlock)errorBlock;
/**
 *  收藏话题
 */
+ (void)collectionTopicWithParams:(NSDictionary *)params;

/**
 *  发表帖子
 */
+ (void)postThreadWithParameters:(NSDictionary *)parameters
                    onCompletion:(CompletionBlock)completionBlock
                         onError:(NetworkErrorBlock)errorBlock;

/**
 *  点赞
 */
+ (void)thumbWithParameters:(NSDictionary *)parameters
               onCompletion:(CompletionBlock)completionBlock
                    onError:(NetworkErrorBlock)errorBlock;

/**
 *  话题列表
 */
+ (void)topicListWithParameters:(NSDictionary *)parameters
                   onCompletion:(CompletionBlock)completionBlock
                        onError:(NetworkErrorBlock)errorBlock;

/**
 *  回复话题
 */
+ (void)replyTopicWithParameters:(NSDictionary *)parameters
                    onCompletion:(CompletionBlock)completionBlock
                         onError:(NetworkErrorBlock)errorBlock;

/**
 *  举报
 */
+ (void)reportWithParameters:(NSDictionary *)parameters
                onCompletion:(CompletionBlock)completionBlock
                     onError:(NetworkErrorBlock)errorBlock;

/**
 *  最新话题 && 话题资料
 */
+ (void)newestTopicWithParameters:(NSDictionary *)parameters
                     onCompletion:(CompletionBlock)completionBlock
                          onError:(NetworkErrorBlock)errorBlock;

/**
 *  关注论坛
 */
+ (void)attendColumnWithParameters:(NSDictionary *)parameters
                onCompletion:(CompletionBlock)completionBlock
                     onError:(NetworkErrorBlock)errorBlock;

/**
 *  精华
 */
+ (void)essenceWithParameters:(NSDictionary *)parameters
                 onCompletion:(CompletionBlock)completionBlock
                      onError:(NetworkErrorBlock)errorBlock;

/**
 *  关注人列表
 */
+ (void)attentionPeopleListWithParameters:(NSDictionary *)parameters
                             onCompletion:(CompletionBlock)completionBlock
                                  onError:(NetworkErrorBlock)errorBlock;
/**
 *  论坛美图
 */
+ (void)meituForumWithParameters:(NSDictionary *)parameters
                    onCompletion:(CompletionBlock)completionBlock
                         onError:(NetworkErrorBlock)errorBlock;

/**
 *  论坛列表
 */
+ (void)columnListWithParameters:(NSDictionary *)parameters
                    onCompletion:(CompletionBlock)completionBlock
                         onError:(NetworkErrorBlock)errorBlock;

/**
 *  论坛成员
 */
+ (void)columnMemberWithParameters:(NSDictionary *)parameters
                      onCompletion:(CompletionBlock)completionBlock
                           onError:(NetworkErrorBlock)errorBlock;

/**
 *  保存个人信息
 */
+ (void)saveProfileWithParameters:(NSDictionary *)parameters
                     onCompletion:(CompletionBlock)completionBlock
                          onError:(NetworkErrorBlock)errorBlock;

/**
 *  创建新话题
 */
+ (void)createTopicWithParameters:(NSDictionary *)parameters
                        onCompletion:(CompletionBlock)completionBlock
                             onError:(NetworkErrorBlock)errorBlock;

/**
 *  创建新话题
 */
+ (void)createNewTopicWithParameters:(NSDictionary *)parameters
                        onCompletion:(CompletionBlock)completionBlock
                             onError:(NetworkErrorBlock)errorBlock;

/**
 *  关注他人
 */
+ (void)attendPeopleWithParameters:(NSDictionary *)parameters
                      onCompletion:(CompletionBlock)completionBlock
                           onError:(NetworkErrorBlock)errorBlock;

/**
 *  收藏
 */
+ (void)starTopicWithParameters:(NSDictionary *)parameters
                   onCompletion:(CompletionBlock)completionBlock
                        onError:(NetworkErrorBlock)errorBlock;

/**
 *  论坛选择列表
 */
+ (void)columnSelectedMenuWithParameters:(NSDictionary *)parameters
                            onCompletion:(CompletionBlock)completionBlock
                                 onError:(NetworkErrorBlock)errorBlock;

/**
 * 添加喜欢的论坛
 */
+ (void)addFavoriteColumnWithParameters:(NSDictionary *)parameters
                           onCompletion:(CompletionBlock)completionBlock
                                onError:(NetworkErrorBlock)errorBlock;

/**
 * 取消喜欢的论坛
 */
+ (void)cancalColumnWithParameters:(NSDictionary *)parameters
                      onCompletion:(CompletionBlock)completionBlock
                           onError:(NetworkErrorBlock)errorBlock;

/**
 * 话题关键词列表搜索
 */

+ (void)keyWordsListWithParameters:(NSDictionary *)parameters
                      onCompletion:(CompletionBlock)completionBlock
                           onError:(NetworkErrorBlock)errorBlock;

/**
 * App启动请求 默认打开app时1小时请求一次
 */
+ (void)launchAppInfomationWithParameters:(NSDictionary *)parameters
                             onCompletion:(CompletionBlock)completionBlock
                                  onError:(NetworkErrorBlock)errorBlock;
@end
