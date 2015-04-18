//
//  Image.h
//  JasonParsing
//
//  Created by Kenan Uzel on 4/10/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Image : MTLModel

@property(strong, nonatomic, readonly) NSURL *imageURL;
@property(nonatomic, readonly) NSNumber *width;
@property(nonatomic, readonly) NSNumber *height;

@end
