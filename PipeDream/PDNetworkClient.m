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
#import "Article.h"
#import "ArticleCategory.h"
#import "Attachments.h"
#import "Image.h"
#import "Author.h"
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




-(NSArray *) translateFromJSONDictionary:(NSDictionary *)articleJSON withClassName:(NSString*)className{
    
    NSError *error;
    NSArray *articleInfo =[MTLJSONAdapter modelOfClass:NSClassFromString(className) fromJSONDictionary:articleJSON error:&error];
    if (error) {
        NSLog(@"Couldn't convert article JSON to Article Models: %@", error);
        return nil;
    }
    return articleInfo;
}

-(NSArray *)translateFromJSONArray:(NSArray *)articleJSON withClassName:(NSString*)className{
    
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
        
        NSArray * recentarticleColletion=[self translateFromJSONArray:[responseObject objectForKey:@"posts"] withClassName:@"Article"];
        
        [PDSingleton sharedClient].newsArticleArray =[recentarticleColletion mutableCopy];
        
     
        
        completion(recentarticleColletion,nil);
        
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
        

    
        [PDSingleton sharedClient].opinionArticleArray =[opinionArticles mutableCopy];
        
        
        
      
        
        
        completion(opinionArticles, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
        
    }];
    
    [operation start];
}

@end
