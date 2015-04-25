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

- (instancetype)initWithArticleTitle:(NSString *)articleTitle place:(NSString *)place friends:(NSArray *)friends photo:(UIImage *)articleImage;

- (void)start;
- (FBSDKShareOpenGraphContent *)contentForSharing;


@end



@protocol PDShareUtilityDelegate





- (void)shareUtilityWillShare:(PDShareUtility *)shareUtility;
- (void)shareUtilityDidCompleteShare:(PDShareUtility *)shareUtility;
- (void)shareUtilityUserShouldLogin:(PDShareUtility *)shareUtility;
- (void)shareUtility:(PDShareUtility *)shareUtility endWithError:(NSError *)error;



@end
