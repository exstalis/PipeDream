//
//  PDNetworkClient.h
//  PipeDream
//
//  Created by elif ece arslan on 4/13/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "Article.h"
#import "Blocks.h"



@class AFHTTPRequestOperation;


@class Article;
@class Image;
@class Author;
@class Attachments;
@class PDSingleton;




@interface PDNetworkClient : NSObject

@property (nonatomic,strong,readonly) MTLModel *model;

-(void)getArticleFeed:(NSArray*)article
               succes:(void(^)())success failure:(void (^)())failure;


//
//-(void)performRequestForPath:(NSString*)path
//                 usingMethod:(AFHTTPRequestOperation *)operation
//              WithParameters:(NSDictionary*)parameters
//                        data:(NSData*)data
//                  identifier:(NSString*)identifier
//             completionBlock:(void (^) (id , NSURLResponse *, NSError *))completionBlock;



-(void)getArticleFeed:(NSDictionary*)article
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject,id responseMTLModel))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


//
//- (void)getArticleWithCompletion:(ArrayCompletionBlock)completion;
//
//
//- (void)storeArticles:(NSArray *)articles;
//- (void)getArticleWithCategories:(ArticleCategory *)category
//
//                  completion:(ArrayCompletionBlock)completion;
//
//- (void)storeArticle:(NSArray *)articles
//        fromCategory:(ArticleCategory *)category;
//
//
//
//+ (AFHTTPRequestOperation *)createHTTPRequestOperationWithConfiguration:(RequestOperationConfigBlock)configuration;
//
//-(void)getRedditFrontPage:(NSString *)subreddit succes:(void(^)())success failure:(void (^)())failure;
//


+(NSURL*)APIBaseURL;


@end
