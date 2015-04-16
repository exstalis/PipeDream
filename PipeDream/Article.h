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
@property(copy, nonatomic, readonly) NSString *title;

@property(copy, nonatomic, readonly) NSString *titlePlain;

@property(copy, nonatomic, readonly) NSString *excerpt;
@property(copy, nonatomic, readonly) NSString *body;
@property(copy, nonatomic, readonly) NSURL *url;
@property(copy, nonatomic, readonly) NSDate *date;
@property(copy, nonatomic, readonly) NSString *author;
@property(copy, nonatomic, readonly) Attachments *attachments;
@property(copy, nonatomic, readonly) ArticleCategory *categories;
//@property(nonatomic,readonly)NSInteger *identifier;


@end
