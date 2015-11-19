//
//  PackTableViewController.m
//  Dingcan
//
//  Created by 李旗 on 15/11/10.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "PackTableViewController.h"
#import "NavigationItem.h"

@interface PackTableViewController ()

@end

@implementation PackTableViewController
- (id)initWithStyle:(UITableViewStyle)style :(NSArray *)package
{
    self = [super initWithStyle:style];
    if (self) {
        self.packList = [[NSArray alloc]initWithArray:package];
    }
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UILabel *label_choose_package = [NavigationItem creat_item_label:@"选套餐" :CGRectMake(0,0,200,50)];
    self.navigationItem.titleView = label_choose_package;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.packList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellWithIndentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIndentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIndentifier];
        
    }
    
    NSUInteger row = [indexPath row];
    
    cell.textLabel.text = [[self.packList objectAtIndex:row]objectForKey:@"pack_name"];
    cell.textLabel.textColor = [UIColor blueColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"¥%@",[[self.packList objectAtIndex:row]objectForKey:@"pack_price"]];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];

    

    
    // Configure the cell...
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *packName =[[self.packList objectAtIndex:indexPath.row]objectForKey:@"pack_name"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"pack_choose" object:packName userInfo:nil];
    [self. navigationController popViewControllerAnimated:YES];
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
