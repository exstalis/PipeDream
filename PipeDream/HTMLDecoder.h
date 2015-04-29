//
//  HTMLDecoder.h
//  PipeDream
//
//  Created by Kenan Uzel on 4/29/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMLDecoder : NSObject

- (NSString *)decodeHTMLEntities:(NSString *)decodedString;
@end
