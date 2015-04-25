//
//  PDNewsDetailViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/11/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDNewsDetailViewController.h"
#import "PDNewsViewController.h"
#import "AppDelegate.h"
#import "PDNewsTableviewCell.h"
#import "Article.h"
#import "ArticleCategory.h"
#import "PDNetworkClient.h"
#import "RequestOperationConfig.h"
#import "PDSingleton.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface PDNewsDetailViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;

@property (nonatomic,strong) NSMutableArray *newsDetailArticleArray;
@property(nonatomic,strong)NSMutableArray *newsDetailAttachments;


@end

@implementation PDNewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _newsDetailArticleArray=[[NSMutableArray alloc]init];
    _newsDetailAttachments=[[NSMutableArray alloc]init];
    [self loadNewsArticle ];
    
//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    loginButton.center = self.view.center;
//    [self.view addSubview:loginButton];
//    
//    
//    
//    
    
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}



-(void)loadNewsArticle{
    
    PDNetworkClient *manager=[[PDNetworkClient alloc ]init];
    
    [manager getNewsArticlesWithCompletion:^(NSArray *array, NSError *error) {
        if (error==nil) {
            if (array!=nil) {
                [_newsDetailArticleArray removeAllObjects];
                [_newsDetailArticleArray addObjectsFromArray:array];
                
             
                

            }
        }
        
    }];
    
    
    
}
@end
