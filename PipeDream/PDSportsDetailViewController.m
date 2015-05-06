//
//  PDSportsDetailViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/12/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDSportsDetailViewController.h"
#import "AppDelegate.h"
#import "PDNewsTableviewCell.h"

@interface PDSportsDetailViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bodyHeightConstraint;

@end

@implementation PDSportsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self contentView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)contentView{
    
    [self scrollViewDidChange:self.scrollView];
    
    self.sportsTitle.text = [self.contentArticle.articleTitle decodeHTML];
    [self setTextFieldHeight:_titleHeightConstraint forView:self.sportsTitle];
    
    self.sportsBody.text = [self.contentArticle.articleBody decodeHTML];
    [self setTextFieldHeight:_bodyHeightConstraint forView:self.sportsBody];
    
    self.sportsAuthor.text = self.contentArticle.authorName;
    
    self.sportsDate.text = self.contentArticle.date;
    
    
    NSURL *imageURL=[NSURL URLWithString:self.contentAttachment.fullImage[@"url"]];
    [self.sportsImage setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"Logo.png"]];
    
    
}

-(void)setTextFieldHeight:(NSLayoutConstraint *)constraint forView:(UITextView *)textView {
    CGSize sizeThatShouldFitTheContent = [textView sizeThatFits:textView.frame.size];
    
    constraint.constant = sizeThatShouldFitTheContent.height;
    
}

@end
