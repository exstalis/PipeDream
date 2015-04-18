//
//  Article.h
//  JasonParsing
//
//  Created by Kenan Uzel on 4/8/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "Attachments.h"
#import "ArticleCategory.h"

@interface Article : MTLModel<MTLJSONSerializing>

//article properties
@property(nonatomic,readonly)NSNumber *identifier;
@property(copy, nonatomic, readonly) NSString *title;
@property(copy, nonatomic, readonly) NSString *excerpt;
@property(copy, nonatomic, readonly) NSString *body;
@property(copy, nonatomic, readonly) NSURL *url;
@property(copy, nonatomic, readonly) NSDate *date;
@property(copy, nonatomic, readonly) NSDictionary *author;
@property(copy, nonatomic, readonly) NSArray *attachments;
@property(copy, nonatomic, readonly) NSArray *categories;



@end
