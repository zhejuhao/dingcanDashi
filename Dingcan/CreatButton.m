//
//  CreatButton.m
//  Dingcan
//
//  Created by 李旗 on 15/11/18.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "CreatButton.h"

@implementation CreatButton

+(UIButton *)creatButtonWithTitle: (NSString *)title :(CGRect)frame :(SEL)buttonPressed :(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button  setFrame: frame];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    button.backgroundColor = [UIColor whiteColor];
    [button.layer setCornerRadius:10.0];
    [button.layer setBorderWidth:0.5];
    [button.layer setBorderColor:[UIColor grayColor].CGColor];
    [button addTarget:target action:buttonPressed forControlEvents:UIControlEventTouchUpInside];

    return button;
}


@end
