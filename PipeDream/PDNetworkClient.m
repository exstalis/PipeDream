//
//  PDNetworkClient.m
//  PipeDream
//
//  Created by elif ece arslan on 4/13/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDNetworkClient.h"
#import <QuartzCore/QuartzCore.h>
#import <AFNetworking/AFNetworking.h>
#import <Mantle/Mantle.h>
#import "PDSingleton.h"
#import "ArticleCategory.h"
#import "Attachments.h"
#import "Blocks.h"
#import "RequestOperationConfig.h"


@interface PDNetworkClient ()
//@property (nonatomic,strong)PDJSONTranslator *translator;

+ (AFHTTPRequestOperation *)createHTTPRequestOperationWithConfiguration:(RequestOperationConfigBlock)configuration;
@end



@implementation PDNetworkClient

static NSString * const kPDClientAPIBaseURLString = @"http://wwww.bupipedream.com/api/";

static NSString * const kPDClientJSONRecentPostString=@"http://www.bupipedream.com/api/get_recent_posts/";

static NSString * const kPDClientJSONOpinionPostsString = @"http://www.bupipedream.com/api/get_category_posts/?slug=opinion/";

static NSString * const kPDClientJSONReleasePostsString = @"http://www.bupipedream.com/api/get_category_posts/?slug=release/";

static NSString * const kPDClientJSONSportsPostsString = @"http://www.bupipedream.com/api/get_category_posts/?slug=sports/";

static NSString * const kPDClientJSONNewsPostsString = @"http://www.bupipedream.com/api/get_category_posts/?slug=news/";

static NSString * const kPDClientJSONSearchPostsString = @"http://www.bupipedream.com/api/get_search_results/?search='binghamton'";



-(id) translateFromJSONDictionary:(NSDictionary *)articleJSON withClassName:(NSString*)className{
    
    NSError *error;
    NSArray *articleInfo =[MTLJSONAdapter modelOfClass:NSClassFromString(className) fromJSONDictionary:articleJSON error:&error];
    
    
    
    
    if (error) {
        NSLog(@"Couldn't convert article JSON to Article Models: %@", error);
        return nil;
    }
    return articleInfo;
}

-(id)translateFromJSONArray:(NSArray *)articleJSON withClassName:(NSString*)className{
    
    NSError *error=nil;
    NSArray *articleInfo=[MTLJSONAdapter modelsOfClass:NSClassFromString(className)fromJSONArray:articleJSON error:&error];
   
    
    if (error) {
        NSLog(@"Couldn't convert article JSON to Article Models: %@", error);
        return nil;
    }
    return articleInfo;
    
}




+ (AFHTTPRequestOperation *)createHTTPRequestOperationWithConfiguration:(RequestOperationConfigBlock)configuration
{
    
    NSParameterAssert(configuration != nil);
    RequestOperationConfig* requestOperationConfig = [[RequestOperationConfig alloc] init];
    if (configuration) {
        configuration(requestOperationConfig);
    }
    NSURLRequest *request = [NSURLRequest requestWithURL:[requestOperationConfig URL]];
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    requestOperation.responseSerializer = requestOperationConfig.responseSerializer;
    return requestOperation;
    
}

-(void)getRecentArticleWithCompletion:(ArrayCompletionBlock)completion{
    
    AFHTTPRequestOperation *operation=[PDNetworkClient createHTTPRequestOperationWithConfiguration:^(RequestOperationConfig *config) {
        config.URL=[NSURL URLWithString:kPDClientJSONRecentPostString];
        config.responseSerializer=[AFJSONResponseSerializer serializer];
    }];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (completion==nil) {
            return;
        }
        
        NSArray * recentArticles=[self translateFromJSONArray:[responseObject objectForKey:@"posts"] withClassName:@"Article"];
        
                completion(recentArticles,nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
        
    }];
    
    [operation start];

}

- (void)getOpinionArticlesWithCompletion:(ArrayCompletionBlock)completion
{
    AFHTTPRequestOperation *operation = [PDNetworkClient createHTTPRequestOperationWithConfiguration:^(RequestOperationConfig *config) {
        
        config.URL = [NSURL URLWithString:kPDClientJSONOpinionPostsString];
        config.responseSerializer = [AFJSONResponseSerializer serializer];
    }];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (completion == nil) {
            return;
        }
        
        NSArray *opinionArticles = [self translateFromJSONArray:[responseObject objectForKey:@"posts"] withClassName:@"Article"];
        
        completion(opinionArticles, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
        
    }];
    
    [operation start];
}


-(void)getReleaseArticlesWithCompletion:(ArrayCompletionBlock)completion
{
    
    AFHTTPRequestOperation *operation = [PDNetworkClient createHTTPRequestOperationWithConfiguration:^(RequestOperationConfig *config) {
        config.URL = [NSURL URLWithString:kPDClientJSONReleasePostsString];
        config.responseSerializer = [AFJSONResponseSerializer serializer];
    }];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (completion == nil) {
            return;
        }
        
        NSArray *releaseArticles = [self translateFromJSONArray:[responseObject objectForKey:@"posts"] withClassName:@"Article"];
        
        completion(releaseArticles, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
        
    }];
    
    [operation start];
}

-(void)getSportsArticlesWithCompletion:(ArrayCompletionBlock)completion
{
    
    AFHTTPRequestOperation *operation = [PDNetworkClient createHTTPRequestOperationWithConfiguration:^(RequestOperationConfig *config) {
        config.URL = [NSURL URLWithString:kPDClientJSONSportsPostsString];
        config.responseSerializer = [AFJSONResponseSerializer serializer];
    }];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (completion == nil) {
            return;
        }
        
        NSArray *sportsArticles = [self translateFromJSONArray:[responseObject objectForKey:@"posts"] withClassName:@"Article"];
        
        completion(sportsArticles, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
        
    }];
    
    [operation start];
}
-(void)getNewsArticlesWithCompletion:(ArrayCompletionBlock)completion{
    
    
    
    AFHTTPRequestOperation *operation = [PDNetworkClient createHTTPRequestOperationWithConfiguration:^(RequestOperationConfig *config) {
        config.URL = [NSURL URLWithString:kPDClientJSONNewsPostsString];
        config.responseSerializer = [AFJSONResponseSerializer serializer];
    }];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (completion == nil) {
            return;
        }
        
        NSArray *newsArticles = [self translateFromJSONArray:[responseObject objectForKey:@"posts"] withClassName:@"Article"];
        
        completion(newsArticles, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
        
    }];
    
    [operation start];
    
    
}

-(void)getFilteredContent:(ArrayCompletionBlock)completion {
    
    AFHTTPRequestOperation *operation = [PDNetworkClient createHTTPRequestOperationWithConfiguration:^(RequestOperationConfig *config) {
        config.URL = [NSURL URLWithString:kPDClientJSONSearchPostsString];
        config.responseSerializer = [AFJSONResponseSerializer serializer];
    }];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(completion == nil) {
            return;
        }
        
        _searchResults = [self translateFromJSONArray:[responseObject objectForKey:@"posts"] withClassName:@"Article"];
        completion(_searchResults, nil);
        
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                if (completion) {
                    completion(nil, error);
                }
            }];
    [operation start];
    
}


@end
