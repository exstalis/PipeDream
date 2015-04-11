//
//  PDBaseViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 3/21/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDBaseViewController.h"
#define menuWidth 200.0

@interface PDBaseViewController ()



@property(nonatomic)UILabel *emptyViewLabel;
@property(nonatomic)UILabel *errorView;




@end

@implementation PDBaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    [self setupMenuView];
    
    self.animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.isTapped=NO;
//    [self.view setBackgroundColor:[UIColor clearColor]];
    
    // Do any additional setup after loading the view.
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -getters
-(UIView *)menuView{

    if (_menuView==nil) {
        [self setupMenuView];
        
    }
    return _menuView;
    

}


#pragma mark -Menu setup




-(void)setupMenuView{
    self.menuItems=@[@"News", @"Opinion",@"Release",@"Sports",@"Contact us"];

    _menuView=[[PDDrawerCustomCellBackground alloc]initWithFrame:CGRectMake(-menuWidth, 65.0, menuWidth, 400.0)];
    [_menuView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    _menuView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.menuView];
  
   
    
    
    
}


-(void)showMenu:(BOOL)menu{
    
    [self.animator removeAllBehaviors];
    CGFloat gravityDirectionX= (menu) ? 0.3 : -1.0;
    CGFloat boundaryPointX=(menu) ? menuWidth:- menuWidth;
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

-(NSString *)identifier{
    return NSStringFromClass(self.class);
    
}

@end
