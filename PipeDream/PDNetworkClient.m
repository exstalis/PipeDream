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



-(NSArray *) translateJSONForArticleFromJSONDictionary:(NSDictionary *)articleJSON withClassName:(NSString *)className {
    
    NSError *error;
    NSArray *articleInfo =[MTLJSONAdapter modelOfClass:NSClassFromString(className) fromJSONDictionary:articleJSON error:&error];
    if (error) {
        NSLog(@"Couldn't convert article JSON to Article Models: %@", error);
        return nil;
    }
    return articleInfo;
}

-(NSArray *)translateJSONForArticleFromJSONArray:(NSArray *)articleJSON withClassName:(NSString *)className {
    
    
    NSError *error=nil;
    NSArray *articleInfo=[MTLJSONAdapter modelsOfClass:NSClassFromString(className) fromJSONArray:articleJSON error:&error];
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
   
        NSArray * recentarticleColletion=[self translateJSONForArticleFromJSONArray:[responseObject objectForKey:@"posts"] withClassName:@"Article"];
     
   
     
        
            completion(recentarticleColletion,nil);}
     
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
        
    }];
    
    [operation start];
//    [[NSOperationQueue mainQueue] addOperation:operation];

    
}




-(void)getRecentAttachmentsFromArray:(ArrayCompletionBlock)completion{
    
    
    
    
    [self getRecentArticleWithCompletion:^(NSArray *array, NSError *error) {
        
        NSArray *imagesArray=[[NSArray alloc]init];
//        NSDictionary *imagesTempDict=[[NSDictionary alloc]init];
        
        NSArray *attachmentsArray= [[NSArray alloc]init];
        _denemeArray=[[NSMutableArray alloc]init];
        
        
        

        
        for (Article *article in array) {
            
        
        
            attachmentsArray =  [self translateJSONForArticleFromJSONArray:[article articleAttachments] withClassName:@"Attachments"];
           

            
            [_denemeArray addObjectsFromArray:attachmentsArray];
        }
        NSLog(@"%@ /n",_denemeArray);
        
        
        
        for (Attachments *attachmentsObjects in  attachmentsArray) {
        
            
                
              Image   * imagesTempDict=[MTLJSONAdapter modelOfClass:[Image class] fromJSONDictionary:attachmentsObjects.images error:nil];
            
            
    

                
        
        }
        
            
    
        
        completion(attachmentsArray,nil);

        
            
    }];
    
    


}
    
        
    
    
    
    
    





@end
