//
//  PDOpinionTableViewCell.h
//  PipeDream
//
//  Created by elif ece arslan on 4/22/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDFeedTableViewCell.h"

@interface PDOpinionTableViewCell : PDFeedTableViewCell


@property (weak, nonatomic) IBOutlet UILabel *opinionTitle;

@property (weak, nonatomic) IBOutlet UITextView *opinionExcerptTextview;

@property (weak, nonatomic) IBOutlet UILabel *opinionAuthor;
@property (weak, nonatomic) IBOutlet UILabel *opinionDate;

@property (weak, nonatomic) IBOutlet UIImageView *opinionThumnail;
@end
