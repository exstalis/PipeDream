//
//  PDDrawerMenuCell.m
//  PipeDream
//
//  Created by elif ece arslan on 4/10/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDDrawerMenuCell.h"

@implementation PDDrawerMenuCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

 }


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setBackgroundView:nil];
        [self setSelectedBackgroundView:nil];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.textLabel setTextColor:[UIColor blackColor]];
        [self.textLabel setFont:[UIFont fontWithName:@"OpenSans-Regular" size:17.0]];
        
        
    }
    return self;
    
}


@end
