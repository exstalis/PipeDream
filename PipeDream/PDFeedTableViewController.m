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

#import "PDShareUtility.h"
#import "Article.h"

@interface PDFeedTableViewController ()<FBSDKSharingDelegate>


@end


@interface UIColor (PipeDream)
+ (UIColor*)kpdLightGreenColor;
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

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];




}

#pragma sharebutton

-(PDShareButton *)shareButtoninitWith:(PDShareButton *)button{
    
    if (self.shareButton==nil) {
        self.shareButton=[[PDShareButton alloc]init];
    }
    
    _shareButton=button;
    return _shareButton;
    
    
}

-(void)sharingOptionsButtonAction{
    
    
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
    
    //    UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelButton=[PDShareButton buttonWithType:UIButtonTypeCustom];
    
    
    
    _cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    _cancelButton.contentEdgeInsets =UIEdgeInsetsMake(10, 100, 10, 100);
    
    
    
    
    _cancelButton.backgroundColor = [UIColor purpleColor];
    //    renkleri duzelt
    [_cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_cancelButton setTitleColor:[[_cancelButton titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    _cancelButton.titleLabel.font = [UIFont fontWithName:@"Lato-Semibold" size:20.0];
    [_cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
    _cancelButton.layer.cornerRadius = 6.0;
    
    
    
    [_cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    //    iste bu islemler icin share buttonin attributelarini orda belirle
    
    _fbShareButton = [PDShareButton buttonWithType:UIButtonTypeCustom];
    _fbShareButton.translatesAutoresizingMaskIntoConstraints = NO;
    _fbShareButton.contentEdgeInsets =UIEdgeInsetsMake(10, 50, 10, 50);
    _fbShareButton.backgroundColor = [UIColor blueColor];
    [_fbShareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_fbShareButton setTitleColor:[[_fbShareButton titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    _fbShareButton.titleLabel.font = [UIFont fontWithName:@"Lato-Semibold" size:20.0];
    [_fbShareButton setTitle:@"Share on Facebook" forState:UIControlStateNormal];
    _fbShareButton.layer.cornerRadius = 6.0;
    
    [_fbShareButton addTarget:self action:@selector(shareOnFaceBook:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //    facebook share targeti ekle
    
    
    
    [popUpView addSubview:popUpTitleLabel];
    [popUpView addSubview:_fbShareButton];
    [popUpView addSubview:_cancelButton];
    NSDictionary* views = NSDictionaryOfVariableBindings(popUpView, _cancelButton, popUpTitleLabel,_fbShareButton);
    
    [popUpView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(5)-[popUpTitleLabel]-(10)-[_fbShareButton]-(10)-[_cancelButton]-(24)-|"
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


#pragma utility setter
//facebook share lazy instantiation



- (void)setShareUtility:(PDShareUtility *)shareUtility
{
    if (![_shareUtility isEqual:shareUtility]) {
        _shareUtility.delegate = nil;
        _shareUtility = shareUtility;
    }
}




#pragma share on facebook action


- (void)shareOnFaceBook:(id)sender{
    
    PDShareUtility *utility=[[PDShareUtility alloc]init];
//    lan salak singleton'a niye button yolluyon
    
    PDSingleton *fbsharedArticle=[[PDSingleton alloc]initWithArticle:[PDSingleton sharedClient].sharedArticle];
    
    FBSDKShareDialog *facebookShareDialog=[utility getShareDialogWithContentURL:fbsharedArticle.sharedArticle.articleURL];
    //    facebookShareDialog.delegate=self;
    
    self.shareUtility=utility;
    utility.delegate=self;
    
    
    [facebookShareDialog show];
    
    
    
    
}

- (void)cancelButtonPressed:(id)sender {
    if ([sender isKindOfClass:[UIView class]]) {
        [(UIView*)sender dismissPresentingPopup];
    }
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}


#pragma mark - Categories


@end



#pragma PopUp Colors

@implementation UIColor (PipeDream)

+ (UIColor*)kpdLightGreenColor {
    return [UIColor colorWithRed:(184.0/255.0) green:(233.0/255.0) blue:(122.0/255.0) alpha:1.0];
}

+ (UIColor*)kpdGreenColor {
    return [UIColor colorWithRed:(0.0/255.0) green:(204.0/255.0) blue:(134.0/255.0) alpha:1.0];
}

@end









