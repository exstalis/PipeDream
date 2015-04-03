//
//  PDFeedTableViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/26/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDFeedTableViewController.h"
#import "KLCPopup.h"
#import "PDFeedTableViewCell.h"
#import "PDNavigationController.h"
#import "PDShareButton.h"
#import <FBSDKShareKit.h>
#import "PDSingleton.h"
#import <FBSDKShareLinkContent.h>
#import <MessageUI/MessageUI.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "PDShareUtility.h"
#import "Article.h"


typedef NS_ENUM(NSInteger,PopupLabel) {
   
    PopupLabelSucces=1,
    PopupLabelFail=2,
    PopupLabelItem_COUNT,
    
    
    
};

@class NSCoder;

@interface PDFeedTableViewController ()<FBSDKSharingDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate,NSSecureCoding>



@end


@interface UIColor (PipeDream)
+ (UIColor*)kpdBackgroundColor;
+ (UIColor*)kpdGreenColor;
@end

@implementation PDFeedTableViewController{
    
    FBSDKShareDialog *_facebookSharedDialog;
    

    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    _shouldDismissAfterDelay = NO;
    self.thumbnailArray=[[NSMutableArray alloc]init];
    
    
    
   
    


}


-(void)setMailButton:(PDShareButton *)mailButton{
    
    
    if (![_mailButton isEqual:mailButton]) {
        _mailButton =mailButton;
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}








-(void)notifyUserShareDidCompletePopUp:(NSString*)notification{
    
    UIView *sharedPopUpView=[[UIView alloc]init];
    sharedPopUpView.translatesAutoresizingMaskIntoConstraints=NO;
    sharedPopUpView.backgroundColor=[UIColor kpdBackgroundColor];
    //    burasini sonra duzel renkleri
    sharedPopUpView.layer.cornerRadius=12.0;
    UILabel *popUpSharedLabel=[[UILabel alloc]init];
    
    [popUpSharedLabel setText:notification];
    
    popUpSharedLabel.translatesAutoresizingMaskIntoConstraints=NO;
    popUpSharedLabel.backgroundColor=[UIColor clearColor];
    
    popUpSharedLabel.textColor=[UIColor kpdGreenColor];
    
    popUpSharedLabel.font=[UIFont fontWithName:@"OpenSans-Semibold" size:50.0];
    
    [sharedPopUpView addSubview:popUpSharedLabel];
    
    
    NSDictionary* views = NSDictionaryOfVariableBindings(sharedPopUpView,popUpSharedLabel);
    
    [sharedPopUpView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(15)-[popUpSharedLabel]-(15)-|"
                                             options:NSLayoutFormatAlignAllCenterX
                                             metrics:nil
                                               views:views]];
    
    [sharedPopUpView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(15)-[popUpSharedLabel]-(15)-|"
                                             options:0
                                             metrics:nil
                                               views:views]];
    KLCPopupLayout layout =KLCPopupLayoutMake(KLCPopupHorizontalLayoutCenter , KLCPopupVerticalLayoutCenter);
    KLCPopup * popupSuccess=[KLCPopup popupWithContentView:sharedPopUpView showType:KLCPopupShowTypeSlideInFromTop dismissType:KLCPopupDismissTypeSlideOutToBottom maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:YES];
    
    if (_shouldDismissAfterDelay) {
        [popupSuccess showWithLayout:layout duration:0.5];
    } else {
        [popupSuccess showWithLayout:layout];
    }
    
    
}




#pragma mark- share popup view



-(void)sharePopupView{
    
    
    [PDShareButton supportsSecureCoding];
    
    UIView *popUpView=[[UIView alloc]init];
    popUpView.translatesAutoresizingMaskIntoConstraints=NO;
    popUpView.backgroundColor=[UIColor clearColor];

    UIImageView *popupImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"share_popup_view_background"]];
 
    
  
    
    [popupImageView
     
     setContentMode:UIViewContentModeScaleAspectFill];
    [popupImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
//    popupImageView.contentMode = UIViewContentModeRedraw;
    

    _cancelButton=[PDShareButton buttonWithType:UIButtonTypeCustom];
    [_cancelButton setTag:PDShareButtonItemDismiss];
    _cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    _cancelButton.contentEdgeInsets =UIEdgeInsetsMake(10, 50, 10, 50);
    _cancelButton.backgroundColor = [UIColor clearColor];
    [_cancelButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _twitterShareButton = [PDShareButton buttonWithType:UIButtonTypeCustom];
    [_twitterShareButton setTag:PDShareButtonItemTwitter];
    
    _twitterShareButton.translatesAutoresizingMaskIntoConstraints = NO;
    _twitterShareButton.contentEdgeInsets =UIEdgeInsetsMake(10, 20, 10, 20);
    _twitterShareButton.backgroundColor = [UIColor clearColor];
    
    
    
    _fbShareButton = [PDShareButton buttonWithType:UIButtonTypeCustom];
    [_fbShareButton setTag:PDShareButtonItemFacebook];
    _fbShareButton.translatesAutoresizingMaskIntoConstraints = NO;
    _fbShareButton.contentEdgeInsets =UIEdgeInsetsMake(10, 25, 10, 20);
    _fbShareButton.backgroundColor = [UIColor clearColor];
    [_fbShareButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [_fbShareButton setTitleColor:[[_fbShareButton titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    [self.fbShareButton addTarget:self action:@selector(facebookShare) forControlEvents:UIControlEventTouchUpInside];

    
    
    _mailButton = [PDShareButton buttonWithType:UIButtonTypeCustom];
    [_mailButton setTag:PDShareButtonItemMail];
    _mailButton.translatesAutoresizingMaskIntoConstraints = NO;
    _mailButton.contentEdgeInsets =UIEdgeInsetsMake(10, 30, 10, 30);
    _mailButton.backgroundColor = [UIColor clearColor];
    [_mailButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [_mailButton setTitleColor:[[_mailButton titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    
    [_mailButton addTarget:self action:@selector(sendwithMail:) forControlEvents:UIControlEventTouchUpInside];
    
    //    facebook share targeti ekle
    
    
    
    
    
    
    

    [popUpView insertSubview:_mailButton aboveSubview:popupImageView];
    [popUpView insertSubview:_fbShareButton aboveSubview:popupImageView];
    [popUpView insertSubview:_cancelButton aboveSubview:popupImageView];
    [popUpView insertSubview:_twitterShareButton aboveSubview:popupImageView];
    [popUpView addSubview:popupImageView];
    
    
    NSDictionary* views = NSDictionaryOfVariableBindings(popUpView,_mailButton, _cancelButton,_fbShareButton
                                ,_twitterShareButton);

    [popUpView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_twitterShareButton]-(5)-[_fbShareButton]-(5)-[_mailButton]-(5)-[_cancelButton]-|"
                                             options:NSLayoutFormatAlignAllCenterX
                                             metrics:nil
                                               views:views]];
    
    [popUpView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(5)-[_twitterShareButton]-(5)-|"
                                             options:NSLayoutFormatAlignAllCenterY
                                             metrics:nil
                                               views:views]];
   
    
 
    
    [popUpView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[popupImageView]|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:@{@"popupImageView":popupImageView}]];
    [popUpView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[popupImageView]|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:@{@"popupImageView":popupImageView}]];
    [popUpView layoutSubviews];
    
    // Show in popup
    // Show in popup
    KLCPopupLayout layout =KLCPopupLayoutMake(KLCPopupHorizontalLayoutCenter , KLCPopupVerticalLayoutCenter);
    _sharepopup=[KLCPopup popupWithContentView:popUpView showType:KLCPopupShowTypeSlideInFromRight dismissType:KLCPopupDismissTypeSlideOutToTop maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
    
    if (_shouldDismissAfterDelay) {
        [_sharepopup showWithLayout:layout duration:2.0];
    } else {
        [_sharepopup showWithLayout:layout];
    }
}






#pragma utility setter
//facebook share lazy setting

- (void)setShareUtility:(PDShareUtility *)shareUtility
{
    if (![_shareUtility isEqual:shareUtility]) {
        _shareUtility.delegate = nil;
        _shareUtility = shareUtility;
    }
}




#pragma  mark - share on facebook action

- (void)shareOnFaceBook:(id)sender{
    [self facebookShare];
}

-(void)facebookShare{
    
    PDShareUtility *utility=[[PDShareUtility alloc]initWithArticleURL:self.feedArticle.articleURL];
    self.shareUtility=utility;
    utility.delegate=self;
    if ([utility.shareDialog canShow]) {
        [_sharepopup dismissPresentingPopup];
        [utility startSharing];

    }
   
}


#pragma mark - mail


-(void)sendwithMail:(id)sender{
//    
    if ([sender isKindOfClass:[PDShareButton class]]) {
        [(PDShareButton*)sender dismissPresentingPopup];
    }
    [self sendArticleViaMail:[self.feedArticle.articleURL absoluteString]];
//    NSLog(@"@mothh came!!!%@: ",[self.feedArticle.articleURL absoluteString]);

    
}

#pragma cancellation

- (void)cancelButtonPressed:(id)sender {
    if ([sender isKindOfClass:[UIView class]]) {
        [(UIView*)sender dismissPresentingPopup];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}



#pragma mark - mailcomposer delegate



- (void)sendArticleViaMail:(NSString *)articleURL{
    
    MFMailComposeViewController *viewController = [[MFMailComposeViewController alloc] init];
    viewController.mailComposeDelegate = self;
    [viewController setSubject:self.feedArticle.titlePlain];
    [viewController setMessageBody: articleURL isHTML:YES];
    [self presentViewController:viewController animated:YES completion:NULL];
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    NSString *notifyuser=[[NSString alloc]init];
    
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            notifyuser=@"Mail sending canceled";
            [self notifyUserShareDidCompletePopUp:notifyuser];
            break;
        case MFMailComposeResultSaved:
            notifyuser= @"Mail saved";
            [self notifyUserShareDidCompletePopUp:notifyuser];

            break;
        case MFMailComposeResultSent:
            notifyuser= @"Mail sent";
            [self notifyUserShareDidCompletePopUp:notifyuser];

            break;
        case MFMailComposeResultFailed:
            notifyuser= @"Mail sending failed";
            [self notifyUserShareDidCompletePopUp:notifyuser];

            break;
        default:
            notifyuser = @"Mail not sent";
            [self notifyUserShareDidCompletePopUp:notifyuser];
            break;
    }
    
    [controller dismissViewControllerAnimated:YES completion:NULL];
    
    
}




#pragma mark - PDShare Delegate

-(void)shareUtilityDidCompleteShareOnFacebook{
    
    NSString *succesfullShare=@"Shared on Facebook";

    [self notifyUserShareDidCompletePopUp:succesfullShare];

}





-(void)shareUtilityEndWithError{
    
    [self notifyUserShareDidCompletePopUp:@"Facebook sharing canceled"];
    
   
}

-(void)shareUtilityDidFailShareOnFacebook:(NSError *)error{
    
    [self notifyUserShareDidCompletePopUp:@"Unexpected error when sharing"];
    NSLog(@"Unexpected error when sharing : %@", error);


}

@end



#pragma PopUp Colors

@implementation UIColor (PipeDream)

+ (UIColor*)kpdBackgroundColor {
    return [UIColor colorWithRed:(227/255.0) green:(226/255.0) blue:(227/255.0) alpha:0.8];
}

+ (UIColor*)kpdGreenColor {
    return [UIColor colorWithRed:(67.0/255.0) green:(83.0/255.0) blue:(51.0/255.0) alpha:1.0];
}






@end









