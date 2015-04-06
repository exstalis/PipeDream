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

@interface PDRecentViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButton;
- (IBAction)showMenu:(id)sender;


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
        _recentArticleArray = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)loadRecentArticles
{
    PDNetworkClient *manager = [[PDNetworkClient alloc] init];
    [manager getRecentArticleWithCompletion:^(NSArray *array, NSError *error) {
        if (error == nil) {
            if (array != nil) {
                
                [_recentArticleArray addObjectsFromArray:array];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }
        }
    }];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    return [_recentArticleArray count];
   
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PDRecentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recentCell" forIndexPath:indexPath];

  
        self.feedArticle = [_recentArticleArray objectAtIndex:indexPath.row];
        
        cell.titleLabel.text = [self.feedArticle.articleTitle decodeHTML];
        cell.authorLabel.text = self.feedArticle.authorName;
        cell.dateLabel.text = self.feedArticle.date.description;
        cell.excerptLabel.text = [self.feedArticle.articleExcerpt decodeHTML];
        
        [cell.recentThumbnail cancelImageRequestOperation];
        
        
        NSURL* url=[NSURL URLWithString:self.feedAttachments.thumbnailImage [@"url"]];
        for (Attachments *att in self.feedArticle.articleAttachments) {
            self.feedAttachments=att;
            
        }
        
        [cell.recentThumbnail setImageWithURL:url placeholderImage:[UIImage imageNamed: @"placeholder"]];
    
    return cell;
}


- (void)viewWillAppear:(BOOL)animated {
   
   
    
    [super viewWillDisappear:animated];
}

-(void)awakeFromNib{
    [self loadRecentArticles];

}






#pragma mark -Menu Action Delegate


- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}





- (IBAction)showMenu:(id)sender {
    
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];

}
@end
