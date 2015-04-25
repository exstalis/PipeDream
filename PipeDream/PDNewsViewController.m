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
#import <RNBlurModalView.h>
#import "PDShareButton.h"
#import "PDShareView.h"


@interface PDNewsViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;


@property (nonatomic,strong) NSMutableArray *newsArticleArray;
@property(nonatomic,strong)NSMutableArray *newsAttachments;
//@property(nonatomic)PDShareButton *newsShareOptionButton;
@property(nonatomic)PDShareView *popUpView;


-(void)loadNewsArticle;

@end


@implementation PDNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
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
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [_newsArticleArray count];
//    buraya ttotal count vrment gerek
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PDNewsTableviewCell *newsCell=[tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    if (newsCell==nil) {
        newsCell=[[PDNewsTableviewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsCell"];
    }
    
    Article *newsArticle=[_newsArticleArray objectAtIndex:indexPath.row];
//    NSLog(@"article array : %@",_newsArticleArray);
    
    
    newsCell.newsTitle.text=newsArticle.articleTitle;
    newsCell.newsExcerptTextView.text=newsArticle.articleExcerpt;
    newsCell.newsAuthorLabel.text=newsArticle.authorName;
    newsCell.newsDateLabel.text=newsArticle.articleDate.description;
    
    [self.popUpView shareButtoninitWith:newsCell.newsShareButton];
    
//    [newsCell.newsShareButton shareButtoninitWith:self.newsShareOptionButton];
    
//    newsCell.newsThumbnailImage.image=newsArticle.articleAttachments;
    
    
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
    
    self.popUpView=[[PDShareView alloc]init];
    [self.popUpView sharingOptions];
}





@end
