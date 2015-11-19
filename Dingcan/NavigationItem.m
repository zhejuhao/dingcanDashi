//
//  NavigationItem.m
//  Dingcan
//
//  Created by 李旗 on 15/11/19.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "NavigationItem.h"

@implementation NavigationItem

+(UILabel *)creat_item_label :(NSString *)title :(CGRect)frame
{
    UILabel *item = [[UILabel alloc]initWithFrame:frame];
    item.textColor = [UIColor whiteColor];
    item.textAlignment = UITextAlignmentCenter;
    item.text = title;
    item.font = [UIFont boldSystemFontOfSize:20];
    return item;
}


@end
