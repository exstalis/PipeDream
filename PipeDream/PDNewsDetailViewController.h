//
//  PDNewsDetailViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/11/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

#import "PDContentViewController.h"


@class Article;

@interface PDNewsDetailViewController :PDContentViewController<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>


@property (strong, nonatomic) IBOutlet UIScrollView *newsScrollView;
@property (weak, nonatomic) IBOutlet UITextView *newsDetailTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsDetailAuthor;
@property (weak, nonatomic) IBOutlet UITextView *newsDetailsArticle;
@property (weak, nonatomic) IBOutlet UILabel *newsDetailDate;
@property (weak, nonatomic) IBOutlet UIImageView *newsDetailImage;


@end
