//
//  Article.h
//  JasonParsing
//
//  Created by Kenan Uzel on 4/8/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import <Mantle/Mantle.h>


typedef enum : NSUInteger {
    PDStateOpen,
    PDStateClosed
} PDState;


@interface Article : MTLModel<MTLJSONSerializing,MTLTransformerErrorHandling>


//article properties
@property(nonatomic, readonly) NSString *articleTitle;
@property(copy, nonatomic, readonly) NSNumber *articleID;
@property(copy, nonatomic, readonly) NSString *titlePlain;
@property (nonatomic, assign, readonly) PDState state;
@property(copy, nonatomic, readonly) NSString *articleExcerpt;
@property(copy, nonatomic, readonly) NSString *articleBody;
@property(copy, nonatomic, readonly) NSURL *articleURL;
@property(copy, nonatomic, readonly) NSDate *articleDate;
@property(copy, nonatomic, readonly) NSString *authorName;
@property(copy, nonatomic, readonly) NSArray *articleCategories;
@property(copy, nonatomic) NSArray *articleAttachments;


@end
