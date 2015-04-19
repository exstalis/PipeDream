//
//  PDJSONTranslator.h
//  PipeDream
//
//  Created by elif ece arslan on 4/17/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface PDJSONTranslator : NSObject<MTLTransformerErrorHandling>



- (id)translateModelFromJSON:(NSDictionary *)JSON
               withclassName:(NSString *)className;
- (id)translateCollectionFromJSON:(NSDictionary *)JSON
                    withClassName:(NSString *)className;




//- (id)translateModelfromManagedObject:(NSManagedObject *)managedObject
//                        withClassName:(NSString *)className;
//- (id)translateCollectionfromManagedObjects:(NSArray *)managedObjects
//                              withClassName:(NSString *)className;
//

@end
