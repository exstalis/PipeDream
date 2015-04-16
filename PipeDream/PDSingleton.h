//
//  PDSingleton.h
//  PipeDream
//
//  Created by elif ece arslan on 4/13/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Article;
@class ArticleCategory;
@class Attachments;


@interface PDSingleton : NSObject
+(PDSingleton*)sharedClient;


@property NSMutableDictionary *articleDictionary;
@property NSArray * articleArray;
@property Article *article;


@end
