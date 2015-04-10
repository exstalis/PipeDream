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
    UIBezierPath *bezierPath=[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:3.0f];
    [bezierPath setLineWidth:5.0f];
    [[UIColor whiteColor] setStroke];
    UIColor *fillColor=[UIColor colorWithRed:80/255.0 green:200/255.0 blue:150/255.0 alpha:0.6];
    [fillColor setFill];
    [bezierPath stroke];
    [bezierPath fill];
    CGContextRestoreGState(aRef);
    
}


@end
