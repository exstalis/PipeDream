//
//  PDReleaseViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/12/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDReleaseViewController.h"
#import "PDReleaseDetailViewController.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "AppDelegate.h"
#import "PDDrawerMenuCell.h"
#import "PDNavigationController.h"
#import "PDReleaseTableViewCell.h"
#import "PDNetworkClient.h"
#import "NSString+HTMLDecoder.h"
#import "NSString+HTMLDecoder.h"
#import "NSString_stripHtml.h"


@interface PDReleaseViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;

- (IBAction)showShareOptions:(id)sender;
@property(nonatomic,strong)PDShareUtility *newsShareUtility;


- (void)showMenu:(UIBarButtonItem *)sender;
- (void)loadReleaseArticles;


@end

@implementation PDReleaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self loadReleaseArticles];


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        
        _releaseArticleArray = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
    [self loadReleaseArticles];

    [super viewWillDisappear:animated];


    
}

- (void)loadReleaseArticles
{
    PDNetworkClient *manager = [[PDNetworkClient alloc] init];
    [manager getReleaseArticlesWithCompletion:^(NSArray *array, NSError *error) {
        if (error == nil) {
            if (array != nil) {
                [_releaseArticleArray removeAllObjects];
           
                [_releaseArticleArray addObjectsFromArray:array];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }
        }
    }];
}





#pragma mark - TableView datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_releaseArticleArray  count];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    PDReleaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"releaseCell"];
  
  self.feedArticle=[_releaseArticleArray objectAtIndex:indexPath.row];
    cell.releaseTitle.text = [self.feedArticle.articleTitle decodeHTML];
    cell.releaseAuthor.text = self.feedArticle.authorName;
    cell.releaseDate.text = self.feedArticle.date.description;
    cell.releaseExcerpt.text= [self.feedArticle.articleExcerpt decodeHTML];
    
    [cell.releaseThumbnail cancelImageRequestOperation];

    
    NSURL* url=[NSURL URLWithString:self.feedAttachments.thumbnailImage [@"url"]];
    for (Attachments *att in self.feedArticle.articleAttachments) {
        self.feedAttachments=att;
        
    }
    
    [cell.releaseThumbnail setImageWithURL:url placeholderImage:[UIImage imageNamed: @"menu.png"]];
    
    [cell.releaseShareButton addTarget:self action:@selector(showShareOptions:) forControlEvents:UIControlEventTouchUpInside];
    

    if ([self.fbShareButton.titleLabel.text isEqualToString:@"Share on Facebook"] ){
        
        
        [self facebookShare];
        self.shareUtility.delegate=nil;
//        test delegate..
        
        
    }
    if ([self.mailButton.titleLabel.text isEqualToString:@"Mail"]) {
        
        [self sendwithMail:self.mailButton];
        
        
        
        
    }

    
    
    
    return cell;
    
}



#pragma segue to newsdetail

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ReleaseDetailSegue"]) {
        PDReleaseDetailViewController *destinationViewController = (PDReleaseDetailViewController *)[segue destinationViewController];
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        
        destinationViewController.contentArticle=[self.releaseArticleArray objectAtIndex:selectedIndexPath.row];
        destinationViewController.contentAttachment=self.feedAttachments;
        

    }
}



#pragma mark - MenuBar
- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}


- (void)showShareOptions:(id)sender {
    
    [self sharingOptionsButtonAction];

}

- (IBAction)showMenu:(UIBarButtonItem *)sender {
    
    
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
    
}




@end
