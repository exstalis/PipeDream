//
//  Category.h
//  JasonParsing
//
//  Created by Kenan Uzel on 4/10/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "Article.h"

@interface ArticleCategory :MTLModel<MTLJSONSerializing>


@property(nonatomic, readonly) NSNumber *categoryID;
@property(strong, nonatomic, readonly) NSString *title;
@property(nonatomic, readonly) NSNumber *parent;
@property(nonatomic, readonly) NSNumber *postCount;

@end
