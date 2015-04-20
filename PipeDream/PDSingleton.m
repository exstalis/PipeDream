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


static PDSingleton *sharedInstance;


@implementation PDSingleton


+(PDSingleton *)sharedClient{
    @synchronized(self){
        if (sharedInstance==nil) {
            sharedInstance=[[[self class] alloc]init];
            
        }
        return sharedInstance;
    }

}





- (id)initWithArticle:(Article *)article
{
    if (self = [super init]) {
        self.articleShared=article ;
    }
    return self;
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
