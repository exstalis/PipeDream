//
//  PDJSONTranslator.m
//  PipeDream
//
//  Created by elif ece arslan on 4/17/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDJSONTranslator.h"


@implementation PDJSONTranslator

- (id)translateModelFromJSON:(NSDictionary *)JSON
               withclassName:(NSString *)className
{
    NSParameterAssert(className != nil);
    NSError *error = nil;
    id model = [MTLJSONAdapter modelOfClass:NSClassFromString(className)
                         fromJSONDictionary:JSON
                                      error:&error];
    if (!error) {
        return model;
    } else {
        return nil;
    }
}

- (id)translateCollectionFromJSON:(NSDictionary *)JSON
                    withClassName:(NSString *)className
{
    NSParameterAssert(className != nil);
    if ([JSON isKindOfClass:[NSArray class]]) {
        NSValueTransformer *valueTransformer = [MTLJSONAdapter arrayTransformerWithModelClass:[(className)class]];
        NSArray *collection=[valueTransformer transformedValue:JSON];
        
                    
        return collection;
    }
    return nil;
}
@end
