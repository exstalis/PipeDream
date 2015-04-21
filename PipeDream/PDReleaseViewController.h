//
//  PDReleaseViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/12/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDNavigationController.h"
#import "PDFeedTableViewController.h"


@interface PDReleaseViewController : PDFeedTableViewController
@property (nonatomic,strong) NSMutableArray *releaseArticleImageArray;
@property (nonatomic,strong) NSMutableArray *releaseArticleArray;


@end
