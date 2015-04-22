//
//  PDSingleton.m
//  PipeDream
//
//  Created by elif ece arslan on 4/13/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDSingleton.h"
#import "Article.h"
#import "ArticleCategory.h"
#import "Attachments.h"
#import "NSString+HTML.h"
#import "NSString_stripHtml.h"


static PDSingleton *sharedInstance;
static dispatch_once_t oncePredicate;

@implementation PDSingleton


+(PDSingleton *)sharedClient{
    static PDSingleton *_sharedClient;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] init];
    });
    return _sharedClient;

}





- (id)initWithArticle:(Article *)article
{
    if (self = [super init]) {
        self.articleShared=article ;
    }
    return self;
}

-(NSString *)stripHTMLEntities:(NSString *)encodedString
{
    NSString *strippedString;
    strippedString = [encodedString stripHtml];
    strippedString = [strippedString kv_decodeHTMLCharacterEntities];
    
    return strippedString;
}

//- (NSMutableSet *)currentArticleOperations
//{
//    if (!_currentArticleOperations) {
//        _currentArticleOperations = [[NSMutableSet alloc] init];
//    }
//    return _currentArticleOperations;
//}
//- (NSOperationQueue *)articleOperationQueue
//{
//    if (!_articleOperationQueue) {
//        _articleOperationQueue = [[NSOperationQueue alloc] init];
//        _articleOperationQueue.name = @"Article Operation Queue";
//        _articleOperationQueue.maxConcurrentOperationCount = 3;
//    }
//    return _articleOperationQueue;
//    
//}
//
//
//- (void)fetchArticleObjectsFromArray:(NSArray *)articles{
//    
//    for (Article *article in articles) {
//        if (![[self currentArticleOperations] containsObject:article.articleID]) {
//
//            PDSingleton *operation = [[PDSingleton alloc] initWithArticle:article];
//        
//            
//            [[self currentArticleOperations] addObject:article.articleID];
//            
//
//        }
//    }
//}
//
//



@end
