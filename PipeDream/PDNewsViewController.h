//
//  PDNewsViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/8/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//


#import "PDNavigationController.h"
#import "PDDrawerMenuCell.h"
#import "PDFeedTableViewController.h"


@interface PDNewsViewController: PDFeedTableViewController


@property (nonatomic,strong) NSMutableArray *newsArticleArray;
@property (nonatomic,strong) NSMutableArray *newsArticleImageArray;


@end


