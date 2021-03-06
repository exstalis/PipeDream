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
#import "NSString+HTMLDecoder.h"



@interface PDNewsDetailViewController ()<FBSDKSharingDelegate,FBSDKSharingDialog>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleHeightConstraint;

@property(nonatomic)PDArticleContentView *articleContents;
@property(nonatomic, assign) int currentFontSize;

@end

@implementation PDNewsDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self contentView];
    _currentFontSize = 12;
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


-(void)contentView{
    
    [self scrollViewDidChange:self.newsScrollView];
    
    self.newsDetailTitle.text = [self.contentArticle.articleTitle decodeHTML];
    [self setTextFieldHeight:_titleHeightConstraint forView:self.newsDetailTitle];
    
    self.newsDetailsArticle.text = [self.contentArticle.articleBody decodeHTML];
    [self setTextFieldHeight:_heightConstraint forView:self.newsDetailsArticle];
    
    self.newsDetailAuthor.text = self.contentArticle.authorName;
    self.newsDetailDate.text = self.contentArticle.date;
    
    NSURL *imageURL=[NSURL URLWithString:self.contentAttachment.fullImage[@"url"]];
    
    [self.newsDetailImage setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"Logo.png"]];
    
    
}

-(void)setTextFieldHeight:(NSLayoutConstraint *)constraint forView:(UITextView *)textView {
    CGSize sizeThatShouldFitTheContent = [textView sizeThatFits:textView.frame.size];
    
    constraint.constant = sizeThatShouldFitTheContent.height;
    
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

- (IBAction)increaseFontSize:(id)sender {
    _currentFontSize += 1;
    [_newsDetailsArticle setFont:[UIFont fontWithName:@"OpenSans-Bold" size:_currentFontSize]];
    [self setTextFieldHeight:_heightConstraint forView:self.newsDetailsArticle];
}
- (IBAction)decreaseFontSize:(id)sender {
    
    _currentFontSize -= 1;
    [_newsDetailsArticle setFont:[UIFont fontWithName:@"OpenSans-Bold" size:_currentFontSize]];
    [self setTextFieldHeight:_heightConstraint forView:self.newsDetailsArticle];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self setTextFieldHeight:_heightConstraint forView:self.newsDetailsArticle];
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
    }];
}

@end
