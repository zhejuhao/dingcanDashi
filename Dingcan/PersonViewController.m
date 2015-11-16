//
//  PersonViewController.m
//  Dingcan
//
//  Created by 李旗 on 15/11/9.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "PersonViewController.h"
#import "HelpViewController.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *zhaoDa = [self create_button_with_title:@"赵大" :CGRectMake(35, 100, 300,50)];
    
    [self.view addSubview:zhaoDa];
    
    
    
    
    UIButton *qianEr = [self create_button_with_title:@"钱二" :CGRectMake(35, 150, 300,50)];
    
    [self.view addSubview:qianEr];
    
    
    UIButton *zhangSan = [self create_button_with_title:@"张三" :CGRectMake(35, 200, 300,50)];
    
    [self.view addSubview:zhangSan];
    
    
    UIButton *liSi = [self create_button_with_title:@"李四" :CGRectMake(35, 250, 300,50)];
    
    [self.view addSubview:liSi];
    
    
    UIButton *wangWu = [self create_button_with_title:@"王五" :CGRectMake(35, 300, 300,50)];
    
    [self.view addSubview:wangWu];
    
    
    UIButton *zhaoLiu = [self create_button_with_title:@"赵六" :CGRectMake(35, 350, 300,50)];
    
    [self.view addSubview:zhaoLiu];
    
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"zhaoda" object:nil];

}


-(void)btnPressedPersonName:(id)sender
{
    UIButton *button = (UIButton *)sender;
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"persRset" object:button.titleLabel.text userInfo:nil];
}



- (UIButton *)create_button_with_title : (NSString *)title :(CGRect)frame
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnPressedPersonName:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 10.0;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.borderWidth = 1.0;
    return button;

    
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
