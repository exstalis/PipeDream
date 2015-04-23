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


@property(strong, nonatomic, readonly) NSURL *fullSizeImages;
@property(strong, nonatomic, readonly) NSURL *thumbnailSizeImages;
@property(strong, nonatomic, readonly) NSURL *mediumSizeImages;
@property(strong, nonatomic, readonly) NSURL *largeSizeImages;


@end
