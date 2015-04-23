//
//  PDContactViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/23/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "AppDelegate.h"
#import <MapKit/MapKit.h>


@interface PDContactViewController : UIViewController<MKMapViewDelegate>
@property (nonatomic, copy, readwrite) NSURL *URL;


@property (weak, nonatomic) IBOutlet MKMapView *pipeDreamOfficeMapView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButton;
- (IBAction)navigateThroughMenu:(id)sender;

- (IBAction)likeUsOnFacebook:(id)sender;

- (IBAction)followUsOnInstagram:(id)sender;


- (IBAction)followUsOnTwitter:(id)sender;


@end
