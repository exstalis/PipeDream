//
//  PDRecentViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/22/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDFeedTableViewController.h"



@interface PDRecentViewController : PDFeedTableViewController <UISearchBarDelegate, UISearchDisplayDelegate>
@property (nonatomic,strong) NSMutableArray *recentArticleArray;
@property (nonatomic,strong) NSMutableArray *recentArticleImageArray;



@end
