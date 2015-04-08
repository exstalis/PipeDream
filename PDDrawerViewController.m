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



@property(strong,nonatomic) NSMutableArray *imageArray;

@property (weak, nonatomic)UIBarButtonItem *menuLeftBarButtonItem;
@property(nonatomic,strong)UIView *menuView;
@property(nonatomic,strong)UIDynamicAnimator *animator;
@property(nonatomic,strong)UITableView *menuTableView;
@property(nonatomic,strong) UIButton *menuButton;
@property(nonatomic,strong) NSArray* menuItems;

@property(nonatomic) BOOL isTapped ;

-(void)setupMenuView;
-(void)showMenu:(BOOL)menu;
-(void) menuButtonPressed:(id)sender;
@end



@implementation PDDrawerViewController

- (void)viewDidLoad {
    
    self.menuItems=@[@"News", @"Opinion",@"Release",@"Sports",@"Contact us"];
    self.animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    [self setupMenuView];
    
    self.isTapped=NO;
    
    
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)menuButtonPressed:(id)sender{

    if(self.isTapped==NO){
    
    [UIView animateWithDuration:1.0 animations:^{
        self.menuButton.alpha=1.0;
        [self showMenu:NO];
    }];
        self.isTapped=NO;
        
    }

}

-(void)setupMenuView{
    self.menuView=[[UIView alloc]initWithFrame:CGRectMake(-menuWidth, 150.0, menuWidth, 290.0)];
    
    self.menuView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.menuView];
    self.menuTableView.backgroundColor=[UIColor clearColor];
    
    self.menuTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    self.menuTableView.scrollEnabled=NO;
    self.menuTableView.alpha=0.7;
    self.menuTableView.delegate=self;
    self.menuTableView.dataSource=self;
    [self.menuView addSubview:self.menuTableView];
    
    
}


-(void)showMenu:(BOOL)menu{
    
    [self.animator removeAllBehaviors];
    CGFloat gravityDirectionX=(menu)?0.3:-1.0;
    CGFloat boundaryPointX=(menu)?menuWidth:-menuWidth;
    CGFloat bounceAmount=(menu)? .4:3;
    UIGravityBehavior *gravityBehaviour=[[UIGravityBehavior alloc]initWithItems:@[self.menuView]];
    gravityBehaviour.gravityDirection=CGVectorMake(gravityDirectionX, 0.0);
    [self.animator addBehavior:gravityBehaviour];
    UICollisionBehavior *collisionBehaviour=[[UICollisionBehavior alloc]initWithItems:@[self.menuView]];
    [collisionBehaviour addBoundaryWithIdentifier:@"menuBoundry" fromPoint:CGPointMake(boundaryPointX,580.0 )toPoint:CGPointMake(boundaryPointX,0.0)];
    [self.animator addBehavior:collisionBehaviour];
    UIDynamicItemBehavior *itemBehaviour=[[UIDynamicItemBehavior alloc]initWithItems:@[self.menuView]];
    itemBehaviour.elasticity=bounceAmount;
    [self.animator addBehavior:itemBehaviour];
    
    
    
    
}



#pragma mark - UITableView Delegate and DataSource


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.menuItems.count;
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"menuCell"];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"menuCell"];
    }
    
//    buraya enumlaldigin itemleri switch case ile cektir. ve resim , sekil eklemeleri yap.
    
    NSString *menuOptionText=self.menuItems[indexPath.row];
    cell.textLabel.text=menuOptionText;
    cell.accessoryType=UITableViewCellAccessoryNone;
    cell.backgroundColor=[UIColor whiteColor];
//    bunlari sonradan oyna tasarimi degistir.
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    return  cell;
    
    
    
}


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

