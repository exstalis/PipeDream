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

@property(strong, nonatomic) NSArray *searchResults;

-(id) translateFromJSONDictionary:(NSDictionary *)articleJSON withClassName:(NSString*)className;

-(id) translateFromJSONArray:(NSArray *)articleJSON withClassName:(NSString*)className;



-(void)getRecentArticleWithCompletion:(ArrayCompletionBlock)completion;

-(void)getOpinionArticlesWithCompletion:(ArrayCompletionBlock)completion;

-(void)getReleaseArticlesWithCompletion:(ArrayCompletionBlock)completion;

-(void)getSportsArticlesWithCompletion:(ArrayCompletionBlock)completion;

-(void)getNewsArticlesWithCompletion:(ArrayCompletionBlock)completion;

-(void)getFilteredContent:(ArrayCompletionBlock)completion;



@end
