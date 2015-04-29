//
//  HTMLDecoder.m
//  PipeDream
//
//  Created by Kenan Uzel on 4/29/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "HTMLDecoder.h"
#import "NSString+HTML.h"
#import "NSString_stripHtml.h"

@implementation HTMLDecoder

-(NSString *)decodeHTMLEntities:(NSString *)encodedString {
    NSString *decodedString = [[NSString alloc]init];
    decodedString = [encodedString stripHtml];
    decodedString = [decodedString kv_decodeHTMLCharacterEntities];
    
    return decodedString;
}
@end
