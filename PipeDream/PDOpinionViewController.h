//
//  PDOpinionViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/11/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDNavigationController.h"
#import "PDDrawerMenuCell.h"
#import "PDSingleton.h"

#import "PDFeedTableViewController.h"

@class Attachments;

@interface PDOpinionViewController :PDFeedTableViewController

@property(nonatomic, strong) NSMutableArray *opinionArticlesArray;

@property(nonatomic, strong) NSMutableArray *opinionArticlesImagesArray;


@end
