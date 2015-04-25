//
//  PDShareView.h
//  PipeDream
//
//  Created by elif ece arslan on 4/24/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDShareButton.h"
#import <RNBlurModalView.h>

@interface PDShareView : RNBlurModalView


@property(nonatomic,assign,getter=isPopupViewShowed) BOOL popupViewShowed;
@property (nonatomic)PDShareButton * shareButton;

-(PDShareButton *)shareButtoninitWith:(PDShareButton *)button;

-(void)sharingOptions;

@end
