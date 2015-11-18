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
    
    UIButton *btn1 = [CreatButton creatButtonWithTitle:@"帮订餐" :CGRectMake(35, 70, 300, 50):@selector(btnPressed:) :self];
    [self.view addSubview:btn1];
    


    UIButton *btn2 = [CreatButton creatButtonWithTitle:@"看订单" :CGRectMake(35, 120,300, 50):@selector(btnPressed2:):self];
    
    [self.view addSubview:btn2];

    
    
    
//    UIButton *btn1 = [self creatButtonWithTitle:@"帮订餐" :CGRectMake(35, 70, 300, 50):@selector(btnPressed:)];

   
    
    
//    UIButton *btn2 = [self creatButtonWithTitle:@"看订单" :CGRectMake(35, 120,300, 50):@selector(btnPressed2:)];

    

    


}

//-(UIButton *)creatButtonWithTitle: (NSString *)title :(CGRect)frame :(SEL)buttonPressed
//{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button  setFrame: frame];
//    [button setTitle:title forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont systemFontOfSize:20];
//    button.backgroundColor = [UIColor whiteColor];
//    [button.layer setCornerRadius:10.0];
//    [button.layer setBorderWidth:0.5];
//    [button.layer setBorderColor:[UIColor grayColor].CGColor];
//    [button addTarget:self action:buttonPressed forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//    return button;
//}
//

//绿色标注的是实例方法




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
