//
//  PDDrawerViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/11/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM (NSInteger, PDMenuViewControllerItem){
    PDMenuViewControllerItemRecent,
    PDMenuViewControllerItemNews,
    PDMenuViewControllerItemOpinion,
    PDMenuViewControllerItemRelease,
    PDMenuViewControllerItemSports,
    PDMenuViewControllerItemContact,
//    PDMenuViewControllerItemSettings,
    
    PDMenuViewControllerItem_COUNT,
    
};

@interface PDDrawerViewController : UITableViewController

@end
