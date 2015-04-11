//
//  PDDrawerViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/7/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDDrawerViewController.h"
#import "PDNavigationController.h"


@interface PDDrawerViewController ()

@end



@implementation PDDrawerViewController




- (void)viewDidLoad {
    
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





#pragma mark -  DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return PDDrawerMenuViewControllerItem_COUNT;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    [self.delegate drawerMenu:self cellForMenuItem:indexPath.row];
    
    
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PDDrawerTableViewCell class])];
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    
    cell.accessoryType=UITableViewCellAccessoryNone;
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    
    
    
    switch ((PDDrawerMenuViewControllerItem)indexPath.row) {
        case PDDrawerMenuViewControllerItemNews:{
            [cell.textLabel setText:@"News"];
//            put an image
            break;
        }
       
        case PDDrawerMenuViewControllerItemOpinion:{
            [cell.textLabel setText:@"Opinion"];
            //            put an image
            break;
        }
        case PDDrawerMenuViewControllerItemRelease:{
            [cell.textLabel setText:@"Release"];
            //            put an image
            break;
        }

        case PDDrawerMenuViewControllerItemSports:{
            [cell.textLabel setText:@"Sports"];
            //            put an image
            break;
        }
        case PDDrawerMenuViewControllerItemContact:{
            [cell.textLabel setText:@"Contact"];
            //            put an image
            break;
        }
        case PDDrawerMenuViewControllerItemSettings:{
            [cell.textLabel setText:@"Settings"];
            //            put an image
            break;
        }
        case PDDrawerMenuViewControllerItem_COUNT:
        default:
            return nil;
    }
    
    


    
    return cell;
    
    
}

#pragma mark - UITableView Delegate
//implement later for views

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
    
    [self.delegate drawerMenu:self didSelectMenuItem:indexPath.row];
    

}


@end

