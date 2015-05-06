//
//  PDSportsViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/12/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDFeedTableViewController.h"

@interface PDSportsViewController : PDFeedTableViewController

@property(nonatomic,strong)Article *sportsArticles;
@property(nonatomic, strong) NSMutableArray *sportsArticlesArray;

@end
