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

#import "PDShareButton.h"


@interface PDNewsViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;

@property(nonatomic,strong)PDShareUtility *newsShareUtility;

@property (nonatomic,strong) NSMutableArray *newsArticleArray;
//@property(nonatomic)PDShareButton *newsShareOptionButton;



-(void)loadNewsArticle;

@end


@implementation PDNewsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    


    self.newsShareUtility.delegate=self;
    

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
    
    [[PDSingleton sharedClient] initWithArticle:self.feedArticle];
    
   self.feedArticle=[_newsArticleArray objectAtIndex:indexPath.row];


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

    
        if ([self.fbShareButton.titleLabel.text isEqualToString:@"Share on Facebook"] ){
            FBSDKShareDialog *shareDialog=[_newsShareUtility getShareDialogWithContentURL:[PDSingleton sharedClient].sharedArticle.articleURL];
            
            _newsShareUtility.delegate=self;
            
        
//              shareDialog.delegate = self;
            
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
