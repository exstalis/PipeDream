//
//  PDReleaseTableViewCell.m
//  PipeDream
//
//  Created by elif ece arslan on 4/22/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#define METADATA_IMAGE_COLOR [UIColor colorWithRed:0.87 green:0.87 blue:0.87 alpha:1.0]
#import "PDReleaseTableViewCell.h"

@implementation PDReleaseTableViewCell



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
        _releaseTitle.translatesAutoresizingMaskIntoConstraints=NO;
        _releaseTitle.font=[UIFont fontWithName:@"Lato-Regular" size:14.0];
        _releaseTitle.numberOfLines=1;
        _releaseTitle.backgroundColor=[UIColor whiteColor];
        
        
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
