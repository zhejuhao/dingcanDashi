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


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(35, 70, 300, 50);
    [btn1 setTitle:@"帮订餐" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize: 20.0];
    //设置按钮字体大小
    [btn1 addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor = [UIColor whiteColor];
    [btn1.layer setCornerRadius:10.0];
    [btn1.layer setBorderWidth:0.5];
    [btn1.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.view addSubview:btn1];

    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame =CGRectMake(35, 120,300, 50);
    [btn2 setTitle:@"看订单" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize: 20.0];
    [btn2 addTarget:self action:@selector(btnPressed2:) forControlEvents:UIControlEventTouchUpInside];
    btn2.backgroundColor = [UIColor whiteColor];
    [btn2.layer setCornerRadius:10.0];
    [btn2.layer setBorderWidth:0.5];
    [btn2.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.view addSubview:btn2];
    

//    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)btnPressed:(id)sender
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
