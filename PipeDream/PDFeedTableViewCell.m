//
//  PDFeedTableViewCell.m
//  PipeDream
//
//  Created by elif ece arslan on 4/8/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDFeedTableViewCell.h"

@implementation PDFeedTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        [self setBackgroundView:nil];
        [self setSelectedBackgroundView:nil];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.textLabel setTextColor:[UIColor blackColor]];
        
        [self.textLabel setFont:[UIFont fontWithName:@"Open Sans" size:14.0]];
//        [self.headline setFont:[UIFont fontWithName:@"Open-Sans" size:14.0]];;
//        self.headline.textColor=[UIColor greenColor];
//        
        
    }
    return self;
    
}


@end
