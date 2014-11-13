//
//  CustomOrientationNavigationController.h
//  SideMenuAPP
//
//  Created by Naveen Kumar Dungarwal on 11/13/14.
//  Copyright (c) 2014 Naveen Kumar Dungarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomOrientationNavigationController : UINavigationController

@property (nonatomic) UIInterfaceOrientationMask supportedOrientations;


// supportedOrientations - orientations supported by this controller
-(id)initWithSupportedOrientations:(UIInterfaceOrientationMask)supportedOrientations;

// supportedOrientations - orientations supported by this controller
-(id)initWithRootViewController:(UIViewController *)rootViewController
      withSupportedOrientations:(UIInterfaceOrientationMask)supportedOrientations;

@end
