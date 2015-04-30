//
//  NSString+HTMLDecoder.m
//  PipeDream
//
//  Created by Kenan Uzel on 4/29/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "NSString+HTMLDecoder.h"
#import "NSString_stripHtml.h"
#import "NSString+HTML.h"

@implementation NSString (HTMLDecoder)

-(NSString *)decodeHTML {
    NSString *decodedString;
    decodedString = [self kv_decodeHTMLCharacterEntities];
    decodedString = [decodedString stripHtml];
    
    return decodedString;
}

@end
