//
//  Article.m
//  JasonParsing
//
//  Created by Kenan Uzel on 4/8/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import "Article.h"
#import "Attachments.h"
#import "ArticleCategory.h"
#import <MapKit/MapKit.h>
#import "ArticleCategory.h"
#import "Attachments.h"


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
             @"date" : @"date",
             @"authorName" : @"author.name",
             @"articleCategories": @"categories",
             @"articleAttachments" : @"attachments"
             
             };
}
//formats the date
+ (NSDateFormatter *) inputFormatter {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    
    return inputFormatter;
}

+(NSDateFormatter *) outputFormatter {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateStyle:NSDateFormatterShortStyle];
    [outputFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    return outputFormatter;
}

//transforms the URL
+ (NSValueTransformer *) articleURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

//transform attachments with a Attachments object
+(NSValueTransformer *) articleAttachmentsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Attachments class]];
}

//transform attachments with a ArticleCategory object
+(NSValueTransformer *) articleCategoriesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[ArticleCategory class]];
}

//transforms the date
+ (NSValueTransformer *) dateJSONTransformer {
    
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSString *str, BOOL *success, NSError **error) {
        NSDate *date = [self.inputFormatter dateFromString:str];
        return [self.outputFormatter stringFromDate:date];
    } reverseBlock:^(NSDate *date, BOOL *success, NSError **error) {
        return date;
    }];
}

@end
