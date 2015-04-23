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
             
             @"thumbnailSizeImages" :@"thumbnail.url",
             @"fullSizeImages" :@"full.url",
             @"mediumSizeImages" : @"medium.url",
             @"largeSizeImages" : @"large.url"
             
             };
}


+ (NSValueTransformer *) imageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}






@end
