//
//  PDBaseViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 3/21/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "PDDrawerCustomCellBackground.h"
#import "PDDrawerMenuCell.h"
#import "PDNavigationController.h"


@interface PDBaseViewController : UIViewController<UIViewControllerTransitioningDelegate,UIGestureRecognizerDelegate>

@property(strong,nonatomic) NSMutableArray *imageArray;
@property(nonatomic,strong) NSArray* menuItems;
@property(nonatomic,strong)UIView *menuView;
@property(nonatomic,strong)UIDynamicAnimator *animator;
@property(nonatomic,strong) UIButton *menuButton;
@property(nonatomic,readonly)NSString *identifier;

@property(nonatomic) BOOL isTapped ;

-(NSString*)identifier;

-(void)setupMenuView;
-(void)showMenu:(BOOL)menu;

//@property(nonatomic)UIView *contentView;
//gesture recognizerlara bak eklemen gerekebilir
- (void)showErrorViewWithError:(NSError*)error;
-(void)showEmptyViewWithInfo:(NSString *)info;

//- (void)informError:(id)error details:(NSString *)details;
//- (void)showMessage:(NSString *)message;
//- (void)showLoadingMessage:(NSString *)message;
//
//

@end
