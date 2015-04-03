//
//  PDFeedTableViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/26/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AFNetworking.h>
#import <UIKit+AFNetworking.h>
#import <QuartzCore/QuartzCore.h>
#import "PDShareButton.h"
#import "KLCPopup.h"
#import "PDShareUtility.h"
#import <FBSDKShareKit/FBSDKShareKit.h>
#import "Article.h"
#import "Attachments.h"
#import "PDSingleton.h"
#import "PDNetworkClient.h"
#import <objc/runtime.h>
#import "RequestOperationConfig.h"

@interface PDFeedTableViewController : UITableViewController<UIPopoverControllerDelegate,PDShareUtilityDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UIPopoverController* popover;

@property(nonatomic,assign,getter=isPopupViewShowed) BOOL popupViewShowed;
@property (nonatomic)PDShareButton * shareButton;
@property (nonatomic, strong) PDShareUtility *shareUtility;
@property(nonatomic,assign) BOOL shouldDismissAfterDelay;
@property (weak, nonatomic) PDShareButton *fbShareButton;
@property (weak, nonatomic) PDShareButton *twitterShareButton;

@property ( nonatomic,assign)  PDShareButton *mailButton;
@property (weak, nonatomic) PDShareButton *cancelButton;
@property(nonatomic)Attachments *feedAttachments;
@property(nonatomic,strong)Article *feedArticle;

@property(copy, nonatomic) NSURL *selectedURL;
@property(nonatomic,strong)NSMutableArray *thumbnailArray;
-(PDShareButton *)shareButtoninitWith:(PDShareButton *)button;
-(void)sendwithMail:(id)sender;
-(void)facebookShare;
-(void)sharePopupView;


-(void)sharingOptionsButtonAction;
- (void)sendArticleViaMail:(NSString *)articleURL;




@end
