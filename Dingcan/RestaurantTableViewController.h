//
//  RestaurantTableViewController.h
//  Dingcan
//
//  Created by 李旗 on 15/11/9.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantTableViewController : UITableViewController
@property(nonatomic,retain)NSArray *restaurantList;
- (id)initWithStyle:(UITableViewStyle)style :(NSArray *)arr_rest;

@end
