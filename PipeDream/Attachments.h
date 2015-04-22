//
//  Attachments.h
//  JasonParsing
//
//  Created by Kenan Uzel on 4/9/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//


#import <Mantle/Mantle.h>
#import "Image.h"

@interface Attachments : MTLModel <MTLJSONSerializing>


@property(nonatomic, readonly) NSNumber *ID;
@property(strong, nonatomic, readonly) NSURL *url;
@property(strong, nonatomic, readonly) NSString *title;
@property(strong, nonatomic, readonly) NSString *caption;
@property(strong, nonatomic, readonly) NSString *desc;
@property(nonatomic, readonly) NSNumber *parent;
@property(strong, nonatomic, readonly) NSString *mimeType;
@property(strong, nonatomic, readonly) NSDictionary *images;





@end
