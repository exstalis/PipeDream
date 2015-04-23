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
             @"fullImage" : @"images.full",
             @"thumbnailImage" : @"images.thumbnail",
             @"mediumImage" : @"images.medium",
             @"largeImage" : @"images.large"
            };



}

@end
