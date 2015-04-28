//
//  PDRecentTableViewCell.h
//  PipeDream
//
//  Created by elif ece arslan on 4/26/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDFeedTableViewCell.h"

@interface PDRecentTableViewCell : PDFeedTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@end
