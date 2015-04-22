//
//  Category.m
//  JasonParsing
//
//  Created by Kenan Uzel on 4/10/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//

#import "ArticleCategory.h"

@implementation ArticleCategory

+(NSDictionary *) JSONKeyPathsByPropertyKey {
    return @{
             @"categoryID" : @"id",
             @"title" : @"title",
             @"parent" : @"parent",
             @"postCount" : @"post_count"
             };
}
- (void)mergeValuesForKeysFromModel:(MTLModel *)model {
    for (NSString *key in self.class.propertyKeys) {
        if (![model.class.propertyKeys containsObject:key]) continue;
        
        [self mergeValueForKey:key fromModel:model];
    }
}
@end
