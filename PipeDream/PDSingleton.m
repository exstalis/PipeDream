//
//  PDSingleton.m
//  PipeDream
//
//  Created by elif ece arslan on 4/13/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDSingleton.h"


static PDSingleton *sharedInstance;


@implementation PDSingleton

+(PDSingleton *)sharedClient{
    @synchronized(self){
        if (sharedInstance==nil) {
            sharedInstance=[[[self class] alloc]init];
            
        }
        return sharedInstance;
    }

}

@end
