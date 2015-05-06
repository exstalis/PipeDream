//
//  PDRecentDetailViewController.m
//  PipeDream
//
//  Created by Kenan Uzel on 5/5/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDRecentDetailViewController.h"
#import "AppDelegate.h"
#import "PDRecentTableviewCell.h"

@interface PDRecentDetailViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bodyHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleHeightConstraint;
@property(nonatomic, assign) int currentFontSize;

@end

@implementation PDRecentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self contentView];
    _currentFontSize = 12;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)contentView{
    
    [self scrollViewDidChange:self.recentScrollView];
    
    self.recentDetailTitle.text = [self.contentArticle.articleTitle decodeHTML];
    [self setTextFieldHeight:_titleHeightConstraint forView:self.recentDetailTitle];
    
    self.recentDetailBody.text = [self.contentArticle.articleBody decodeHTML];
    [self setTextFieldHeight:_bodyHeightConstraint forView:self.recentDetailBody];
    
    self.recentDetailAuthor.text = self.contentArticle.authorName;
    
    
    NSURL *imageURL=[NSURL URLWithString:self.contentAttachment.fullImage[@"url"]];
    [self.recentDetailImage setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"Logo.png"]];
    
    
}

-(void)setTextFieldHeight:(NSLayoutConstraint *)constraint forView:(UITextView *)textView {
    CGSize sizeThatShouldFitTheContent = [textView sizeThatFits:textView.frame.size];
    
    constraint.constant = sizeThatShouldFitTheContent.height;
    
}
- (IBAction)increaseFontSize:(id)sender {
    _currentFontSize += 1;
    [_recentDetailBody setFont:[UIFont fontWithName:@"OpenSans-Bold" size:_currentFontSize]];
    [self setTextFieldHeight:_bodyHeightConstraint forView:self.recentDetailBody];
}

- (IBAction)decreaseFontSize:(id)sender {
    _currentFontSize -= 1;
    [_recentDetailBody setFont:[UIFont fontWithName:@"OpenSans-Bold" size:_currentFontSize]];
    [self setTextFieldHeight:_bodyHeightConstraint forView:self.recentDetailBody];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self setTextFieldHeight:_bodyHeightConstraint forView:self.recentDetailBody];
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
    }];
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
