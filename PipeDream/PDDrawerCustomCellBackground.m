//
//  PDDrawerCustomCellBackground.m
//  PipeDream
//
//  Created by elif ece arslan on 4/9/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDDrawerCustomCellBackground.h"

@implementation PDDrawerCustomCellBackground



-(void)drawRect:(CGRect)rect{
    CGContextRef aRef=UIGraphicsGetCurrentContext();
    CGContextSaveGState(aRef);
    UIBezierPath *bezierPath=[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:5.0f];
    [bezierPath setLineWidth:4.0f];
    [[UIColor blackColor] setStroke];
    UIColor *fillColor=[UIColor colorWithRed:102/255.0 green:205/255.0 blue:170/255.0 alpha:1.0];
    [fillColor setFill];
    [bezierPath stroke];
    [bezierPath fill];
    CGContextRestoreGState(aRef);
    
}


@end
