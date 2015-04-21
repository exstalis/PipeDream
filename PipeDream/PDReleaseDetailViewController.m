//
//  PDReleaseDetailViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/12/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDReleaseDetailViewController.h"

@interface PDReleaseDetailViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@end

@implementation PDReleaseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self contentView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:YES];
    
    
    

    
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.releaseDetailArticleArray= [[NSMutableArray alloc] init];
        self.releaseDetailAttachments=[[NSMutableArray alloc]init];
    
    }
    return self;
}

//buradaki scrollari superclass'a yolla inherit et, method yaz... boyle olmaz :/


-(void)contentView{
    
    [self scrollViewDidChange:self.releaseScrollView];
    
    self.releaseTitle.text = [self.contentArticle.articleTitle decodeHTML];
    self.releaseArticle.text = [self.contentArticle.articleBody decodeHTML];
    
    CGSize sizeThatShouldFitTheContent = [self.releaseArticle sizeThatFits:self.releaseArticle.frame.size];
    
    _heightConstraint.constant = sizeThatShouldFitTheContent.height;
    
    NSURL *imageURL=[NSURL URLWithString:self.contentAttachment.fullImage[@"url"]];

    [self.releaseImage setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"Logo.png"]];
    
    
}


@end
