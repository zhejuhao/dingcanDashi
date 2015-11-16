//
//  ResViewController.h
//  Dingcan
//
//  Created by 李旗 on 15/11/10.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSArray *resList;

@property(nonatomic,retain)UITableView *resTableview;


@end
