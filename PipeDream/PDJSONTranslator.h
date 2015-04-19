//
//  PDJSONTranslator.h
//  PipeDream
//
//  Created by elif ece arslan on 4/17/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "Article.h"

@interface PDJSONTranslator : NSObject<MTLTransformerErrorHandling,MTLJSONSerializing>


-(NSArray *) translateJSONForArticle:(NSDictionary *)articleJSON ;




@end
