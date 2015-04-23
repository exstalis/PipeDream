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



//transforms the URL
+ (NSValueTransformer *) thumbnailSizeImagesJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *) fullSizeImagesJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *) largeSizeImagesJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}




@end
