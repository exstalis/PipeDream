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


#import "RequestOperationConfig.h"


@class Article;
@class Image;
@class Author;
@class Attachments;
@class PDSingleton;
@class PDJSONTranslator;




@interface PDNetworkClient : NSObject



-(NSArray *) translateJSONForArticleFromJSONDictionary:(NSDictionary *)articleJSON;

-(NSArray *) translateJSONForArticleFromJSONArray:(NSArray *)articleJSON;


-(void)getArticleFeed:(NSDictionary*)article
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject,id responseMTLModel))success;



-(void)getRecentArticleWithCompletion:(ArrayCompletionBlock)completion;
-(void)getOpinionArticlesWithCompletion:(ArrayCompletionBlock)completion;



@end
