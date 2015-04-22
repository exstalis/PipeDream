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



-(NSArray *) translateFromJSONDictionary:(NSDictionary *)articleJSON withClassName:(NSString*)className;

-(NSArray *) translateFromJSONArray:(NSArray *)articleJSON withClassName:(NSString*)className;



-(void)getRecentArticleWithCompletion:(ArrayCompletionBlock)completion;
-(void)getOpinionArticlesWithCompletion:(ArrayCompletionBlock)completion;



@end
