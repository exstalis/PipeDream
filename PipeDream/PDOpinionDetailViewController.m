//
//  PDOpinionDetailViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/11/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDOpinionDetailViewController.h"
#import "AppDelegate.h"
#import "PDNewsTableviewCell.h"
#import "Article.h"
#import "ArticleCategory.h"
#import "PDNetworkClient.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "PDArticleContentView.h"
#import "Attachments.h"
#import <UIKit+AFNetworking.h>


@interface PDOpinionDetailViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barBackButton;

@end

@implementation PDOpinionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self contentView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.opinionDetailArticleArray= [[NSMutableArray alloc] init];
        self.opinionDetailAttachments=[[NSMutableArray alloc]init];
    }
    return self;
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

-(void)contentView{
    
    [self scrollViewDidChange:self.opinionScrollView];
    
    self.titleLabel.text=self.contentArticle.articleTitle;
    
    [self textViewDidChange:self.articleBody];
    
    self.articleBody.text=self.contentArticle.articleBody;

    NSURL *imageURL=[NSURL URLWithString:self.contentAttachment.fullImage[@"url"]];
    [self.articleImage setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"Logo.png"]];

    
    
    
    
    
}

@end
