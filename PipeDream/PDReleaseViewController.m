//
//  PDReleaseViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/12/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDReleaseViewController.h"
#import "PDReleaseDetailViewController.h"
#import "PDFeedTableViewCell.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "AppDelegate.h"
#import "PDDrawerMenuCell.h"
#import "PDNavigationController.h"

#import "PDNetworkClient.h"

@interface PDReleaseViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@property(nonatomic, strong) NSMutableArray *releaseArticlesArray;
@property(nonatomic,strong) Article *releaseArticles;



- (IBAction)showMenu:(UIBarButtonItem *)sender;

@end

@implementation PDReleaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _releaseArticles=[[Article alloc]init];
    [self loadOpinionArticles];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - MenuBar
- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        _releaseArticlesArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)loadOpinionArticles
{
    PDNetworkClient *manager = [[PDNetworkClient alloc] init];
    [manager getOpinionArticlesWithCompletion:^(NSArray *array, NSError *error) {
        if (error == nil) {
            if (array != nil) {
                [_releaseArticlesArray removeAllObjects];
                [_releaseArticlesArray addObjectsFromArray:array];
                
                [self.tableView reloadData];
            }
        }
    }];
}





#pragma mark - TableView datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_releaseArticlesArray  count];
    
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
