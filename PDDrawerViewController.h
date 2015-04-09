//
//  PDDrawerViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/7/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDBaseViewController.h"

@protocol PDDrawerViewContollerDelegate;


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



@class PDDrawerViewController;


@interface PDDrawerViewController : PDBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic)id <PDDrawerViewContollerDelegate> delegate;

@property(strong,nonatomic) NSMutableArray *imageArray;

@property (weak, nonatomic)UIBarButtonItem *menuLeftBarButtonItem;
@property(nonatomic,strong)UIView *menuView;
@property(nonatomic,strong)UIDynamicAnimator *animator;
@property(nonatomic,strong)UITableView *menuTableView;
@property(nonatomic,strong) UIButton *menuButton;

@property(nonatomic) BOOL isTapped ;


-(void)setupMenuView;
-(void)showMenu:(BOOL)menu;

@end



@protocol PDDrawerViewContollerDelegate <NSObject>

-(void) menuAction:(id)sender;

//-(void)drawerMenu:(PDDrawerViewController *)controller didSelectMenuItem:(STDrawerMenuViewControllerItem)item;

//-(void)setupMenuView;
//-(void)showMenu:(BOOL)menu;


@end
