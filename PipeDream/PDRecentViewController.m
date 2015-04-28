//
//  PDRecentViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/22/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//
#import "AppDelegate.h"
#import "ArticleCategory.h"
#import "PDNetworkClient.h"
#import "RequestOperationConfig.h"
#import "PDSingleton.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "PDRecentViewController.h"
#import "PDRecentTableViewCell.h"

@interface PDRecentViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButton;
- (IBAction)showMenu:(id)sender;
@property(nonatomic, strong) NSMutableArray *recentArticlesArray;

- (void)loadRecentArticles;

@end

@implementation PDRecentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadRecentArticles];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        _recentArticlesArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)loadRecentArticles
{
    PDNetworkClient *manager = [[PDNetworkClient alloc] init];
    [manager getRecentArticleWithCompletion:^(NSArray *array, NSError *error) {
        if (error == nil) {
            if (array != nil) {
                [self.recentArticlesArray removeAllObjects];
                [self.recentArticlesArray addObjectsFromArray:array];
                
                [self.tableView reloadData];
            }
        }
    }];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_recentArticlesArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PDRecentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recentCell" forIndexPath:indexPath];

    
    [[PDSingleton sharedClient] initWithArticle:self.feedArticle];
    
    self.feedArticle=[_recentArticlesArray objectAtIndex:indexPath.row];
    cell.titleLabel.text=self.feedArticle.articleTitle;
    cell.authorLabel.text=  self.feedArticle.authorName;
    cell.dateLabel.text=self.feedArticle.articleDate.description;
    [cell.imageView cancelImageRequestOperation];

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark -Menu Action Delegate


- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}


- (IBAction)showMenu:(id)sender {
    
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];

}
@end
