//
//  PDArticleContentView.h
//  PipeDream
//
//  Created by elif ece arslan on 4/26/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDShareButton.h"


@interface PDArticleContentView : UIView<UIGestureRecognizerDelegate>





@property (nonatomic) CGSize contentSize;
@property (nonatomic) BOOL scrollVertical;
@property (nonatomic) BOOL scrollHorizontal;

@property CGRect startBounds;


@end
