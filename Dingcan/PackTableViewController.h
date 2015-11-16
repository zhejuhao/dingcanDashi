//
//  PackTableViewController.h
//  Dingcan
//
//  Created by 李旗 on 15/11/10.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PackTableViewController : UITableViewController



@property(nonatomic,retain)NSArray *packList;
- (id)initWithStyle:(UITableViewStyle)style :(NSArray *)package;
@end
