//
//  Attachments.m
//  JasonParsing
//
//  Created by Kenan Uzel on 4/9/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import "Attachments.h"

#import "Image.h"


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
- (void)mergeValuesForKeysFromModel:(MTLModel *)model {
    for (NSString *key in self.class.propertyKeys) {
        if (![model.class.propertyKeys containsObject:key]) continue;
        
        [self mergeValueForKey:key fromModel:model];
    }
}

@end
