//
//  PDDrawerViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/11/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDDrawerViewController.h"
#import "AppDelegate.h"
#import "JVFloatingDrawerViewController.h"
#import "PDDrawerMenuCell.h"

enum {
    kPDDrawerMenuIndex    = 0,
    kPDNewsPageIndex = 1,
    kPDOpinionPageIndex = 2,
    kPDReleasePageIndex = 3,
    kPDSportsPageIndex = 4,
    kPDContactPageIndex = 5,
    kPDSettingsPageIndex = 6,
    
    
    
    
};

static const CGFloat kPDTableViewTopInset = 80.0;
static NSString * const kPDDrawerCellReuseIdentifier = @"PDDrawerCellReuseIdentifier";


@interface PDDrawerViewController ()

@end

@implementation PDDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.contentInset = UIEdgeInsetsMake(kPDTableViewTopInset, 0.0, 0.0, 0.0);
    self.clearsSelectionOnViewWillAppear = NO;
    
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:kPDDrawerMenuIndex inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return PDMenuViewControllerItem_COUNT;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PDDrawerMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:kPDDrawerCellReuseIdentifier forIndexPath:indexPath];
    
    
    switch ((PDMenuViewControllerItem)indexPath.row) {
            
            
        case PDMenuViewControllerItemRecent:{
            cell.sectionTitle=@"Recent";
            break;
            
        }
        case PDMenuViewControllerItemNews:{
            
            cell.sectionTitle=@"News";
            
            //            put an image
            break;
        }
            
        case PDMenuViewControllerItemOpinion:{
            cell.sectionTitle=@"Opinion";
            //            put an image
            break;
        }
        case PDMenuViewControllerItemRelease:{
            cell.sectionTitle= @"Release";
            //            put an image
            break;
        }
            
        case PDMenuViewControllerItemSports:{
            cell.sectionTitle=@"Sports";
            //            put an image
            break;
        }
        case PDMenuViewControllerItemContact:{
            cell.sectionTitle=@"Contact";
         
            //            put an image
            break;
        }
        case PDMenuViewControllerItemSettings:{
            cell.sectionTitle=@"Settings";
    
            //            put an image
            break;
        }
        case PDMenuViewControllerItem_COUNT:
        default:
            return nil;
    }
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
            UIViewController *destinationViewController = nil;
    
    
    if ((PDMenuViewControllerItem)indexPath.row==PDMenuViewControllerItemNews) {
       
            destinationViewController=[[AppDelegate globalDelegate] newsViewController];
        }
    if ((PDMenuViewControllerItem)indexPath.row==PDMenuViewControllerItemOpinion){
            destinationViewController=[[AppDelegate globalDelegate] opinionViewController];
        }
    if ((PDMenuViewControllerItem)indexPath.row==PDMenuViewControllerItemRelease){
        
          destinationViewController=[[AppDelegate globalDelegate] releaseViewController];

        }
    if ((PDMenuViewControllerItem)indexPath.row==PDMenuViewControllerItemSports){
        
        destinationViewController=[[AppDelegate globalDelegate] sportsViewController];
        
    }
    if ((PDMenuViewControllerItem)indexPath.row==PDMenuViewControllerItemRecent) {
         destinationViewController=[[AppDelegate globalDelegate] recentViewController];
    }
    
    [[[AppDelegate globalDelegate] drawerViewController] setCenterViewController:destinationViewController];
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
        
    }



@end
