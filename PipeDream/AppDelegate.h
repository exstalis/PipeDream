//
//  AppDelegate.h
//  PipeDream
//
//  Created by elif ece arslan on 3/21/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@class JVFloatingDrawerViewController;
@class JVFloatingDrawerSpringAnimator;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) JVFloatingDrawerViewController *drawerViewController;
@property (nonatomic, strong) JVFloatingDrawerSpringAnimator *drawerAnimator;

@property (nonatomic, strong) UITableViewController *leftDrawerViewController;
@property (nonatomic, strong) UIViewController *newsViewController;
@property (nonatomic, strong) UIViewController *opinionViewController;
@property (nonatomic, strong) UIViewController *releaseViewController;
@property(nonatomic,strong)UIViewController *sportsViewController;
@property(nonatomic,strong)UIViewController *contactViewController;
@property(nonatomic,strong)UIViewController *recentViewController;



+ (AppDelegate *)globalDelegate;


- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

