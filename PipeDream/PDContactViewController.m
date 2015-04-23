//
//  PDContactViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/23/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDContactViewController.h"

@interface PDContactViewController ()
@property (nonatomic, strong) CLGeocoder *geocoderForPDOffice;
@property (nonatomic, strong) MKPlacemark *placemarkPDOffice;

@end

@implementation PDContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.geocoderForPDOffice = [[CLGeocoder alloc] init];
    _pipeDreamOfficeMapView.showsUserLocation=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  }


#pragma mark - MenuBar

- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}

- (IBAction)navigateThroughMenu:(id)sender {

    
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
    
}
@end
