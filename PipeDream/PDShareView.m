//
//  PDShareView.m
//  PipeDream
//
//  Created by elif ece arslan on 4/24/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDShareView.h"
#import <FBSDKShareKit.h>
#import <FBSDKShareLinkContent.h>
#import <FBSDKSharePhoto.h>

#import "PDShareUtility.h"

#import "PDNewsViewController.h"

@implementation PDShareView


-(void)awakeFromNib{
    
     _shouldDismissAfterDelay = NO;
}

-(PDShareButton *)shareButtoninitWith:(PDShareButton *)button{
    
    if (self.shareButton==nil) {
        self.shareButton=[[PDShareButton alloc]init];
    }
    
    _shareButton=button;
    return _shareButton;
    
    
}

-(void)sharingOptions{
    
    
    UIView *popUpView=[[UIView alloc]init];
    popUpView.translatesAutoresizingMaskIntoConstraints=NO;
    popUpView.backgroundColor=[UIColor grayColor];
//    burasini sonra duzel renkleri
    popUpView.layer.cornerRadius=5.0;
    UILabel *popUpTitleLabel=[[UILabel alloc]init];
    popUpTitleLabel.translatesAutoresizingMaskIntoConstraints=NO;
    popUpTitleLabel.backgroundColor=[UIColor clearColor];
    popUpTitleLabel.textColor=[UIColor whiteColor];
//    burdaki title labeli icin duzenlemeler yap..
    
    popUpTitleLabel.font=[UIFont fontWithName:@"Lato-Semibold" size:24.0];
    popUpTitleLabel.text=@"Share this article";
//    facebook button koyman gerekibilir
    
    UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
//    cancelButton.contentEdgeInsets =UIEdgeInsetsMake(10, 100, 10, 100);
    
    
    
    
    cancelButton.backgroundColor = [UIColor purpleColor];
//    renkleri duzelt
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelButton setTitleColor:[[cancelButton titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    cancelButton.titleLabel.font = [UIFont fontWithName:@"Lato-Semibold" size:20.0];
    [cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
    cancelButton.layer.cornerRadius = 6.0;
   
    
    
    [cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    iste bu islemler icin share buttonin attributelarini orda belirle
    
    UIButton* facebookShareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    facebookShareButton.translatesAutoresizingMaskIntoConstraints = NO;
    facebookShareButton.contentEdgeInsets =UIEdgeInsetsMake(10, 50, 10, 50);
    facebookShareButton.backgroundColor = [UIColor blueColor];
    [facebookShareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [facebookShareButton setTitleColor:[[facebookShareButton titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    facebookShareButton.titleLabel.font = [UIFont fontWithName:@"Lato-Semibold" size:20.0];
    [facebookShareButton setTitle:@"share on facebook" forState:UIControlStateNormal];
    facebookShareButton.layer.cornerRadius = 6.0;
    
    
    
//    facebook share targeti ekle
    
   
    
    [popUpView addSubview:popUpTitleLabel];
     [popUpView addSubview:facebookShareButton];
    [popUpView addSubview:cancelButton];
    NSDictionary* views = NSDictionaryOfVariableBindings(popUpView, cancelButton, popUpTitleLabel,facebookShareButton);
    
    [popUpView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(5)-[popUpTitleLabel]-(10)-[facebookShareButton]-(10)-[cancelButton]-(24)-|"
                                             options:NSLayoutFormatAlignAllCenterX
                                             metrics:nil
                                               views:views]];
    
    [popUpView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(5)-[popUpTitleLabel]-(5)-|"
                                             options:0
                                             metrics:nil
                                               views:views]];
    
    // Show in popup
    // Show in popup
    KLCPopupLayout layout =KLCPopupLayoutMake(KLCPopupHorizontalLayoutCenter , KLCPopupVerticalLayoutCenter);
    KLCPopup * popup=[KLCPopup popupWithContentView:popUpView showType:KLCPopupShowTypeSlideInFromRight dismissType:KLCPopupDismissTypeSlideOutToTop maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
    
    if (_shouldDismissAfterDelay) {
        [popup showWithLayout:layout duration:2.0];
    } else {
        [popup showWithLayout:layout];
    }


    
    
}

- (void)shareOnFaceBook:(id)sender{
    PDShareUtility * sharedFB=[[PDShareUtility alloc]init];
    
    
    FBSDKShareDialog *facebookShareDialog = [self getShareDialogWithContentURL:[self _currentPhoto].objectURL];

    
}

- (void)cancelButtonPressed:(id)sender {
    if ([sender isKindOfClass:[UIView class]]) {
        [(UIView*)sender dismissPresentingPopup];
    }
}

- (void)fieldCancelButtonPressed:(id)sender {
    
    if ([sender isKindOfClass:[UIViewController class]]) {
        [(UIViewController*)sender dismissViewControllerAnimated:YES completion:NULL];
 
    }
    
}

@end
