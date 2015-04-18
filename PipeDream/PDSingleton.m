//
//  PDSingleton.m
//  PipeDream
//
//  Created by elif ece arslan on 4/13/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDSingleton.h"


static PDSingleton *sharedInstance;
static dispatch_once_t oncePredicate;

@implementation PDSingleton

+(PDSingleton *)sharedClient{
    static PDSingleton *_sharedClient;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] init];
    });
    return _sharedClient;

}

@end
