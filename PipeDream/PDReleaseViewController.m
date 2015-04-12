//
//  PDReleaseViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/12/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDReleaseViewController.h"
#import "PDFeedTableViewCell.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "AppDelegate.h"
#import "PDDrawerMenuCell.h"
#import "PDNavigationController.h"


@interface PDReleaseViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;

@end

@implementation PDReleaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    
    
    PDFeedTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"releaseCell"];
    if (cell==nil) {
        cell=[[PDFeedTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"releaseCell"];
        
    }
    
    
    
    
    return cell;
    
}



- (IBAction)showMenu:(UIBarButtonItem *)sender {
    
    
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
    
}
@end
