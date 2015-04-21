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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

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
}

-(void)contentView{
    
    [self scrollViewDidChange:self.opinionScrollView];
    
    self.titleLabel.text = [self.contentArticle.articleTitle decodeHTML];
    self.articleBody.text = [self.contentArticle.articleBody decodeHTML];
    
    CGSize sizeThatShouldFitTheContent = [self.articleBody sizeThatFits:self.articleBody.frame.size];
    _heightConstraint.constant = sizeThatShouldFitTheContent.height;

    NSURL *imageURL=[NSURL URLWithString:self.contentAttachment.fullImage[@"url"]];
    [self.articleImage setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"Logo.png"]];

    
}

@end
