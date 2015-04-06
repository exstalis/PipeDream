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
#import "PDFeedTableViewController.h"

static NSString * const kPDTwitterAppURL=@"twitter://user?screen_name=bupipedream";
static NSString * const kPDTwitterBrowserURL=@"https://twitter.com/bupipedream/";
static NSString * const kPDFacebookAppURL = @"fb://profile/bupipedream";
static NSString * const kPDFacebookBrowserURL = @"https://www.facebook.com/BUPipeDream";
static NSString * const kPDInstagramAppURL = @"instagram://user?username=bupipedream";
static NSString * const kPDInstagramBrowserURL = @"https://instagram.com/bupipedream";



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


@interface PDDrawerViewController ()<FBSDKLiking>
{
    UIImage *_drawerBackground;
    FBSDKLikeButton *_fbLikeButton;
    PDFeedTableViewController *_notify;
    
    

    
}
@end

@implementation PDDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.tableView.contentInset = UIEdgeInsetsMake(kPDTableViewTopInset, 0.0, 0.0, 0.0);
    self.clearsSelectionOnViewWillAppear = NO;
    self.drawerfooterView.backgroundColor=[UIColor clearColor];
    
    

    
    
    
    
    
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
            

            
            break;
        }
            
        case PDMenuViewControllerItemOpinion:{
            cell.sectionTitle=@"Opinion";
            cell.iconImage=[UIImage imageNamed:@"opinion_menu_icon"];
            
            break;
        }
        case PDMenuViewControllerItemRelease:{
            cell.sectionTitle= @"Release";
            cell.iconImage=[UIImage imageNamed:@"release_menu_icon"];
            
            break;
        }
            
        case PDMenuViewControllerItemSports:{
            cell.sectionTitle=@"Sports";
            cell.iconImage=[UIImage imageNamed:@"sports_icon"];
            break;
        }
        case PDMenuViewControllerItemContact:{
            cell.sectionTitle=@"Contact";
            cell.iconImage=[UIImage imageNamed:@"contact_icon"];

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
    if ((PDMenuViewControllerItem)indexPath.row==PDMenuViewControllerItemContact) {
        destinationViewController=[[AppDelegate globalDelegate] contactViewController];
    }
    
    
    [[[AppDelegate globalDelegate] drawerViewController] setCenterViewController:destinationViewController];
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
        
    }


#pragma button setters
-(void)facebookLikeControl{
    
    _fbLikeButton=[[FBSDKLikeButton alloc]init];
    _fbLikeButton.objectType=FBSDKLikeObjectTypePage;
    
    FBSDKLikeControl * fblike=[[FBSDKLikeControl alloc]init];
    fblike.likeControlStyle=FBSDKLikeControlStyleStandard;
    fblike.likeControlHorizontalAlignment = FBSDKLikeControlHorizontalAlignmentCenter;;
    fblike.objectID=kPDFacebookBrowserURL;
    
    
    [self.drawerfooterView addSubview:fblike];
    
    
}


- (IBAction)followPDOnTwitter:(id)sender {
    
    if(![[UIApplication sharedApplication] openURL:[NSURL URLWithString:kPDFacebookAppURL]]) {
        if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:kPDFacebookBrowserURL]]) {
            _notify=[[PDFeedTableViewController alloc]init];
            [_notify notifyUserShareDidCompletePopUp:@"an error occured!"];
            
            
                }
    }
}

- (IBAction)likePDOnFacebook:(id)sender {
    [self facebookLikeControl];

    
    
}
- (IBAction)followPDOnInstagram:(id)sender {
    
    
    
    
    
}
@end
