//
//  PDSportsViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/12/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDSportsViewController.h"
#import "PDSportsDetailViewController.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "AppDelegate.h"
#import "PDDrawerMenuCell.h"
#import "PDNetworkClient.h"
#import "PDSportsTableViewCell.h"
#import "Article.h"
#import "PDNetworkClient.h"


@interface PDSportsViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;

@property(nonatomic,strong)Article *sportsArticles;

@property(nonatomic, strong) NSMutableArray *sportsArticlesArray;

@end

@implementation PDSportsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self loadSportsArticles];
    _sportsArticles=[[Article alloc]init];
    _sportsArticlesArray=[[NSMutableArray alloc]init];
    



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)loadSportsArticles
{
    PDNetworkClient *manager = [[PDNetworkClient alloc] init];
    [manager getOpinionArticlesWithCompletion:^(NSArray *array, NSError *error) {
        if (error == nil) {
            if (array != nil) {
                [_sportsArticlesArray removeAllObjects];
                [_sportsArticlesArray addObjectsFromArray:array];
                
                [self.tableView reloadData];
            }
        }
    }];
}




- (IBAction)showMenu:(UIBarButtonItem *)sender {
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
    
    
}


#pragma Menu action method

- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}




#pragma mark - TableView datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_sportsArticlesArray count];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    PDSportsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"sportsCell"];
    if (cell==nil) {
        cell=[[PDSportsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sportsCell"];
        
    }
    
    _sportsArticles=[_sportsArticlesArray objectAtIndex:indexPath.row];
    cell.sportsTitle.text=_sportsArticles.articleTitle;
    cell.sportsExcerpt.text=_sportsArticles.articleExcerpt;
    cell.sportsAuthor.text=_sportsArticles.authorName;
    cell.sportsDate.text=_sportsArticles.articleDate.description;
    
    
    

    return cell;
    
}


@end
