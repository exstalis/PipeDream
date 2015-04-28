//
//  PDNewsViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/8/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDNewsViewController.h"
#import "PDNewsDetailViewController.h"
#import "AppDelegate.h"
#import "PDNewsTableviewCell.h"
#import "Article.h"
#import "ArticleCategory.h"
#import "PDNetworkClient.h"
#import "RequestOperationConfig.h"
#import "PDSingleton.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "PDNewsDetailViewController.h"
#import "PDShareButton.h"



@interface PDNewsViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;

@property(nonatomic,strong)PDShareUtility *newsShareUtility;

//@property(nonatomic)PDShareButton *newsShareOptionButton;



-(void)loadNewsArticle;

@end


@implementation PDNewsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [[PDSingleton sharedClient] initWithArticle:self.feedArticle];

    

    self.newsShareUtility.delegate=self;
    

    [self loadNewsArticle];
    
//    self.indicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

}
//-(BOOL)canBecomeFirstResponder
//{
//    return YES;
//}
//
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    [self becomeFirstResponder];
//}
//
//-(void)viewWillAppear:(BOOL)animated{
//    [self resignFirstResponder];
//    [super viewWillDisappear:animated];
//}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    if (self!=nil) {
        _newsArticleArray=[[NSMutableArray alloc]init];
        
        
    }
    return self;
    
}


-(void)dealloc{
    
    self.newsShareUtility.delegate=nil;

}

//fetch articles

-(void)loadNewsArticle{
    
    PDNetworkClient *manager=[[PDNetworkClient alloc ]init];
    
        [manager getNewsArticlesWithCompletion:^(NSArray *array, NSError *error) {
            if (error==nil) {
                if (array!=nil) {
                    [_newsArticleArray removeAllObjects];
                    [_newsArticleArray addObjectsFromArray:array];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.tableView reloadData];
                    });
                    
                    
                }
            }

        }];
  


}
  
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [_newsArticleArray count];
//    buraya ttotal count vement gerek
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PDNewsTableviewCell *newsCell=[tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    
    
   self.feedArticle=[self.newsArticleArray objectAtIndex:indexPath.row] ;


    
    
    newsCell.newsTitle.text= self.feedArticle.articleTitle;
    newsCell.newsExcerptTextView.text=self.feedArticle.articleExcerpt;
    newsCell.newsAuthorLabel.text=self.feedArticle.authorName;
    newsCell.newsDateLabel.text=self.feedArticle.articleDate.description;

    [newsCell.newsThumbnailImage cancelImageRequestOperation];


    for (Attachments *att in self.feedArticle.articleAttachments) {
            self.feedAttachments=att;

    }
    
    NSURL* url=[NSURL URLWithString:self.feedAttachments.thumbnailImage [@"url"]];
        
    [newsCell.newsThumbnailImage setImageWithURL:url placeholderImage:[UIImage imageNamed: @"menu.png"]];
    
    
  
    [self shareButtoninitWith:newsCell.newsShareButton];
    

    [self.shareUtility setShareUtility:_newsShareUtility];

    _newsShareUtility.delegate=self;

    if ([self.fbShareButton.titleLabel.text isEqualToString:@"Share on Facebook"] ){
            FBSDKShareDialog *shareDialog=[_newsShareUtility getShareDialogWithContentURL:self.feedArticle.articleURL];
        

              [shareDialog show];
        }
    
    
        return newsCell;
    
}


#pragma segue to newsdetail

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"NewsDetailSegue"]) {
        PDNewsDetailViewController *destinationViewController = (PDNewsDetailViewController *)[segue destinationViewController];
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
//        Article * article= [self.newsArticleArray objectAtIndex:selectedIndexPath.row];
        
        destinationViewController.contentArticle=[self.newsArticleArray objectAtIndex:selectedIndexPath.row];
    
        NSLog(@"deatil article objects %@", destinationViewController.contentArticle );
    }
}

#pragma mark -Menu Action Delegate

- (IBAction)showMenu:(UIBarButtonItem *)sender {
    
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
    

}

- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}

#pragma shareOption


- (IBAction)showSharingOptionsPopU:(id)sender {

    [self sharingOptionsButtonAction];
}





@end
