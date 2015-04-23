//
//  PDSportsTableViewCell.h
//  PipeDream
//
//  Created by elif ece arslan on 4/22/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDFeedTableViewCell.h"

@interface PDSportsTableViewCell : PDFeedTableViewCell


@property (weak, nonatomic) IBOutlet UILabel *sportsTitle;

@property (weak, nonatomic) IBOutlet UILabel *sportsExcerpt;
@property (weak, nonatomic) IBOutlet UILabel *sportsAuthor;

@property (weak, nonatomic) IBOutlet UILabel *sportsDate;
@property (weak, nonatomic) IBOutlet UIImageView *sportsThumbnail;

@end
