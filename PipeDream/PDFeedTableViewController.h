//
//  PDFeedTableViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/26/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "PDShareButton.h"
#import "KLCPopup.h"
#import "PDShareUtility.h"
#import <FBSDKShareKit/FBSDKShareKit.h>


@interface PDFeedTableViewController : UITableViewController<UIPopoverControllerDelegate,PDShareUtilityDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UIPopoverController* popover;

@property(nonatomic,assign,getter=isPopupViewShowed) BOOL popupViewShowed;
@property (nonatomic)PDShareButton * shareButton;
@property (nonatomic, strong) PDShareUtility *shareUtility;
@property(nonatomic,assign) BOOL shouldDismissAfterDelay;
@property (weak, nonatomic) PDShareButton *fbShareButton;
@property (weak, nonatomic) PDShareButton *cancelButton;

-(PDShareButton *)shareButtoninitWith:(PDShareButton *)button;

-(void)sharingOptionsButtonAction;

@end
