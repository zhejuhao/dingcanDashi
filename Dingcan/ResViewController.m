//
//  ResViewController.m
//  Dingcan
//
//  Created by 李旗 on 15/11/10.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "ResViewController.h"

@interface ResViewController ()

@end

@implementation ResViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *restaurant = [NSArray arrayWithObjects:@"KFC",@"7-11",@"成都小吃", nil];
    self.resList = restaurant;
    
    
    UITableView *resTableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.resTableview.backgroundColor = [UIColor redColor];

    self.resTableview = resTableview;
    
    resTableview.dataSource = self;
    resTableview.delegate = self;
    
    
    self.resTableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:resTableview];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
//    return [self.resList count];
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIndentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIndentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIndentifier];
        
    }
    
    NSUInteger row = [indexPath row];
    
    cell.textLabel.text = [self.resList objectAtIndex:row];
    
    return cell;
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
