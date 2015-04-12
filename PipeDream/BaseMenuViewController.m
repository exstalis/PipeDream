//
//  BaseMenuViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/11/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "BaseMenuViewController.h"

@interface BaseMenuViewController ()
@property(nonatomic,strong) UIButton *menuButton;
@property(nonatomic,strong) NSArray* menuItems;

@end

@implementation BaseMenuViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.menuItems=@[@"News", @"Opinion",@"Release",@"Sports",@"Contact us"];

    self.animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.isTapped=NO;
    self.menuTableView=[[UITableView alloc]initWithFrame:self.menuView.bounds style:UITableViewStylePlain];
    [self.menuTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_menuTableView setDelegate:self];
    [_menuTableView setDataSource:self];
    _menuTableView.backgroundColor=[UIColor clearColor];
    _menuTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    _menuTableView.scrollEnabled=NO;
    _menuTableView.alpha=0.6;
    [_menuTableView setRowHeight:50.0];
    [_menuTableView setContentInset:UIEdgeInsetsMake(10.0, 0.0, 10.0, 0.0)];
    [_menuTableView setBounces:NO];
    [_menuTableView registerClass:[PDDrawerMenuCell class] forCellReuseIdentifier:NSStringFromClass([PDDrawerMenuCell class])];
    [_menuTableView setSeparatorInset:UIEdgeInsetsMake(0.0, 10.0, 0.0, 10.0)];
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, _menuTableView.frame.size.width, 45.0)];
    [self.menuTableView addSubview:headerView];
    [self.menuView addSubview:self.menuTableView];
    //    image logosu koy buraya !!!!
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}






#pragma mark -  Drawer Tableview DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return PDMenuViewControllerItem_COUNT;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    static NSString *cellID=@"menuCell";
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PDDrawerMenuCell class])];
    
    
    NSString *menuText=self.menuItems[indexPath.row];
    
    cell.textLabel.text=menuText;
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    cell.accessoryType=UITableViewCellAccessoryNone;
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    
    
    
//    switch ((PDMenuViewControllerItem)indexPath.row) {
//        case PDMenuViewControllerItemNews:{
//            [cell.textLabel setText:@"News"];
//            //            put an image
//            break;
//        }
//            
//        case PDMenuViewControllerItemOpinion:{
//            [cell.textLabel setText:@"Opinion"];
//            //            put an image
//            break;
//        }
//        case PDMenuViewControllerItemRelease:{
//            [cell.textLabel setText:@"Release"];
//            //            put an image
//            break;
//        }
//            
//        case PDMenuViewControllerItemSports:{
//            [cell.textLabel setText:@"Sports"];
//            //            put an image
//            break;
//        }
//        case PDMenuViewControllerItemContact:{
//            [cell.textLabel setText:@"Contact"];
//            //            put an image
//            break;
//        }
//        case PDMenuViewControllerItemSettings:{
//            [cell.textLabel setText:@"Settings"];
//            //            put an image
//            break;
//        }
//        case PDMenuViewControllerItem_COUNT:
//        default:
//            break;
//    }
//    
    
    
    
    
    return cell;
    
    
}



#pragma mark - UITableView Delegate
//implement later for views

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
    
    
//    [self.delegate drawerMenu:self didSelectMenuItem:indexPath.row];
    
    switch ((PDMenuViewControllerItem)indexPath.row) {
        case PDMenuViewControllerItemNews:{
            NSLog(@"News pressed");
            [self performSegueWithIdentifier:@"news" sender:nil];
            break;
        }
        case PDMenuViewControllerItemOpinion:{
            NSLog(@"News pressed");
            [self performSegueWithIdentifier:@"opinion" sender:nil];
            break;
        }
        case PDMenuViewControllerItemRelease:{
            NSLog(@"News pressed");
            [self performSegueWithIdentifier:@"release" sender:nil];
            break;
        }
        case PDMenuViewControllerItemContact:{
            NSLog(@"News pressed");
            [self performSegueWithIdentifier:@"contact" sender:nil];
            break;
        }
            
            
        default:
            break;
    }
    
    
    
}

//-(void)showMenuBar:(UIBarButtonItem*)menuButton{
//    
//    [self.delegate menuAction:menuButton];
//    
//}
-(void)menuAction:(id)sender{
    
    if (self.isTapped==NO) {
        [UIView animateWithDuration:1.0 animations:^{
            self.menuButton.alpha=0;
            
            [self showMenu:YES];
            self.isTapped=YES;
            
        }];
        
    }
    else if (self.isTapped==YES) {
        [UIView animateWithDuration:1.0 animations:^{
            self.menuButton.alpha=1.0;
            
            [self showMenu:NO];
            
            
        }];
        self.isTapped=NO;
        
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


#pragma mark -drawer tableview delegate




@end
