//
//  AppDelegate.h
//  SideMenuAPP
//
//  Created by Naveen Kumar Dungarwal on 11/12/14.
//  Copyright (c) 2014 Naveen Kumar Dungarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SharedAppDelegate ((AppDelegate*)[[UIApplication sharedApplication] delegate])

@class IIViewDeckController;
@class Menu1ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) UIViewController *centerController;
@property (retain, nonatomic) UIViewController *leftController;
@property (strong,nonatomic)  NSIndexPath *selectedIndex;

- (IIViewDeckController*)generateControllerStack;

@end

