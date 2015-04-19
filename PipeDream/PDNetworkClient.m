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



-(NSArray *) translateJSONForArticleFromJSONDictionary:(NSDictionary *)articleJSON {
    
    NSError *error;
    NSArray *articleInfo =[MTLJSONAdapter modelOfClass:[Article class] fromJSONDictionary:articleJSON error:&error];
    if (error) {
        NSLog(@"Couldn't convert article JSON to Article Models: %@", error);
        return nil;
    }
    return articleInfo;
}

-(NSArray *)translateJSONForArticleFromJSONArray:(NSArray *)articleJSON{
    
    
    NSError *error=nil;
    NSArray *articleInfo=[MTLJSONAdapter modelsOfClass:[Article class] fromJSONArray:articleJSON error:&error];
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
        
        
        
        NSArray * recentarticleColletion=[self translateJSONForArticleFromJSONArray:[responseObject objectForKey:@"posts"]];
        
        
        
//        Article *recentarticleColletion=[MTLJSONAdapter modelOfClass:[Article class] fromJSONDictionary:responseObject error:&error];
//        
        [PDSingleton sharedClient].articleArray =[recentarticleColletion mutableCopy];
        
              completion(recentarticleColletion,nil);
        
           } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
        
    }];
    
    [operation start];
//    [[NSOperationQueue mainQueue] addOperation:operation];

    
}





//-(void)getArticleFeed:(NSDictionary*)article success:
//(void (^)(AFHTTPRequestOperation *operation, id responseObject,id responseMTLModel))success
//              failure:
//(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
//    
//    
//    NSString *urlString=[NSString stringWithFormat:kPDClientJSONString];
//    NSURL *recentPostURL=[NSURL URLWithString:urlString];
//    
//    NSURLRequest *request=[NSURLRequest requestWithURL:recentPostURL];
//    
//    AFHTTPRequestOperation *operation=[[AFHTTPRequestOperation alloc]initWithRequest:request];
//    operation.responseSerializer=[AFJSONResponseSerializer serializer];
//   
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSError *error = nil;
//        
//        
//        
//        Article *articleObject=[MTLJSONAdapter modelOfClass:[Article class] fromJSONDictionary:responseObject error:&error];
//        
//        
////        Article *articleObject=[articleObject initWithDictionary:responseObject error:&error];
//
//        
//        [PDSingleton sharedClient].article =[articleObject mutableCopy];
//        
//        
//        
//        success(nil, nil, articleObject);
//
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"Request Failed: %@, %@", error, error.userInfo);
//        
//        
//        
//    }];
//    
//    [operation start];
//    
//
//}



@end
