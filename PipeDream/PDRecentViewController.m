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
#import "NSString+HTMLDecoder.h"
#import "PDRecentDetailViewController.h"

@interface PDRecentViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButton;
@property IBOutlet UISearchBar *searchBar;
- (IBAction)showMenu:(id)sender;
-(IBAction)displaySearch:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *searchButtonClicked;

@property(strong, nonatomic) UISearchDisplayController *searchController;
@property(nonatomic, strong) NSMutableArray *recentArticlesArray;
@property(strong, nonatomic) NSMutableArray *filteredArticleArray;

- (void)loadRecentArticles;

@end

@implementation PDRecentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadRecentArticles];
    
    self.searchController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    self.searchController.delegate = self;
    self.searchController.searchResultsDataSource = self;
//    self.searchController.searchResultsDelegate = self;
    [self.searchController setActive:NO animated:YES];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"RecentDetailSegue"]) {
        
        PDRecentDetailViewController *destinationViewController = (PDRecentDetailViewController *)[segue destinationViewController];
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        destinationViewController.contentArticle=[self.recentArticlesArray objectAtIndex:selectedIndexPath.row];
        destinationViewController.contentAttachment=self.feedAttachments;
        
    }
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
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredArticleArray count];
    }
    else {
    return [_recentArticlesArray count];
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PDRecentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recentCell" forIndexPath:indexPath];

    if (cell == nil) {
        cell = [[PDRecentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"recentCell"];
    }
    
    for(UIView * cellSubviews in cell.subviews)
    {
        cellSubviews.userInteractionEnabled = NO;
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        self.feedArticle = [_filteredArticleArray objectAtIndex:indexPath.row];
        
        cell.titleLabel.text = [self.feedArticle.articleTitle decodeHTML];
        cell.authorLabel.text = self.feedArticle.authorName;
        cell.dateLabel.text = self.feedArticle.date.description;
        cell.excerptLabel.text = self.feedArticle.articleExcerpt;
        
        [cell.recentThumbnail cancelImageRequestOperation];
        
        
        NSURL* url=[NSURL URLWithString:self.feedAttachments.thumbnailImage [@"url"]];
        for (Attachments *att in self.feedArticle.articleAttachments) {
            self.feedAttachments=att;
            
        }
        
        [cell.recentThumbnail setImageWithURL:url placeholderImage:[UIImage imageNamed: @"menu.png"]];
        
    } else {
        self.feedArticle = [_recentArticlesArray objectAtIndex:indexPath.row];
        
        cell.titleLabel.text = [self.feedArticle.articleTitle decodeHTML];
        cell.authorLabel.text = self.feedArticle.authorName;
        cell.dateLabel.text = self.feedArticle.date.description;
        cell.excerptLabel.text = [self.feedArticle.articleExcerpt decodeHTML];
        
        [cell.recentThumbnail cancelImageRequestOperation];
        
        
        NSURL* url=[NSURL URLWithString:self.feedAttachments.thumbnailImage [@"url"]];
        for (Attachments *att in self.feedArticle.articleAttachments) {
            self.feedAttachments=att;
            
        }
        
        [cell.recentThumbnail setImageWithURL:url placeholderImage:[UIImage imageNamed: @"menu.png"]];
    }

    
    return cell;
}

-(void) getFilteredContent:(NSString *)filter {
    PDNetworkClient *manager = [[PDNetworkClient alloc] init];
    [manager getOpinionArticlesWithCompletion:^(NSArray *array, NSError *error) {
        if (error == nil) {
            if (array != nil) {
                [_filteredArticleArray removeAllObjects];
                [_filteredArticleArray addObjectsFromArray:array];
                
                [self.tableView reloadData];
            }
        }
    }];
        
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self getFilteredContent:searchString];
    
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
   
    CGRect newBounds = self.tableView.bounds;
    if (self.tableView.bounds.origin.y < 44) {
        newBounds.origin.y = newBounds.origin.y + self.searchBar.bounds.size.height;
        self.tableView.bounds = newBounds;
    }
    
}


-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self.searchDisplayController setActive:YES];
}


-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self viewDidAppear:NO];
}


#pragma mark -Menu Action Delegate


- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}
- (IBAction)displaySearch:(id)sender {
    [self.searchBar becomeFirstResponder];
}


- (IBAction)showMenu:(id)sender {
    
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];

}
@end
