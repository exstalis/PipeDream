//
//  Attachments.m
//  JasonParsing
//
//  Created by Kenan Uzel on 4/9/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import "Attachments.h"

@implementation Attachments

+(NSDictionary *) JSONKeyPathsByPropertyKey {
    return @{
             @"ID" : @"id",
             @"url" : @"url",
             @"title" : @"title",
             @"caption" : @"caption",
             @"desc" : @"description",
             @"parent" : @"parent",
             @"mimeType" : @"mime_type",
             @"images" : @"images"
             };
}

//transforms the URL


+ (NSValueTransformer *) urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+(NSValueTransformer *) imagesTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:Image.class];
}

@end
