//
//  PDShareUtility.h
//  PipeDream
//
//  Created by elif ece arslan on 4/25/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <FBSDKShareKit/FBSDKShareKit.h>


@protocol PDShareUtilityDelegate;




@interface PDShareUtility : NSObject<FBSDKSharingDelegate>
@property (nonatomic, weak) UIViewController<PDShareUtilityDelegate> *delegate;
@property(nonatomic) FBSDKShareDialog *shareDialog;
@property(copy, nonatomic, readonly) NSURL *url;


//@property(nonatomic,weak)PDShareUtility *shareUtility;

-(instancetype)initWithArticleURL:(NSURL*)articleURL;

- (FBSDKShareLinkContent *)getShareLinkContentWithContentURL:(NSURL *)objectURL;

- (FBSDKShareDialog *)getShareDialogWithContentURL:(NSURL *)objectURL;

-(void) startSharing;

@end



@protocol PDShareUtilityDelegate



- (void)shareUtilityDidCompleteShareOnFacebook;
//- (void)shareUtilityUserShouldLogin:(PDShareUtility *)shareUtility;
- (void)shareUtilityEndWithError;
- (void)shareUtilityDidFailShareOnFacebook:(NSError*)error;



@end
