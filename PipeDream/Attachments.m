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
             @"attachmentID" : @"id",
             @"attachmentTitle" : @"title",
            @"articleImages": @"images"
            };



}





+ (NSValueTransformer *) attachmentsTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+(NSValueTransformer *) imagesJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Image class]];
    
    ;
    
    return self;
}





@end
