//
//  PDOpinionViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/11/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDOpinionViewController.h"
#import "PDOpinionDetailViewController.h"

#import "AppDelegate.h"
#import "Article.h"
#import "PDOpinionTableViewCell.h"
#import "PDShareButton.h"
#import "ArticleCategory.h"
#import "PDNetworkClient.h"
#import "Attachments.h"


@interface PDOpinionViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;

@property(nonatomic,strong) Article *opinionArticles;
@property(nonatomic, strong) NSMutableArray *opinionArticlesArray;

@end





@implementation PDOpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PDSingleton *sharedOpinionArticle=[[PDSingleton alloc]initWithArticle:_opinionArticles];

    [self loadOpinionArticles];
    
    
    
    
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        _opinionArticlesArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (void)loadOpinionArticles
{    
    PDNetworkClient *manager = [[PDNetworkClient alloc] init];
    [manager getOpinionArticlesWithCompletion:^(NSArray *array, NSError *error) {
        if (error == nil) {
            if (array != nil) {
                [_opinionArticlesArray removeAllObjects];
                [_opinionArticlesArray addObjectsFromArray:array];
                
                [self.tableView reloadData];
            }
        }
    }];
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
    
    return [_opinionArticlesArray count];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    PDOpinionTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"opinionCell" forIndexPath:indexPath];
    
    if (cell==nil) {
        cell=[[PDOpinionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"opinionCell"];
        
    }
    [PDSingleton sharedClient].sharedArticle=[_opinionArticlesArray objectAtIndex:indexPath.row];
    cell.opinionTitle.text=[PDSingleton sharedClient].sharedArticle.articleTitle;
    cell.opinionExcerptTextview.text=  [PDSingleton sharedClient].sharedArticle.articleExcerpt;
    cell.opinionAuthor.text=  [PDSingleton sharedClient].sharedArticle.authorName;
    cell.opinionDate.text=[PDSingleton sharedClient].sharedArticle.articleDate.description;
    

    
    
    return cell;
    
}


@end
