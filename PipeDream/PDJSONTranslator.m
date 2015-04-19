//
//  PDJSONTranslator.m
//  PipeDream
//
//  Created by elif ece arslan on 4/17/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDJSONTranslator.h"


@implementation PDJSONTranslator





//- (NSValueTransformer *)stateJSONTransformer {
//    NSDictionary *states = @{
//                             @"ok": @(PDStateOpen),
//                             @"closed": @(PDStateClosed)
//                             };
//    
//    
//    
//    return [MTLValueTransformer
//            transformerUsingForwardBlock:^(id value, BOOL *success, NSError **error) {
//                return states[value];
//            }
//            reverseBlock:^(id value, BOOL *success, NSError **error) {
//                return [states allKeysForObject:states].lastObject;
//                
//            }];
//    
//    
//    
//}

-(NSArray *) translateJSONForArticle:(NSDictionary *)articleJSON {
    
    NSError *error;
    NSArray *articleInfo =[MTLJSONAdapter modelOfClass:[Article class] fromJSONDictionary:articleJSON error:&error];
    if (error) {
        NSLog(@"Couldn't convert article JSON to Article Models: %@", error);
        return nil;
    }
    return articleInfo;
}




@end
