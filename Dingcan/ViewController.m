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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn_help = [CreatButton creatButtonWithTitle:@"帮订餐" :CGRectMake(35, 70, 300, 50):@selector(btnPressed1:) :self];
    [self.view addSubview:btn_help];
    


    UIButton *btn_look = [CreatButton creatButtonWithTitle:@"看订单" :CGRectMake(35, 120,300, 50):@selector(btnPressed2:):self];
    
    [self.view addSubview:btn_look];

    
    
  
    


}





-(void)btnPressed1:(id)sender
{
    HelpViewController *helpView = [[HelpViewController alloc]init];
    [self.navigationController pushViewController:helpView animated:YES];
    
    
}
-(void)btnPressed2:(id)sender
{
    LookTableViewController *lookView = [[LookTableViewController alloc]init];
    [self.navigationController pushViewController:lookView animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
