//
//  PDContactViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/23/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDContactViewController.h"

#import "PDFeedTableViewController.h"


static NSString * const kPDTwitterAppURL=@"twitter://user?screen_name=bupipedream";
static NSString * const kPDTwitterBrowserURL=@"https://twitter.com/bupipedream/";
static NSString * const kPDFacebookAppURL = @"fb://profile/bupipedream";
static NSString * const kPDFacebookBrowserURL = @"https://www.facebook.com/BUPipeDream";
static NSString * const kPDInstagramAppURL = @"instagram://user?username=bupipedream";
static NSString * const kPDInstagramBrowserURL = @"https://instagram.com/bupipedream";



@interface PDContactViewController (){
    
FBSDKLikeButton *_fbLikeButton;
PDFeedTableViewController *_notify;
    
    
}

@property (nonatomic, strong) CLGeocoder *geocoderForPDOffice;
@property (nonatomic, strong) MKPlacemark *placemarkPDOffice;

@property (weak, nonatomic) IBOutlet UIButton *faceBookLikeButton;

@property (weak, nonatomic) IBOutlet UIButton *twitterLikeButton;
@property (weak, nonatomic) IBOutlet UIButton *instagramLikeButton;



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





@end
