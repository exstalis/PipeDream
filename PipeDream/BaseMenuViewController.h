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
//@protocol BaseMenuViewControllerDelegate;




@interface BaseMenuViewController : PDBaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *menuTableView;
@property(nonatomic)BOOL isTapped;

//@property(nonatomic)id <BaseMenuViewControllerDelegate>delegate;

-(void)showMenuBar:(UIBarButtonItem*)menuButton;
-(void) menuAction:(id)sender;


@end
//@protocol BaseMenuViewControllerDelegate <NSObject>
//@property(nonatomic) BOOL isTapped ;
//
//@end