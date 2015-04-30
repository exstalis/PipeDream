//
//  PDOpinionDetailViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/11/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "PDContentViewController.h"

@class Article;
@class Attachments;




@interface PDOpinionDetailViewController : PDContentViewController<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@property (nonatomic,strong) NSMutableArray *opinionDetailArticleArray;
@property(nonatomic,strong)NSMutableArray *opinionDetailAttachments;
@property(nonatomic,strong,readwrite)Article *contentArticle;

@property(nonatomic,strong)Attachments *contentAttachment;


@property (weak, nonatomic) IBOutlet UIScrollView *opinionScrollView;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *articleBody;
@property (weak, nonatomic) IBOutlet UIImageView *articleImage;

@end
