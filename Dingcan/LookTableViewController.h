//
//  LookTableViewController.h
//  Dingcan
//
//  Created by 李旗 on 15/11/12.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DingDanTableViewCell.h"

@interface LookTableViewController : UITableViewController
{
    int personNumber;
    int number_not_order;
    NSMutableArray *arr_person_name;
    double total;
}

@property(nonatomic,retain)UITableViewController *lookTableView;

@property(nonatomic,retain)NSMutableArray *already_Oder;

@end
