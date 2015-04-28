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
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "PDArticleContentView.h"
#import "PDNewsViewController.h"

@interface PDNewsDetailViewController ()<FBSDKSharingDelegate,FBSDKSharingDialog>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;


@property(nonatomic)PDArticleContentView *articleContents;



@end

@implementation PDNewsDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.contenctAttachment=[[Attachments alloc]init];
  
    [self contentView];
    
    
//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    loginButton.center = self.view.center;
//    [self.view addSubview:loginButton];

    
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.newsDetailArticleArray= [[NSMutableArray alloc] init];
        self.newsDetailAttachments=[[NSMutableArray alloc]init];
        
    }
    return self;
}




-(void)contentView{
    
    
    
    
    [self scrollViewDidChange:self.newsScrollView];

    self.newsDetailTitle.text=self.contentArticle.articleTitle;
    NSLog(@"%@",self.contentArticle.articleBody);
    
    [self textViewDidChange:self.newsDetailsArticle];

    self.newsDetailsArticle.text=self.contentArticle.articleBody;

    
    
    
    
    
}


@end
