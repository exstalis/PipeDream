//
//  PDSportsDetailViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/12/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "PDContentViewController.h"

@class Article;

@interface PDSportsDetailViewController : PDContentViewController<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *sportsTitle;
@property (weak, nonatomic) IBOutlet UIImageView *sportsImage;
@property (weak, nonatomic) IBOutlet UILabel *sportsAuthor;
@property (weak, nonatomic) IBOutlet UILabel *sportsDate;
@property (weak, nonatomic) IBOutlet UITextView *sportsBody;

@end
