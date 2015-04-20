//
//  Author.m
//  JasonParsing
//
//  Created by Kenan Uzel on 4/10/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import "Author.h"

@implementation Author

+(NSDictionary *) JSONKeyPathsByPropertyKey {
    return @{
             @"authorID" : @"id",
             @"fullName" : @"name",
             @"url" : @"url"
             };
}

//transforms the URL
+ (NSValueTransformer *) urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
