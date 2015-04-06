//
//  PDDrawerViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/11/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <FBSDKShareKit/FBSDKShareKit.h>


typedef NS_ENUM (NSInteger, PDMenuViewControllerItem){
    PDMenuViewControllerItemRecent,
    PDMenuViewControllerItemNews,
    PDMenuViewControllerItemOpinion,
    PDMenuViewControllerItemRelease,
    PDMenuViewControllerItemSports,
    PDMenuViewControllerItemContact,
//    PDMenuViewControllerItemSettings,
    
    PDMenuViewControllerItem_COUNT,
    
};

@interface PDDrawerViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIView *drawerfooterView;


@property (strong, nonatomic) IBOutlet UIButton *facebookLikeButton;
@property (weak, nonatomic) IBOutlet UIButton *twitterFollowButton;
- (IBAction)followPDOnInstagram:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *instagramFollowButton;


- (IBAction)followPDOnTwitter:(id)sender;
- (IBAction)likePDOnFacebook:(id)sender;

@end
