//
//  AppDelegate.m
//  PipeDream
//
//  Created by elif ece arslan on 3/21/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import <FBSDKShareKit/FBSDKShareKit.h>
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"


static NSString * const kPDDrawersStoryboardName = @"Main";

static NSString * const kPDLeftDrawerStoryboardID = @"PDDrawerViewControllerStoryboardID";
static NSString * const kPDNewsDrawerStoryboardID = @"PDNewsViewControllerStoryboardID";

static NSString * const kPDOpinionDrawerStoryboardID = @"PDOpinionViewControllerStoryboardID";
static NSString * const  kPDReleaseDrawerStoryboardID=@"PDReleaseViewControllerStoryboardID";
static NSString * const  kPDSportsDrawerStoryboardID=@"PDSportsViewControllerStoryboardID";

static NSString * const  kPDRecentDrawerStoryboardID=@"PDRecentViewControllerStoryboardID";

static NSString * const  kPDContactDrawerStoryboardID=@"PDContactViewControllerStoryboardID";

static NSString * const  kPDNewsDetailStoryboardID=@"PDNewsDetailStoryboardID";


@interface AppDelegate ()
@property (nonatomic, strong, readonly) UIStoryboard *myStoryboard;

@end

@implementation AppDelegate



#pragma storyboard
@synthesize myStoryboard=_myStoryboard;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = self.drawerViewController;
    [self configureDrawerViewController];
    
    [self.window makeKeyAndVisible];
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {
 
    [self saveContext];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  }



- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}






#pragma mark - Core Data stack



@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.exstalis.PipeDream" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"PipeDream" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"PipeDream.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


#pragma mark - Drawer View Controllers

- (JVFloatingDrawerViewController *)drawerViewController {
    if (_drawerViewController==nil) {
        _drawerViewController = [[JVFloatingDrawerViewController alloc] init];
    }
    
    return _drawerViewController;
}



- (UITableViewController *)leftDrawerViewController {
    if (_leftDrawerViewController==nil) {
        _leftDrawerViewController = [self.myStoryboard instantiateViewControllerWithIdentifier:kPDLeftDrawerStoryboardID];
    }
    
    return _leftDrawerViewController;
}

#pragma news

-(UIViewController *)newsViewController{
    
    if (_newsViewController==nil) {
        _newsViewController=[self.myStoryboard instantiateViewControllerWithIdentifier:kPDNewsDrawerStoryboardID];
        
        
    }
    return _newsViewController;
    
    
}

//#pragma newsdetail
//-(PDNewsDetailViewController *)newsDetailViewController{
//    
//    
//    if (_newsDetailViewController==nil) {
//        _newsDetailViewController=[self.myStoryboard instantiateViewControllerWithIdentifier:kPDNewsDetailStoryboardID];
//        
//    }
//    return _newsDetailViewController;
//    
//}

#pragma opinion

-(UIViewController *)opinionViewController{
    
    
    if (_opinionViewController==nil) {
        _opinionViewController=[self.myStoryboard instantiateViewControllerWithIdentifier:kPDOpinionDrawerStoryboardID];
        
    }
    return _opinionViewController;
    
}

#pragma release

-(UIViewController *)releaseViewController{


    if (_releaseViewController==nil) {
        _releaseViewController=[self.myStoryboard instantiateViewControllerWithIdentifier:kPDReleaseDrawerStoryboardID];
        
    }
    return _releaseViewController;
    



}
#pragma sports


-(UIViewController *)sportsViewController{
    
    if (_sportsViewController==nil) {
        _sportsViewController=[self.myStoryboard instantiateViewControllerWithIdentifier:kPDSportsDrawerStoryboardID];
        
    }
    return _sportsViewController;
    
    
    
}





#pragma recent


-(UIViewController *)recentViewController{
    
    if (_recentViewController==nil) {
        _recentViewController=[self.myStoryboard instantiateViewControllerWithIdentifier:kPDRecentDrawerStoryboardID];
        
    }
    return _recentViewController;
    
}


#pragma contact


-(UIViewController *)contactViewController{
    
    if (_contactViewController==nil) {
        _contactViewController=[self.myStoryboard instantiateViewControllerWithIdentifier:kPDContactDrawerStoryboardID];
        
    }
    return _contactViewController;
    
}


#pragma drawer animation


- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    if (_drawerAnimator==nil) {
        _drawerAnimator = [[JVFloatingDrawerSpringAnimator alloc] init];
    }
    
    return _drawerAnimator;
}

#pragma storyboard

- (UIStoryboard *)myStoryboard {
    
    if(_myStoryboard==nil) {
        _myStoryboard = [UIStoryboard storyboardWithName:kPDDrawersStoryboardName bundle:nil];
    }
    
    return _myStoryboard;
}




- (void)configureDrawerViewController {
    self.drawerViewController.leftViewController = self.leftDrawerViewController;
    self.drawerViewController.centerViewController = self.recentViewController;
    self.drawerViewController.animator = self.drawerAnimator;
    self.drawerViewController.backgroundImage = [UIImage imageNamed:@"MenuBar"];
}



#pragma mark - Global Access Helper

+ (AppDelegate *)globalDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated {
    [self.drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideLeft animated:animated completion:nil];
}


@end
