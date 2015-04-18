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
#import "Author.h"

@implementation Article

//maps JSON to properties
+ (NSDictionary *) JSONKeyPathsByPropertyKey {
    return @{
             @"identifier" : @"post.id",
             @"title" : @"post.title",
             @"excerpt" : @"post.excerpt",
             @"body" : @"post.content",
             @"url" : @"post.url",
             @"date" : @"post.date",
             @"author" : @"post.author",
             @"attachments" : @"post.attachments",
             @"categories" : @"post.categories"
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
+ (NSValueTransformer *) urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

//transforms the date
+ (NSValueTransformer *) dateJSONTransformer {
    
    
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSString *str, BOOL *success, NSError **error) {
        return [self.dateFormatter dateFromString:str];
    } reverseBlock:^(NSDate *date, BOOL *success, NSError **error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

//transform attachments with a Attachments object
+(NSValueTransformer *) attachmentsTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Attachments.class];
}

//transform attachments with a ArticleCategory object
+(NSValueTransformer *) categoriesTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:ArticleCategory.class];
}

+(NSValueTransformer *) authorTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Author.class];
}



-(instancetype) initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    
    self= [super initWithDictionary:dictionaryValue error:error];
    
    if (self == nil) {
        return nil;
    }
    
    return self;
}



@end
