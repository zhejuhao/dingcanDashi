//
//  PersonTableViewController.m
//  Dingcan
//
//  Created by 李旗 on 15/11/19.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "PersonTableViewController.h"
#import "HelpViewController.h"
#import "LookTableViewController.h"
#import "NavigationItem.h"

@implementation PersonTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label_choose_person = [NavigationItem creat_item_label:@"选人" :CGRectMake(0,0,200,50)];
    self.navigationItem.titleView = label_choose_person;
    self.personName = [[NSArray alloc]initWithObjects:@"赵大",@"钱二",@"张三",@"李四",@"王五",@"赵六", nil];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [self.personName count];
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
    
    cell.textLabel.text = [self.personName objectAtIndex:row];
    cell.textLabel.textColor = [UIColor blueColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *persName =[self.personName objectAtIndex:[indexPath row]];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"person_choose" object:persName userInfo:nil];
    [self. navigationController popViewControllerAnimated:YES];
}




@end
