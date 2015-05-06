//
//  PDRecentDetailViewController.h
//  PipeDream
//
//  Created by Kenan Uzel on 5/5/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "PDContentViewController.h"

@interface PDRecentDetailViewController : PDContentViewController<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *recentScrollView;
@property (weak, nonatomic) IBOutlet UITextView *recentDetailTitle;
@property (weak, nonatomic) IBOutlet UIImageView *recentDetailImage;
@property (weak, nonatomic) IBOutlet UILabel *recentDetailAuthor;
@property (weak, nonatomic) IBOutlet UILabel *recentDetailDate;
@property (weak, nonatomic) IBOutlet UITextView *recentDetailBody;

@end
