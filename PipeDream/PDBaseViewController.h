//
//  PDBaseViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 3/21/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "PDDrawerCustomCellBackground.h"


@interface PDBaseViewController : UIViewController<UIViewControllerTransitioningDelegate,UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) NSMutableArray *imageArray;
@property(nonatomic,strong) NSArray* menuItems;
@property (weak, nonatomic)UIBarButtonItem *menuLeftBarButtonItem;
@property(nonatomic,strong)PDDrawerCustomCellBackground *menuView;
@property(nonatomic,strong)UIDynamicAnimator *animator;
@property(nonatomic,strong)UITableView *menuTableView;
@property(nonatomic,strong) UIButton *menuButton;

@property(nonatomic) BOOL isTapped ;


-(void)setupMenuView;
-(void)showMenu:(BOOL)menu;

@property(nonatomic)UIView *contentView;
//gesture recognizerlara bak eklemen gerekebilir
- (void)showErrorViewWithError:(NSError*)error;
-(void)showEmptyViewWithInfo:(NSString *)info;

//- (void)informError:(id)error details:(NSString *)details;
//- (void)showMessage:(NSString *)message;
//- (void)showLoadingMessage:(NSString *)message;
//
//

@end
