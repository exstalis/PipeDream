//
//  PDContentViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/27/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDContentViewController.h"
#import "Article.h"

@interface PDContentViewController ()

@end

@implementation PDContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;

//    PDSingleton *sharedContent=[[PDSingleton alloc]initWithArticle:self.contentArticle];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)scrollViewDidChange:(UIScrollView *)scrollView{
    scrollView.translatesAutoresizingMaskIntoConstraints=NO;
    CGFloat fixedWidth = scrollView.frame.size.width;
    CGSize newSize = [scrollView sizeThatFits:CGSizeMake(fixedWidth, CGFLOAT_MAX*3)];
    CGRect newFrame = scrollView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    scrollView.frame = newFrame;
    
}



- (void)textViewDidChange:(UITextView *)textView
{
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, CGFLOAT_MAX*3)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    textView.frame = newFrame;
}


@end
