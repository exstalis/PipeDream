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
#import "NSString+HTMLDecoder.h"


@interface PDSportsViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;
- (IBAction)showSharePopupView:(id)sender;

-(void)loadSportsArticles;

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
    [manager getSportsArticlesWithCompletion:^(NSArray *array, NSError *error) {
        if (error == nil) {
            if (array != nil) {
                [_sportsArticlesArray removeAllObjects];
                [_sportsArticlesArray addObjectsFromArray:array];
                
                [self.tableView reloadData];
            }
        }
    }];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SportsDetailSegue"]) {
        
        PDSportsDetailViewController *destinationViewController = (PDSportsDetailViewController *)[segue destinationViewController];
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        destinationViewController.contentArticle=[self.sportsArticlesArray objectAtIndex:selectedIndexPath.row];
        destinationViewController.contentAttachment=self.feedAttachments;
        
    }
}

- (IBAction)showMenu:(UIBarButtonItem *)sender {
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
    
    
}

- (IBAction)showSharePopupView:(id)sender {
    [self sharePopupView];
    
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
    
    cell.sportsTitle.userInteractionEnabled=NO;
    cell.sportsThumbnail.userInteractionEnabled=NO;
    cell.sportsExcerpt.userInteractionEnabled=NO;
    cell.sportsAuthor.userInteractionEnabled=NO;
    
    
    cell.sportsTitle.text = [_sportsArticles.articleTitle decodeHTML];
    cell.sportsExcerpt.text = [_sportsArticles.articleExcerpt decodeHTML];
    cell.sportsAuthor.text=_sportsArticles.authorName;
    cell.sportsDate.text=_sportsArticles.date.description;
    
    [cell.sportsThumbnail cancelImageRequestOperation];
    
    NSURL* url=[NSURL URLWithString:self.feedAttachments.thumbnailImage [@"url"]];
    for (Attachments *att in self.sportsArticles.articleAttachments) {
        self.feedAttachments=att;
        
    }
    
    [cell.sportsThumbnail setImageWithURL:url placeholderImage:[UIImage imageNamed: @"menu.png"]];
    
    
    if ([cell.shareButton isTouchInside]) {
        
        
        [cell.shareButton addTarget:self.tableView.indexPathForSelectedRow action:@selector(showSharePopupView::) forControlEvents:UIControlEventTouchUpInside];
        
        if ([self.fbShareButton isTouchInside]) {

            
            [self.shareUtility.shareDialog canShow];
            [self facebookShare];
            
            
            
            
        }
        
    }
    
    
    return cell;
    
}


@end
