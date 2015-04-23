//
//  Article.m
//  JasonParsing
//
//  Created by Kenan Uzel on 4/8/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import "Article.h"
#import "Author.h"
#import <MapKit/MapKit.h>

#import "ArticleCategory.h"
#import "Attachments.h"

#import "Image.h"

@implementation Article

//maps JSON to properties
+ (NSDictionary *) JSONKeyPathsByPropertyKey {
    return @{
             
             @"articleID" : @"id",
             @"articleTitle" : @"title",
             @"titlePlain" : @"title_plain",
             @"articleExcerpt" : @"excerpt",
             @"articleBody":@"content",
             @"articleURL" : @"url",
             @"articleDate" : @"date",
             @"authorName" : @"author.name",
             @"articleCategories": @"categories",
             @"articleAttachments" : @"attachments"
             
             };
}
//formats the date
+ (NSDateFormatter *) dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return dateFormatter;
}



//transforms the URL
+ (NSValueTransformer *) articleURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}


//transforms the date
+ (NSValueTransformer *) aricleDateJSONTransformer {
    
    
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSString *str, BOOL *success, NSError **error) {
        return [self.dateFormatter dateFromString:str];
    } reverseBlock:^(NSDate *date, BOOL *success, NSError **error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

//transform attachments with a ArticleCategory object
+(NSValueTransformer *) articleCategoriesTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[ArticleCategory class]];
    
    
    
}


//transform attachments with a Attachments object
+(NSValueTransformer *) articleAttachmentsTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Attachments class]];
}





- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    _articleDate = [NSDate date];

    
    return self;
}



@end
