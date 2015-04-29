//
//  PDNewsTableviewCell.m
//  PipeDream
//
//  Created by elif ece arslan on 4/15/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//



#define METADATA_IMAGE_COLOR [UIColor colorWithRed:0.87 green:0.87 blue:0.87 alpha:1.0]
#import "PDNewsTableviewCell.h"

@implementation PDNewsTableviewCell



-(void)awakeFromNib{
    
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}






-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor=[UIColor whiteColor];
        self.contentView.contentMode=UIViewContentModeRedraw;
        _newsTitle.translatesAutoresizingMaskIntoConstraints=NO;
        _newsTitle.font=[UIFont fontWithName:@"Lato-Regular" size:14.0];
        _newsTitle.numberOfLines=1;
        _newsTitle.backgroundColor=[UIColor whiteColor];
        
        
    }
    return self;
    
}



- (UIImageView *)imageViewWithImageName:(NSString *)imageName
{
    UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.tintColor = METADATA_IMAGE_COLOR;
    
    return imageView;
}


@end
