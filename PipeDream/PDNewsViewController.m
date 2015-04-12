//
//  PDNewsViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/8/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDNewsViewController.h"
#import "PDFeedTableViewCell.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "AppDelegate.h"



@interface PDNewsViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;



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



#pragma mark - TableView datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   
    
    PDFeedTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    if (cell==nil) {
        cell=[[PDFeedTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsCell"];
        
    }
    
    
    
    return cell;
    
}



#pragma mark -Menu Action Delegate





- (IBAction)showMenu:(UIBarButtonItem *)sender {
    
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
    

}


- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}


@end
