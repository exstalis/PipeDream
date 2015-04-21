//
//  PDContentViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/27/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import <MessageUI/MessageUI.h>
#import "PDDrawerViewController.h"
#import "PDSingleton.h"
#import "PDArticleContentView.h"
#import "PDNetworkClient.h"
#import "PDShareUtility.h"
#import "PDShareButton.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import "RequestOperationConfig.h"
#import "Blocks.h"
#import "Article.h"
#import "ArticleCategory.h"
#import "PDNetworkClient.h"
#import "PDArticleContentView.h"
#import "Attachments.h"
#import <UIKit+AFNetworking.h>
#import "NSString+HTMLDecoder.h"

@interface PDContentViewController : UIViewController

@property(nonatomic,strong,readwrite)Article *contentArticle;

@property(nonatomic,strong,readwrite)Attachments *contentAttachment;

@property(strong,nonatomic)UITextView *articleBodyTextView;
- (void)textViewDidChange:(UITextView *)textView;
- (void)scrollViewDidChange:(UIScrollView *)scrollView;


@end
