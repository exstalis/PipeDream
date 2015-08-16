//
//  RequestOperationConfig.h
//  PipeDream
//
//  Created by elif ece arslan on 4/13/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface RequestOperationConfig : NSObject

@property (nonatomic, copy, readwrite) NSURL *URL;
@property (nonatomic, copy, readwrite) AFHTTPResponseSerializer *responseSerializer;

@end
