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

@property(nonatomic,strong) NSMutableArray *denemeArray;

@property(nonatomic,strong) NSMutableDictionary *imagesDictionary;



-(NSArray *) translateJSONForArticleFromJSONDictionary:(NSDictionary *)articleJSON withClassName:(NSString *)className;

-(NSArray *) translateJSONForArticleFromJSONArray:(NSArray *)articleJSON withClassName:(NSString *)className ;



-(void)getRecentArticleWithCompletion:(ArrayCompletionBlock)completion;

-(void)getRecentAttachmentsFromArray:(ArrayCompletionBlock)completion;

-(void)getOpinionArticlesWithCompletion:(ArrayCompletionBlock)completion;

-(void)getReleaseArticlesWithCompletion:(ArrayCompletionBlock)completion;

-(void)getSportsArticlesWithCompletion:(ArrayCompletionBlock)completion;

@end
