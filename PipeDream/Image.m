//
//  Image.m
//  JasonParsing
//
//  Created by Kenan Uzel on 4/10/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import "Image.h"

@implementation Image

+(NSDictionary *) JSONKeyPathsByPropertyKey {
    
    return @{
             @"imageURL" : @"full.url",
             @"width" : @"full.width",
             @"height" : @"full.height"
             };
}

//transforms the URL
+ (NSValueTransformer *) imageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}



@end
