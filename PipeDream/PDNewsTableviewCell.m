//
//  PDNewsTableviewCell.m
//  PipeDream
//
//  Created by elif ece arslan on 4/15/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDNewsTableviewCell.h"

@implementation PDNewsTableviewCell



-(void)awakeFromNib{
    
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    [self highlightCell:highlighted];
}
//
//- (void)highlightCell:(BOOL)highlight {
//    UIColor *tintColor = [UIColor colorWithRed:<#(CGFloat)#> green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>];
//    if(highlight) {
//        tintColor = [UIColor colorWithWhite:1.0 alpha:0.6];
//    }
//    self.menuItemLabel.textColor = tintColor;
//    self.menuCellIcon.tintColor = tintColor;
//    
//    
//}

@end
