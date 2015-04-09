//
//  PDDrawerViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/7/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDDrawerViewController.h"
#import "PDNavigationController.h"

#define menuWidth 150.0

@interface PDDrawerViewController ()




//
//-(void)setupMenuView;
//-(void)showMenu:(BOOL)menu;
//-(void) menuAction:(id)sender;
@end



@implementation PDDrawerViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:(NSCoder *)aDecoder]) {
        [self setupMenuView];
        
        
    }
    return self;
    
}



- (void)viewDidLoad {
    

    [self setupMenuView];
    self.animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.isTapped=NO;
    
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//-(void)menuAction:(id)sender{
//    
//    if (self.isTapped==NO) {
//        [UIView animateWithDuration:1.0 animations:^{
//            self.menuButton.alpha=0;
//            [self showMenu:YES];
//            self.isTapped=YES;
//            
//        }];
//        
//    }
//    else if (self.isTapped==YES) {
//        [UIView animateWithDuration:1.0 animations:^{
//            self.menuButton.alpha=1.0;
//            [self showMenu:NO];
//            
//        }];
//        self.isTapped=NO;
//        
//    }
//
//}

-(void)setupMenuView{
    
    self.menuView=[[UIView alloc]initWithFrame:CGRectMake(-menuWidth, 177.0, menuWidth, 290.0)];
    self.menuView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.menuView];
    
    self.menuTableView=[[UITableView alloc]initWithFrame:self.menuView.bounds style:UITableViewStylePlain];
    
    self.menuTableView.backgroundColor=[UIColor clearColor];
    self.menuTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    self.menuTableView.scrollEnabled=NO;
    self.menuTableView.alpha=0.8;
    self.menuTableView.delegate=self;
    self.menuTableView.dataSource=self;
    
    [self.menuView addSubview:self.menuTableView];
    
    
}


-(void)showMenu:(BOOL)menu{
    
    [self.animator removeAllBehaviors];
    CGFloat gravityDirectionX= (menu) ? 0.3 : -1.0;
    CGFloat boundaryPointX=(menu) ? menuWidth:-menuWidth;
    CGFloat bounceAmount= (menu) ? .4 : .3;
    UIGravityBehavior *gravityBehaviour=[[UIGravityBehavior alloc]initWithItems:@[self.menuView]];
    gravityBehaviour.gravityDirection=CGVectorMake(gravityDirectionX, 0.0);
    [self.animator addBehavior:gravityBehaviour];
    UICollisionBehavior *collisionBehaviour=[[UICollisionBehavior alloc]initWithItems:@[self.menuView]];
    [collisionBehaviour addBoundaryWithIdentifier:@"menuBoundry" fromPoint:CGPointMake(boundaryPointX, 580.0) toPoint:CGPointMake(boundaryPointX, 0.0)];
    [self.animator addBehavior:collisionBehaviour];
    
    UIDynamicItemBehavior *itemBehaviour=[[UIDynamicItemBehavior alloc]initWithItems:@[self.menuView]];
    itemBehaviour.elasticity=bounceAmount;
    [self.animator addBehavior:itemBehaviour];
    
    
    
    
}



#pragma mark - UITableView Delegate and DataSource


#pragma mark - UITableView Delegate and DataSource

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
    cell.textLabel.textColor=[UIColor blackColor];
    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    
    return cell;
    
    
}

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

