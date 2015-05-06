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



@interface PDOpinionDetailViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barBackButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bodyHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleHeightConstraint;

@end

@implementation PDOpinionDetailViewController

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
    
    [self scrollViewDidChange:self.opinionScrollView];
    
    self.titleLabel.text = [self.contentArticle.articleTitle decodeHTML];
    [self setTextFieldHeight:_titleHeightConstraint forView:self.titleLabel];
    
    self.articleBody.text = [self.contentArticle.articleBody decodeHTML];
    [self setTextFieldHeight:_bodyHeightConstraint forView:self.articleBody];
    
    self.authorLabel.text = self.contentArticle.authorName;
    

    NSURL *imageURL=[NSURL URLWithString:self.contentAttachment.fullImage[@"url"]];
    [self.articleImage setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"Logo.png"]];

    
}

-(void)setTextFieldHeight:(NSLayoutConstraint *)constraint forView:(UITextView *)textView {
    CGSize sizeThatShouldFitTheContent = [textView sizeThatFits:textView.frame.size];
    
    constraint.constant = sizeThatShouldFitTheContent.height;
    
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self setTextFieldHeight:_bodyHeightConstraint forView:self.articleBody];
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
    }];
}

@end
