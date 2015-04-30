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
#import "PDOpinionTableViewCell.h"
#import "PDShareButton.h"
#import "ArticleCategory.h"
#import "NSString+HTMLDecoder.h"


@interface PDOpinionViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;

@property(nonatomic,strong) Article *opinionArticles;
@property(nonatomic,strong)PDShareUtility *opinionShareUtility;


- (IBAction)showShareOptionsPopup:(id)sender;

@end





@implementation PDOpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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





#pragma mark -Menu Action Delegate

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
    
   
    
    self.feedArticle=[_opinionArticlesArray objectAtIndex:indexPath.row];
    
    cell.opinionTitle.text = [self.feedArticle.articleTitle decodeHTML];
    cell.opinionExcerptTextview.text = [self.feedArticle.articleExcerpt decodeHTML];
    cell.opinionAuthor.text = self.feedArticle.authorName;
    cell.opinionDate.text = self.feedArticle.articleDate.description;
    [cell.opinionThumnail cancelImageRequestOperation];
    
    
    for (Attachments *att in self.feedArticle.articleAttachments) {
        self.feedAttachments=att;
        
    }
    
    
    NSURL* url=[NSURL URLWithString:self.feedAttachments.thumbnailImage [@"url"]];
    
    [cell.opinionThumnail setImageWithURL:url placeholderImage:[UIImage imageNamed: @"menu.png"]];
    
    
    if ([self.fbShareButton.titleLabel.text isEqualToString:@"Share on Facebook"] ){
        
        
        [self facebookShare];
        
        
    }

    

    if ([self.mailButton.titleLabel.text isEqualToString:@"Mail"]) {
        
        [self sendwithMail:self.mailButton];
        
        
        
        
    }
    
    
    return cell;
    
}

#pragma share option button action

- (IBAction)showShareOptionsPopup:(id)sender {
    
    
    [self sharingOptionsButtonAction];
    
}

#pragma segue to opinion detail



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"OpinionDetailSegue"]) {
        
        PDOpinionDetailViewController *destinationViewController = (PDOpinionDetailViewController *)[segue destinationViewController];
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
             destinationViewController.contentArticle=[self.opinionArticlesArray objectAtIndex:selectedIndexPath.row];
        destinationViewController.contentAttachment=self.feedAttachments;
   
    }
}
@end
