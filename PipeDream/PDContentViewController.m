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

    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
