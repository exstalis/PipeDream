//
//  PDDrawerMenuCell.m
//  PipeDream
//
//  Created by elif ece arslan on 4/10/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDDrawerMenuCell.h"


@interface PDDrawerMenuCell ()


@property (weak, nonatomic) IBOutlet UIImageView *menuCellIcon;

@property (weak, nonatomic) IBOutlet UILabel *menuItemLabel;

@end

@implementation PDDrawerMenuCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


 }


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    [self highlightCell:highlighted];
}

- (void)highlightCell:(BOOL)highlight {
    UIColor *tintColor = [UIColor whiteColor];
    if(highlight) {
        tintColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    }
    [self.menuItemLabel setFont:[UIFont fontWithName:@"Open-Sans" size:12.0]];
    self.menuItemLabel.textColor = tintColor;
    self.menuCellIcon.tintColor = tintColor;
    
    
}

#pragma mark - Accessors

#pragma Title

- (NSString *)sectionTitle {
    return self.menuItemLabel.text;
   

    
}


-(void)setSectionTitle:(NSString *)sectionTitle{
    self.menuItemLabel.text=sectionTitle;
}



#pragma Icon

- (UIImage *)iconImage {
    return self.menuCellIcon.image;
}

-(void)setMenuCellIcon:(UIImageView *)menuCellIcon{
    [self.menuCellIcon.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
}

@end
