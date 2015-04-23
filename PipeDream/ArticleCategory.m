//
//  Category.m
//  JasonParsing
//
//  Created by Kenan Uzel on 4/10/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import "ArticleCategory.h"

@implementation ArticleCategory

+(NSDictionary *) JSONKeyPathsByPropertyKey {
    return @{
             @"categoryID" : @"id",
             @"title" : @"title",
             @"postCount" : @"post_count"
             };
}


+ (NSValueTransformer *) categoryTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}




@end
