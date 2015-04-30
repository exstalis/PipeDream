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

@property(nonatomic,strong,readwrite)Article *contentArticle;

@property(nonatomic,strong)Attachments *contentAttachment;

@end
