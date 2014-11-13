//
//  Menu3ViewController.m
//  SideMenuAPP
//
//  Created by Naveen Kumar Dungarwal on 11/12/14.
//  Copyright (c) 2014 Naveen Kumar Dungarwal. All rights reserved.
//

#import "Menu3ViewController.h"
#import "IIViewDeckController.h"
#import "AppDelegate.h"

@interface Menu3ViewController ()

@end

@implementation Menu3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)nextMenuButtonPressed:(UIButton *)sender {
    [self showselectedMenuView:@"Menu4ViewController"];
}

-(void)showselectedMenuView:(NSString*)viewIdentifier
{

    self.viewDeckController.leftController = SharedAppDelegate.leftController;
    
    UIViewController* selectedController = [self.storyboard instantiateViewControllerWithIdentifier:viewIdentifier];
    [self.viewDeckController rightViewPushViewControllerOverCenterController:selectedController];

}
@end
