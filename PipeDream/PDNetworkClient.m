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
#import "Entity.h"
#import "Image.h"
#import "Author.h"
#import "Blocks.h"
#import "RequestOperationConfig.h"




@implementation PDNetworkClient

static NSString * const kPDClientAPIBaseURLString = @"http://wwww.bupipedream.com/api/";

static NSString * const kPDClientJSONString=@"http://www.bupipedream.com/api/get_post/?post_id=53135/";




+(NSURL *)APIBaseURL{
    
    return [NSURL URLWithString:kPDClientAPIBaseURLString];
    
}





-(void)getArticleFeed:(NSDictionary*)article success:
(void (^)(AFHTTPRequestOperation *operation, id responseObject,id responseMTLModel))success
              failure:
(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    
    NSString *urlString=[NSString stringWithFormat:kPDClientJSONString];
    NSURL *recentPostURL=[NSURL URLWithString:urlString];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:recentPostURL];
    
    AFHTTPRequestOperation *operation=[[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer=[AFJSONResponseSerializer serializer];
   
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error = nil;
        
        Article *articleObject=[MTLJSONAdapter modelOfClass:[Article class] fromJSONDictionary:responseObject error:&error];
            
        [PDSingleton sharedClient].article =[articleObject mutableCopy];
        //NSLog(@"%@", articleObject.excerpt);
        
        
        success(nil, nil, articleObject);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Request Failed: %@, %@", error, error.userInfo);
        
        
        
    }];
    
    [operation start];
    

}

//- (Article *)updateUser:(Article*)article {
//    NSDictionary *articleDict = [MTLJSONAdapter JSONDictionaryFromModel:article];
//    NSDictionary *updatedUser = [self.webClient postToPath:@"users.json" withParameters:userDict];
//    
//    return [MTLJSONAdapter modelOfClass:[User class] fromJSONDictionary:updatedUser error:nil];
//}

//
//__weak MOMCreateChatMessageOperation *weakSelf = self;
//NSURLRequest *request =
//[[MOMNetworkClient sharedClient]
// performRequestForPath:[NSString stringWithFormat:@"/chat/%@/", self.threadIdentifier]
// usingMethod:HIPNetworkClientRequestMethodPost
// withParameters:nil
// data:postData
// identifier:self.requestIdentifier
// completionHandler:^(id parsedData, NSURLResponse *response, NSError *error) {
//     if (nil == error) {
//         __autoreleasing NSError *parseError = nil;
//         MOMChatMessagesResponse *responseObject = [MTLJSONAdapter
//                                                    modelOfClass:[MOMChatMessagesResponse class]
//                                                    fromJSONDictionary:parsedData
//                                                    error:&parseError];
//         
//         if (nil == parseError) {
//             [weakSelf setResponseObject:responseObject];
//         } else {
//             [weakSelf setError:parseError];
//         }
//     } else {
//         [weakSelf setError:error];
//     }
//     
//     [weakSelf setState:MOMRequestOperationStateCompleted];
// }]
//


@end
