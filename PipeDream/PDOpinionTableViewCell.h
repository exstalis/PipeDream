//
//  PDOpinionTableViewCell.h
//  PipeDream
//
//  Created by elif ece arslan on 4/19/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDFeedTableViewCell.h"

@interface PDOpinionTableViewCell : PDFeedTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *opinionTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *opinionExercptLabel;
@property (weak, nonatomic) IBOutlet UILabel *opinionAuthorLabel;
@property (weak, nonatomic) IBOutlet UILabel *opinionDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *opinionThumbnail;

@end
