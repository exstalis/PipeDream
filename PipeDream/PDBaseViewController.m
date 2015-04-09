//
//  PDBaseViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 3/21/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDBaseViewController.h"

@interface PDBaseViewController ()



@property(nonatomic)UILabel *emptyViewLabel;
@property(nonatomic)UILabel *errorView;



-(void)loadContentView;


@end

@implementation PDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuItems=@[@"News", @"Opinion",@"Release",@"Sports",@"Contact us"];
//    [self.view setBackgroundColor:[UIColor clearColor]];
    
    // Do any additional setup after loading the view.
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark -getters
//-(UIView *)contentView{
//
//    if (_contentView==nil) {
//        [self loadContentView];
//        
//    }
//    return _contentView;
//    
//    
//}
//
//-(void)loadContentView{
//    _contentView=[[UIView alloc]initWithFrame:self.view.frame];
//    [_contentView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
//    [_contentView setBackgroundColor:[UIColor clearColor]];
//    [self.view addSubview:_contentView];
//    
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
