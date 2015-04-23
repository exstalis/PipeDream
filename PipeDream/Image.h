//
//  Image.h
//  JasonParsing
//
//  Created by Kenan Uzel on 4/10/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "Attachments.h"

@interface Image : MTLModel <MTLJSONSerializing>


@property(strong, nonatomic, readonly) NSDictionary *fullSizeImages;
@property(strong, nonatomic, readonly) NSDictionary *thumbnailSizeImages;
@property(strong, nonatomic, readonly) NSDictionary *mediumSizeImages;
@property(strong, nonatomic, readonly) NSDictionary *largeSizeImages;


@end
