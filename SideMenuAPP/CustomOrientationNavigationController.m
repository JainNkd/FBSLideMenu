//
//  CustomOrientationNavigationController.m
//  SideMenuAPP
//
//  Created by Naveen Kumar Dungarwal on 11/13/14.
//  Copyright (c) 2014 Naveen Kumar Dungarwal. All rights reserved.
//

#import "CustomOrientationNavigationController.h"

@interface CustomOrientationNavigationController ()

@end

@implementation CustomOrientationNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(id)initWithSupportedOrientations:(UIInterfaceOrientationMask)supportedOrientations {
    self = [super init];
    
    if (self) {
        self.supportedOrientations = supportedOrientations;
    }
    
    return self;
}

-(id)initWithRootViewController:(UIViewController *)rootViewController
      withSupportedOrientations:(UIInterfaceOrientationMask)supportedOrientations {
    self = [super initWithRootViewController:rootViewController];
    
    if (self) {
        self.supportedOrientations = supportedOrientations;
    }
    
    return self;
}


-(NSUInteger)supportedInterfaceOrientations {
    return self.supportedOrientations;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
