//
//  PDNewsViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/8/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDNewsViewController.h"



@interface PDNewsViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuLeftBarButtonItem;
- (IBAction)menuButtonPressed:(id)sender;
@property (nonatomic) BOOL isTapped;
@property(nonatomic) UIButton *menuButton;
@property(nonatomic)   PDDrawerViewController *drawer;

@end



@implementation PDNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)menuAction:(id)sender{
//    
    self.drawer=[[PDDrawerViewController alloc]init];
    [self.drawer setDelegate:self];
    
    if (self.isTapped==NO) {
        [UIView animateWithDuration:1.0 animations:^{
            self.menuButton.alpha=0;
            
            [self.drawer showMenu:YES];
            self.isTapped=YES;
            
        }];
        
    }
    else if (self.isTapped==YES) {
        [UIView animateWithDuration:1.0 animations:^{
            self.menuButton.alpha=1.0;
            [self.drawer showMenu:NO];
            
        }];
        self.isTapped=NO;
        
    }
    
}

- (IBAction)menuButtonPressed:(id)sender {
 

    [self menuAction:sender];

}
@end
