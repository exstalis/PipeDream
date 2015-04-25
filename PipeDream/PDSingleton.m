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
static NSString *const kSkipLoginKey = @"shouldSkipLogin";


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
        self.sharedArticle=article ;
    }
    return self;
}

-(NSString *)stripHTMLEntities:(NSString *)encodedString
{
    NSString *strippedString=[[NSString alloc]init];
    strippedString = [encodedString stripHtml];
    strippedString = [strippedString kv_decodeHTMLCharacterEntities];
    
    return strippedString;
}

//skip facebook login

-(BOOL)skipLogin{
    
    return [[NSUserDefaults standardUserDefaults] boolForKey:kSkipLoginKey];
    
}

-(void)setSkipLogin:(BOOL)skipLogin{
    
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults setBool:skipLogin forKey:kSkipLoginKey];
    [userDefaults synchronize];
    
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
//        if (![[self currentArticleOperations] containsObject:article.title]) {
//            
//- (void)startBackgroundFetchingWithArticle:(NSArray *)articles{
//    
//    for (Article *article in articles) {
//            [[self currentArticleOperations] addObject:article.title];
//            
//            PDSingleton *operation = [[PDSingleton alloc] initWithArticle:article];
//        
//            
//            [[self currentArticleOperations] addObject:article.title];
//            
//            [[self articleOperationQueue] addOperation:operation];
//            
//        }
//    }
//}
//




@end
