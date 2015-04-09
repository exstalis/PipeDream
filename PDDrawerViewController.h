//
//  PDDrawerViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/7/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDBaseViewController.h"

@protocol PDDrawerViewContollerDelegate;







//
//typedef NS_ENUM(NSInteger, STDrawerMenuViewControllerItem){
//    PDDrawerMenuViewControllerItemNews,
//    PDDrawerMenuViewControllerItemOpinion,
//    PDDrawerMenuViewControllerItemRelease,
//    PDDrawerMenuViewControllerItemSports,
//    PDDrawerMenuViewControllerItemContact,
//    PDDrawerMenuViewControllerItemSettings,
//    PDDrawerMenuViewControllerItem_COUNT,
//    
//};
//




@interface PDDrawerViewController : PDBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic)id <PDDrawerViewContollerDelegate> delegate;


@end



@protocol PDDrawerViewContollerDelegate <NSObject>


//-(void)drawerMenu:(PDDrawerViewController *)controller didSelectMenuItem:(STDrawerMenuViewControllerItem)item;

-(void)setupMenuView;
-(void)showMenu:(BOOL)menu;
-(void) menuAction:(id)sender;

@end
