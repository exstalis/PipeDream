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
#import <AFNetworking.h>
#import <UIKit+AFNetworking.h>
#import <QuartzCore/QuartzCore.h>
#import "PDShareButton.h"


@interface PDNewsViewController ()<FBSDKSharingDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;


@property (nonatomic,strong) NSMutableArray *newsArticleArray;
@property(nonatomic,strong)NSMutableArray *newsAttachments;
//@property(nonatomic)PDShareButton *newsShareOptionButton;



-(void)loadNewsArticle;

@end


@implementation PDNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    

    PDSingleton *sharedNewsArticle=[[PDSingleton alloc]initWithArticle:_newsFeedArticle];
    

    [self loadNewsArticle];
    
//    self.indicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    if (self!=nil) {
        _newsArticleArray=[[NSMutableArray alloc]init];
        
    }
    return self;
    
}

//sfacebook share lazy instantiation

-(void)setNewsShareUtility:(PDShareUtility *)newsShareUtility{
    
    
    if (![_newsShareUtility isEqual:newsShareUtility]) {
        _newsShareUtility.delegate=nil;
        _newsShareUtility=newsShareUtility;
        
        
    }
    
}

//fetch articles

-(void)loadNewsArticle{
    
    PDNetworkClient *manager=[[PDNetworkClient alloc ]init];
    
        [manager getNewsArticlesWithCompletion:^(NSArray *array, NSError *error) {
            if (error==nil) {
                if (array!=nil) {
                    [_newsArticleArray removeAllObjects];
                    [_newsArticleArray addObjectsFromArray:array];
                    [self.tableView reloadData];
                    
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
    if (newsCell==nil) {
        newsCell=[[PDNewsTableviewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsCell"];
    }
    
    
    [PDSingleton sharedClient].sharedArticle=[_newsArticleArray objectAtIndex:indexPath.row];
//    NSLog(@"shared article : %@",[PDSingleton sharedClient].sharedArticle);
    
    
    newsCell.newsTitle.text=[PDSingleton sharedClient].sharedArticle.articleTitle;
    newsCell.newsExcerptTextView.text=[PDSingleton sharedClient].sharedArticle.articleExcerpt;
    newsCell.newsAuthorLabel.text=[PDSingleton sharedClient].sharedArticle.authorName;
    newsCell.newsDateLabel.text=[PDSingleton sharedClient].sharedArticle.articleDate.description;
    


    [self shareButtoninitWith:newsCell.newsShareButton];
    
        if ([self.fbShareButton.titleLabel.text isEqualToString:@"Share on Facebook"] ){
            FBSDKShareDialog *shareDialog=[_newsShareUtility getShareDialogWithContentURL:[PDSingleton sharedClient].sharedArticle.articleURL];
            
    
              shareDialog.delegate = self;
            
              [shareDialog show];
        }
    
    return newsCell;
    
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
