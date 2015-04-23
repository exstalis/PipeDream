//
//  Attachments.h
//  JasonParsing
//
//  Created by Kenan Uzel on 4/9/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//


#import <Mantle/Mantle.h>
#import "Article.h"

@interface Attachments :MTLModel <MTLJSONSerializing>

@property(nonatomic, readonly,strong) NSDictionary *fullImage;
@property(strong, nonatomic, readonly) NSDictionary *thumbnailImage;
@property(strong, nonatomic, readonly) NSDictionary *mediumImage;
@property(strong, nonatomic, readonly) NSDictionary *largeImage;

@end
