//
//  ViewController.m
//  Dingcan
//
//  Created by 李旗 on 15/11/9.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "ViewController.h"
#import "HelpViewController.h"
#import "LookTableViewController.h"
#import "CreatButton.h"
#import "NavigationItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [CreatButton creatButtonWithTitle:@"帮订餐" :CGRectMake(35, 70, 300, 50):@selector(btnPressed1:) :self];

     [CreatButton creatButtonWithTitle:@"看订单" :CGRectMake(35, 120,300, 50):@selector(btnPressed2:):self];

    UILabel *label_dingCan = [NavigationItem creat_item_label:@"订餐" :CGRectMake(0,0,200,50)];
    [self.navigationController.navigationBar setFrame:CGRectMake(0, 40, 320, 50)];
    self.navigationItem.titleView = label_dingCan;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

}





-(void)btnPressed1:(id)sender
{
    HelpViewController *helpView = [[HelpViewController alloc]init];
    [self.navigationController pushViewController:helpView animated:YES];
    
    
}
-(void)btnPressed2:(id)sender
{
    LookTableViewController *lookView = [[LookTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:lookView animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
