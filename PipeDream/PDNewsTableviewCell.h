//
//  PDNewsTableviewCell.h
//  PipeDream
//
//  Created by elif ece arslan on 4/15/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDFeedTableViewCell.h"
#import "PDShareButton.h"

@interface PDNewsTableviewCell : PDFeedTableViewCell


@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsAuthorLabel;
@property (weak, nonatomic) IBOutlet UITextView *newsExcerptTextView;
@property (weak, nonatomic) IBOutlet UILabel *newsDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *newsThumbnailImage;
@property (weak, nonatomic) IBOutlet PDShareButton *newsShareButton;


@end
