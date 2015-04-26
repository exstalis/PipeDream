//
//  PDNewsViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/8/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//


#import "PDNavigationController.h"
#import "PDDrawerMenuCell.h"
#import "PDShareUtility.h"
#import "PDFeedTableViewController.h"
@class Article;


@interface PDNewsViewController: PDFeedTableViewController


@property(nonatomic,strong)PDShareUtility *newsShareUtility;

@property(nonatomic,strong)Article* newsFeedArticle;

@end


