//
//  AppDelegate.m
//  SideMenuAPP
//
//  Created by Naveen Kumar Dungarwal on 11/12/14.
//  Copyright (c) 2014 Naveen Kumar Dungarwal. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "IIViewDeckController.h"
#import "MenuViewController.h"
#import "LoginViewController.h"
#import "CustomOrientationNavigationController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize centerController = _viewController;
@synthesize leftController = _leftController;
@synthesize selectedIndex;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.selectedIndex = [NSIndexPath indexPathForRow:0 inSection:0];
    IIViewDeckController* deckController = [self generateControllerStack];
    self.leftController = deckController.leftController;
    self.centerController = deckController.centerController;
    
    self.window.rootViewController = deckController;
    [self.window makeKeyAndVisible];
    

    //Check Login or not
    NSUserDefaults *defualt = [NSUserDefaults standardUserDefaults];
    BOOL isLoggedIn = [defualt boolForKey:@"LOGIN_USER"];
    
    if(!isLoggedIn)
    {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        [defualt setBool:YES forKey:@"LOGIN_USER"];
        LoginViewController *loginView = [mainStoryboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        
        UINavigationController *navBar=[[CustomOrientationNavigationController alloc] initWithRootViewController:loginView withSupportedOrientations:(UIInterfaceOrientationMaskPortrait)];
        
        [self.centerController presentViewController:navBar animated:YES completion:nil];
        
    }

    return YES;
}

- (IIViewDeckController*)generateControllerStack {
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MenuViewController* menuController = [mainStoryboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    
    
    UIViewController *centerController = [mainStoryboard instantiateViewControllerWithIdentifier:@"Menu1ViewController"];
    
    centerController = [[UINavigationController alloc] initWithRootViewController:centerController];
    
    IIViewDeckController* deckController =  [[IIViewDeckController alloc] initWithCenterViewController:centerController
                                                                                    leftViewController:menuController
                                                                                   rightViewController:nil];
    deckController.leftSize =60;
    deckController.shadowEnabled = false;
    
    [deckController disablePanOverViewsOfClass:NSClassFromString(@"_UITableViewHeaderFooterContentView")];
    return deckController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
