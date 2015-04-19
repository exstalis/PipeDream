//
//  Author.h
//  JasonParsing
//
//  Created by Kenan Uzel on 4/10/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Author : MTLModel

@property(nonatomic, readonly) NSNumber *authorID;
@property(strong, nonatomic, readonly) NSString *fullName;
@property(strong, nonatomic, readonly) NSURL *url;

@end
