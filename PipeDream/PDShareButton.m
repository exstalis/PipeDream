//
//  PDShareButton.m
//  PipeDream
//
//  Created by elif ece arslan on 4/24/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDShareButton.h"
#import <Security/Security.h>


@implementation PDShareButton

-(PDShareButton *)globalShareButton{
    PDShareButton *button=self.globalShareButton;
    return ([button isKindOfClass:[PDShareButton class]]? (PDShareButton*)button:nil) ;
    
    
}
#pragma mark - NSSecureCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (!self) {
        return nil;
    }
    
    self.globalShareButton= [decoder decodeObjectOfClass:[PDShareButton class] forKey:NSStringFromSelector(@selector(globalShareButton))];
    
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    
    [coder encodeObject:self.globalShareButton forKey:NSStringFromSelector(@selector(globalShareButton))];
}

+(BOOL)supportsSecureCoding{
    
    return YES;
    
}
- (id)copyWithZone:(NSZone *)zone {
    
    PDShareButton *button = [[[self class] allocWithZone:zone] init];
    
    return button;
}



@end
