//
//  PDReleaseDetailViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/12/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDContentViewController.h"
@class Article;
@class Attachments;

@interface PDReleaseDetailViewController : PDContentViewController


@property (nonatomic,strong) NSMutableArray *releaseDetailArticleArray;
@property(nonatomic,strong)NSMutableArray *releaseDetailAttachments;
@property (weak, nonatomic) IBOutlet UILabel *releaseAuthor;
@property (weak, nonatomic) IBOutlet UILabel *releaseTitle;

@property (weak, nonatomic) IBOutlet UITextView *releaseArticle;

@property (weak, nonatomic) IBOutlet UIImageView *releaseImage;
@property (weak, nonatomic) IBOutlet UIScrollView *releaseScrollView;





@end
