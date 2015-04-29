//
//  CompletionBlocks.h
//  WeatherApp
//
//  Created by Renzo Crisóstomo on 1/14/14.
//  Copyright (c) 2014 Ruenzuo. All rights reserved.
//

#import "RequestOperationConfig.h"
#import <FBSDKShareKit/FBSDKShareKit.h>
#import "PDShareUtility.h"


@class PDShareUtility;


typedef void (^ShareOperationCompletionBlock)(PDShareUtility *shareUtility, NSError *error);

typedef void (^CompletionBlock)(NSError *error);

typedef void (^BooleanCompletionBlock)(BOOL result, NSError *error);

typedef void (^ObjectCompletionBlock)(id object, NSError *error);
//nsarray'i article yapabilirsin

typedef void (^ArrayCompletionBlock)(NSArray *array, NSError *error);

typedef void (^RequestOperationConfigBlock)(RequestOperationConfig *config);
typedef void (^DictionaryCompletionBlock)(NSDictionary *dictionary, NSError *error);