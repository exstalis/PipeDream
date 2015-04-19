//
//  PDNewsViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/8/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDNewsViewController.h"
#import "PDFeedTableViewCell.h"
#import "AppDelegate.h"
#import "PDNewsTableviewCell.h"
#import "Article.h"
#import "ArticleCategory.h"
#import "PDNetworkClient.h"
#import "RequestOperationConfig.h"
#import "PDSingleton.h"

@interface PDNewsViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;




@property NSMutableArray *newsArticleArray;
@property NSString *newsArticle;


-(void)loadNewsArticle;


@end



@implementation PDNewsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self loadNewsArticle];
//    self.indicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    
    
    

    

    
}



-(void)loadNewsArticle{
    
    
    PDNetworkClient *manager=[[PDNetworkClient alloc ]init];
    [manager getRecentArticleWithCompletion:^(NSArray *array, NSError *error) {
        
        if (error==nil) {
            if (array!=nil) {
                [self.newsArticleArray removeAllObjects];
                [self.newsArticleArray arrayByAddingObjectsFromArray:array];
                
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

    return _newsArticleArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   NSArray *newsTableArray=[self.newsArticleArray objectAtIndex:indexPath.row];
    NSLog(@"%@",newsTableArray);
    
   
    
    PDNewsTableviewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"newsCell" forIndexPath:indexPath];
    
    [cell.newsTitle viewWithTag:1];
//    [cell.newsExcerptLabel.text=[newsTableArray valueForKey:@"excerpt"];
    
    
//    [cell.newsTitle.text=[areddit valueForKey:@"title"];
    
    if (cell==nil) {
        cell=[[PDNewsTableviewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsCell"];
        
    }
    
    
    
    
    return cell;
    
}



#pragma mark -Menu Action Delegate





- (IBAction)showMenu:(UIBarButtonItem *)sender {
    
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
    

}


- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}


@end
