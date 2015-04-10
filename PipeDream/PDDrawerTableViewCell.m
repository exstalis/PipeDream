//
//  PDDrawerTableViewCell.m
//  PipeDream
//
//  Created by elif ece arslan on 4/9/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDDrawerTableViewCell.h"

@implementation PDDrawerTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self !=nil){
//        [self setBackgroundView:nil];
//        [self setSelectedBackgroundView:nil];
        [self setSelectionStyle:UITableViewCellSelectionStyleDefault];
        [self.textLabel setTextColor:[UIColor whiteColor]];
        [self.textLabel setFont:[UIFont fontWithName:@"Open-Sans" size:17.0]];

        
    }
    return self;
    
}



@end
