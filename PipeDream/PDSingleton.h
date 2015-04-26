//
//  PDSingleton.h
//  PipeDream
//
//  Created by elif ece arslan on 4/13/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Article;
@class ArticleCategory;
@class Attachments;


@interface PDSingleton : NSObject
@property (nonatomic, retain, readwrite) Article *sharedArticle;
@property NSMutableDictionary *articleDictionary;
@property NSArray * opinionArticleArray;

@property(nonatomic,assign)BOOL skipLogin;


+(PDSingleton*)sharedClient;

- (id)initWithArticle:(Article *)article;

@property (nonatomic, strong) NSMutableSet *currentArticleOperations;
@property (nonatomic, strong) NSOperationQueue *articleOperationQueue;


//- (void)fetchArticleObjectsFromArray:(NSArray *)articles;
-(NSString *)stripHTMLEntities:(NSString *)encodedString;

@end
