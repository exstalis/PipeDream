//
//  PDDrawerViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 3/21/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//




#import "PDDrawerViewController.h"


@interface PDDrawerViewController ()




@property(strong,nonatomic) NSMutableArray *imageArray;

@property (weak, nonatomic)  UIBarButtonItem *menuLeftBarButtonItem;
@property(nonatomic,strong)UIView *menuView;
@property(nonatomic,strong)UIDynamicAnimator *animator;
@property(nonatomic,strong)UITableView *menuTableView;
@property(nonatomic,strong) UIButton *menuButton;
@property(nonatomic,strong) NSArray *menuItems;
@property(nonatomic) BOOL isTapped ;



@end

@implementation PDDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
