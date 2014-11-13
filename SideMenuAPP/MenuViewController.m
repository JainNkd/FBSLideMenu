//
//  MenuViewController.m
//  SideMenuAPP
//
//  Created by Naveen Kumar Dungarwal on 11/12/14.
//  Copyright (c) 2014 Naveen Kumar Dungarwal. All rights reserved.
//

#import "MenuViewController.h"
#import "Menu1ViewController.h"
#import "Menu2ViewController.h"
#import "Menu3ViewController.h"
#import "LoginViewController.h"

#import "AppDelegate.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize menuTableViewObj;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     [self.menuTableViewObj selectRowAtIndexPath:SharedAppDelegate.selectedIndex animated:NO scrollPosition:UITableViewScrollPositionNone];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CELL_IDENTIFIER = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_IDENTIFIER];
    }
    
    if(indexPath.row!=3)
    cell.textLabel.text = [NSString stringWithFormat:@"Menu %ld",indexPath.row+1];
    else
    cell.textLabel.text = [NSString stringWithFormat:@"Log Out"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SharedAppDelegate.selectedIndex = indexPath;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.row == 0)
    {
        [self showselectedMenuView:@"Menu1ViewController"];
    }
    else if (indexPath.row == 1)
    {
        [self showselectedMenuView:@"Menu2ViewController"];
    }
    else if (indexPath.row == 2)
    {
        [self showselectedMenuView:@"Menu3ViewController"];
    }
    else if(indexPath.row == 3)
    {
        NSUserDefaults *defualt = [NSUserDefaults standardUserDefaults];
        [defualt setBool:NO forKey:@"LOGIN_USER"];
        LoginViewController *loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.viewDeckController presentViewController:loginView animated:YES completion:nil];
    }
}

-(void)showselectedMenuView:(NSString*)viewIdentifier
{
         self.viewDeckController.leftController = SharedAppDelegate.leftController;
         
         UIViewController* selectedController = [self.storyboard instantiateViewControllerWithIdentifier:viewIdentifier];
         UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:selectedController];
         
         self.viewDeckController.centerController = navController;
        [self.viewDeckController closeLeftViewAnimated:YES];
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
