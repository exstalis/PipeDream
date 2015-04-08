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



- (IBAction)menuButtonPressed:(id)sender {
    
    [self menuAction:sender];
    

    
}
@end
