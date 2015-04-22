//
//  Image.h
//  JasonParsing
//
//  Created by Kenan Uzel on 4/10/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Image : MTLModel <MTLJSONSerializing>


@property(strong, nonatomic, readonly) NSURL *imageURL;
@property(nonatomic, readonly) NSInteger *width;
@property(nonatomic, readonly) NSInteger *height;

@end
