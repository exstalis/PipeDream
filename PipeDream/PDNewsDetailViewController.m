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

@interface PDNewsDetailViewController ()<FBSDKSharingDelegate,FBSDKSharingDialog>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;


@property(nonatomic)PDArticleContentView *articleContents;



@end

@implementation PDNewsDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
  
    
    
    
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
    
    [self textViewDidChange:self.newsDetailsArticle];
    
    self.newsDetailsArticle.text=self.contentArticle.articleBody;
    
    NSURL *imageURL=[NSURL URLWithString:self.contentAttachment.fullImage[@"url"]];
    
    [self.newsDetailImage setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"Logo.png"]];
    
    
    
    
    
}


-(BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

-(void)viewWillAppear:(BOOL)animated{
    [self resignFirstResponder];
    [self contentView];
    [super viewWillDisappear:animated];
}




@end
