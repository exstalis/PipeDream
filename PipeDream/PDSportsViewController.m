//
//  PDSportsViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/12/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDSportsViewController.h"
#import "PDFeedTableViewCell.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "AppDelegate.h"
#import "PDDrawerMenuCell.h"
#import "PDNavigationController.h"

@interface PDSportsViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;

@end

@implementation PDSportsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (IBAction)showMenu:(UIBarButtonItem *)sender {
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
    
    
}


- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}


#pragma mark - TableView datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    PDFeedTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"sportsCell"];
    if (cell==nil) {
        cell=[[PDFeedTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sportsCell"];
        
    }
    

    return cell;
    
}


@end
