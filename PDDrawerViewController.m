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
    
    return  self.menuItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    //buraya enumda tanimladigin itemleri switch case'e koyarak yaz. ve resim, sekil eklemeleri yap.
    
    NSString *menuOptionText=self.menuItems[indexPath.row];
    cell.textLabel.text=menuOptionText;
    cell.accessoryType=UITableViewCellAccessoryNone;
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    
    return cell;
    
    
}

#pragma mark - UITableView Delegate
//implement later for views

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
    //    NSString *menuText=self.menuItems[indexPath.row];
    if (indexPath.row == 0) {
        
        [self showMenu:NO];
        NSLog(@"news");
        [UIView animateWithDuration:1 animations:^{
            self.menuButton.alpha=1.0;
            
            
        }];
        
    }
    else if (indexPath.row == 1) {
        NSLog(@"opinion");
        [self performSegueWithIdentifier:@"opinion" sender:nil];
        
        
        
    }
    else if (indexPath.row == 2) {
        NSLog(@"release");
        [self performSegueWithIdentifier:@"release" sender:nil];
        
    }
    else if (indexPath.row ==3){
        [self performSegueWithIdentifier:@"sports" sender:nil];
        
    }
    else if (indexPath.row ==4){
        [self performSegueWithIdentifier:@"contact" sender:nil];
    }
}


@end

