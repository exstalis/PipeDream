//
//  PDBaseTableViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/9/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDBaseTableViewController.h"

@interface PDBaseTableViewController ()

@end

@implementation PDBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    [_menuTableView setDelegate:self];
    [_menuTableView setDataSource:self];
    
    self.menuTableView=[[UITableView alloc]initWithFrame:self.menuView.bounds style:UITableViewStylePlain];
    
    _menuTableView.backgroundColor=[UIColor clearColor];
    _menuTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    _menuTableView.scrollEnabled=NO;
    _menuTableView.alpha=0.6;
    [_menuTableView setRowHeight:50.0];
    [_menuTableView setContentInset:UIEdgeInsetsMake(10.0, 0.0, 10.0, 0.0)];
    [_menuTableView setBounces:NO];
    [_menuTableView registerClass:[PDDrawerTableViewCell class] forCellReuseIdentifier:NSStringFromClass([PDDrawerTableViewCell class])];
    [_menuTableView setSeparatorInset:UIEdgeInsetsMake(0.0, 10.0, 0.0, 10.0)];
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, _menuTableView.frame.size.width, 45.0)];
    [self.menuTableView addSubview:headerView];
    [self.menuView addSubview:self.menuTableView];
//    image logosu koy buraya !!!!
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  }


-(void)drawerMenu:(PDDrawerViewController *)controller didSelectMenuItem:(PDDrawerMenuViewControllerItem)item{
    
    switch (item) {
        case PDDrawerMenuViewControllerItemNews:{
            NSLog(@"News pressed");
            [self performSegueWithIdentifier:@"news" sender:nil];
            break;
        }
        case PDDrawerMenuViewControllerItemOpinion:{
            NSLog(@"News pressed");
            [self performSegueWithIdentifier:@"opinion" sender:nil];
            break;
        }
        case PDDrawerMenuViewControllerItemRelease:{
            NSLog(@"News pressed");
            [self performSegueWithIdentifier:@"release" sender:nil];
            break;
        }
        case PDDrawerMenuViewControllerItemContact:{
            NSLog(@"News pressed");
            [self performSegueWithIdentifier:@"contact" sender:nil];
            break;
        }
         
            
        default:
            break;
    }
    
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
