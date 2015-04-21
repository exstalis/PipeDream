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
@property (nonatomic, retain, readwrite) Attachments *sharedAttachments;


@property(nonatomic,assign)BOOL skipLogin;


+(PDSingleton*)sharedClient;

- (instancetype)initWithArticle:(Article *)article;


@property (nonatomic, strong) NSMutableSet *currentArticleOperations;
@property (nonatomic, strong) NSOperationQueue *articleOperationQueue;


//- (void)fetchArticleObjectsFromArray:(NSArray *)articles;

@end
