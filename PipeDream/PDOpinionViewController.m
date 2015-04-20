//
//  PDOpinionViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/11/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDOpinionViewController.h"
#import "PDFeedTableViewCell.h"
#import "AppDelegate.h"

#import "PDOpinionTableViewCell.h"

@interface PDOpinionViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
- (IBAction)showMenu:(UIBarButtonItem *)sender;

@end





@implementation PDOpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)showMenu:(UIBarButtonItem *)sender {
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
    
    
}


- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}


#pragma mark - TableView datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    PDOpinionTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"opinionCell" forIndexPath:indexPath];
    
    if (cell==nil) {
        cell=[[PDOpinionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"opinionCell"];
        
    }
//    [cell.opinionAuthorLabel setText:@"author"];
    
    
    
    
    return cell;
    
}


@end
