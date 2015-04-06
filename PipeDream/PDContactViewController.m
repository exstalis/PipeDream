//
//  PDContactViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/23/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDContactViewController.h"

#import "PDFeedTableViewController.h"
#import <CoreLocation/CoreLocation.h>

static NSString * const kPDTwitterAppURL=@"twitter://user?screen_name=bupipedream";
static NSString * const kPDTwitterBrowserURL=@"https://twitter.com/bupipedream/";
static NSString * const kPDFacebookAppURL = @"fb://profile/bupipedream";
static NSString * const kPDFacebookBrowserURL = @"https://www.facebook.com/BUPipeDream";
static NSString * const kPDInstagramAppURL = @"instagram://user?username=bupipedream";
static NSString * const kPDInstagramBrowserURL = @"https://instagram.com/bupipedream";



@interface PDContactViewController ()<CLLocationManagerDelegate,MKMapViewDelegate,MKAnnotation>

@property (nonatomic, strong) CLGeocoder *geocoderForPDOffice;
@property (nonatomic, strong) MKPlacemark *placemarkPDOffice;
@property (nonatomic, strong, readonly) CLLocationManager *pipeDreamLocationManager;

@property (weak, nonatomic) IBOutlet UIButton *faceBookLikeButton;

@property (weak, nonatomic) IBOutlet UIButton *twitterLikeButton;
@property (weak, nonatomic) IBOutlet UIButton *instagramLikeButton;
@property (nonatomic, copy, readonly) NSString *locationTitle;
@property (nonatomic, copy, readonly) NSString *locationSubtitle;


@end

@implementation PDContactViewController
{
    
    FBSDKLikeButton *_fbLikeButton;
    PDFeedTableViewController *_notify;
    CLLocationCoordinate2D _pipdreamOfficeLocation;
    
    
    
    CLLocationManager *_pipeDreamLocationManager;
    
    
    
}




-(CLLocationManager *)pipeDreamLocationManager{
    
    
    if (!_pipeDreamLocationManager) {
        _pipeDreamLocationManager = [[CLLocationManager alloc] init];
        _pipeDreamLocationManager.delegate = self;
        _pipeDreamLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        // We don't want to be notified of small changes in location, preferring to use our
        // last cached results, if any.
        _pipeDreamLocationManager.distanceFilter = 50;
    }
    return _pipeDreamLocationManager;
}


- (instancetype) initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates title:(NSString *)paramTitle
                            subTitle:(NSString *)paramSubTitle{
    self = [super init];
    if (self != nil){
        _pipdreamOfficeLocation = paramCoordinates; _locationTitle = paramTitle;
        _locationSubtitle = paramSubTitle;
    }
    return self; }



-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];

    
    [self.pipeDreamLocationManager startUpdatingLocation];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.pipeDreamOfficeMapView=MKMapTypeStandard;
    self.pipeDreamOfficeMapView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    
    self.geocoderForPDOffice = [[CLGeocoder alloc] init];
//    _pipdreamOfficeLocation = CLLocationCoordinate2DMake(48.857875, 2.294635);
    
//    if ([CLLocationManager locationServicesEnabled]){ self.myLocationManager = [[CLLocationManager alloc] init]; self.myLocationManager.delegate = self;
//        [self.myLocationManager startUpdatingLocation]; }else{
//            /* Location services are not enabled.
//             Take appropriate action: for instance, prompt the
//             user to enable the location services */
//            NSLog(@"Location services are not enabled");
//        }
//    _pipeDreamOfficeMapView.showsUserLocation=YES;
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





-(void)facebookLikeControl{
    
    _fbLikeButton=[[FBSDKLikeButton alloc]init];
    _fbLikeButton.objectType=FBSDKLikeObjectTypePage;
    
    _fbLikeButton.backgroundColor=[UIColor clearColor];
    
    _fbLikeControl.likeControlStyle=FBSDKLikeControlStyleStandard;
    _fbLikeControl.likeControlHorizontalAlignment = FBSDKLikeControlHorizontalAlignmentCenter;;
    _fbLikeControl.objectID=kPDFacebookBrowserURL;
    
    
    
    
}

- (IBAction)likeUsOnFacebook:(id)sender {
    
    [self facebookLikeControl];
    
  
    
    
}

- (IBAction)followUsOnInstagram:(id)sender {

    if(![[UIApplication sharedApplication] openURL:[NSURL URLWithString:kPDInstagramAppURL]]) {
        if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:kPDInstagramBrowserURL]]) {
            NSLog(@"Nothing works");
        }
    }
    

}




- (IBAction)followUsOnTwitter:(id)sender {
    
    
    if (![[UIApplication sharedApplication]openURL:[NSURL URLWithString:kPDTwitterAppURL]]) {
        
        if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:kPDTwitterBrowserURL]]) {
//            buraya bir alert pop upi dusur, ulasamadigini anlat!
            
            NSLog(@"Nothing works.");
        }

        
    }
    

    
}

#pragma location manager




@end
