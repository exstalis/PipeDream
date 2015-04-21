//
//  PDReleaseTableViewCell.h
//  PipeDream
//
//  Created by elif ece arslan on 4/22/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDFeedTableViewCell.h"
#import "PDShareButton.h"


@interface PDReleaseTableViewCell : PDFeedTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *releaseTitle;
@property (weak, nonatomic) IBOutlet UILabel *releaseExcerpt;

@property (weak, nonatomic) IBOutlet UILabel *releaseDate;
@property (weak, nonatomic) IBOutlet UILabel *releaseAuthor;
@property (weak, nonatomic) IBOutlet UIImageView *releaseThumbnail;
@property (weak, nonatomic) IBOutlet UIButton *releaseShareButton;

@end
