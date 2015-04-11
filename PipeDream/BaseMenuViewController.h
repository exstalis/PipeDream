//
//  BaseMenuViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/11/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDBaseViewController.h"
#import "PDNavigationController.h"
#import "PDDrawerMenuCell.h"
#import "PDDrawerCustomCellBackground.h"


typedef NS_ENUM (NSInteger, PDMenuViewControllerItem){
    PDMenuViewControllerItemNews,
    PDMenuViewControllerItemOpinion,
    PDMenuViewControllerItemRelease,
    PDMenuViewControllerItemSports,
    PDMenuViewControllerItemContact,
    PDMenuViewControllerItemSettings,
    
    PDMenuViewControllerItem_COUNT,
    
};



@interface BaseMenuViewController : PDBaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *menuTableView;

-(void) menuAction:(id)sender;

@end
