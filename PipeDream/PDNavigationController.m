//
//  PDNavigationController.m
//  PipeDream
//
//  Created by elif ece arslan on 3/21/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDNavigationController.h"

@interface PDNavigationController ()

@end

@implementation PDNavigationController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.backgroundView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    [self.backgroundView setContentMode:UIViewContentModeTop];
//    [self.backgroundView setImage:[UIImage imageNamed:@"BG.png"]];
    
    [self.view insertSubview:self.backgroundView atIndex:0];
    
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
    
}

-(NSUInteger)supportedInterfaceOrientations{
    return [self.topViewController supportedInterfaceOrientations];
    
}


@end
