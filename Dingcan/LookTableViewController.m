//
//  LookTableViewController.m
//  Dingcan
//
//  Created by 李旗 on 15/11/12.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "LookTableViewController.h"
#import "DingDanTableViewCell.h"


@implementation LookTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.lookTableView = [[UITableViewController alloc]initWithStyle:UITableViewStyleGrouped];

    
    self.navigationItem.title = @"看订单";
//    设置页面标题
   
    
    
    number_not_order = 6;
    //设置初始没有订餐的人数
    
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory ,NSUserDomainMask, YES);
    NSString  *docDir = [paths objectAtIndex:0];
    
    NSString *readPath = [docDir stringByAppendingPathComponent:@"oderinfo2.plist"];
    NSMutableArray *array_orderList = [[NSMutableArray alloc]initWithContentsOfFile:readPath];
   
    self.already_Oder = array_orderList;
    //取出沙盒的文件
    
 
   arr_person_name = [[NSMutableArray alloc]initWithObjects:@"赵大",@"钱二",@"张三",@"李四",@"王五",@"赵六", nil];//声明一个人名组成的数组
    
    NSMutableArray *rm_person = [[NSMutableArray alloc]initWithCapacity:0];
//声明一个数组，初始化
    
    for (int i=0; i < arr_person_name.count; i ++)
    {
        for (int j = 0; j < self.already_Oder.count; j ++) {
            if ([[[self.already_Oder objectAtIndex:j]objectForKey:@"personName"] isEqualToString:[arr_person_name objectAtIndex:i]])
            {
                [rm_person addObject:[arr_person_name objectAtIndex:i]];
                //如果沙盒里的人名和arr_person_name的人名一样的话  把一样的人名加到rm_person里
            }
        }
      
    }
    [arr_person_name removeObjectsInArray:rm_person];
    //把rm_person从arr_person_name里删除 那arr_person_name就只剩下不同的人名了
    
    total = 0;  //总价初始为0
    for (int i = 0; i <[self.already_Oder count] ; i++ )
    {
        NSString *unit_price =  [[self.already_Oder objectAtIndex:i]objectForKey:@"packagePrice"];
        total +=  unit_price.doubleValue;
        //计算总价
    }
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    // Return the number of rows in the section.
    if (section == 0) {
        return [self.already_Oder count];
    }
    return [arr_person_name count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSInteger section = [indexPath section];//获取section
    
    NSUInteger row = [indexPath row];

    
    
    static NSString *CellWithIndentifier = @"Cell";
    
    DingDanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIndentifier];
    if(cell == nil)
    {
        cell = [[DingDanTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIndentifier];
        
    }
    
    if (section == 0 ) {
        
    cell.persLabel.text = [[self.already_Oder objectAtIndex:row]objectForKey:@"personName" ];
    
    cell.packLabel.text = [[self.already_Oder objectAtIndex:row ]objectForKey:@"packageName"];
    
    cell.priceLabel.text =[NSString stringWithFormat:@"¥%@",[[self.already_Oder objectAtIndex:row]objectForKey:@"packagePrice"]];
    
       

        
    number_not_order = (int)arr_person_name.count;//没订餐的人数
    personNumber = 6 - number_not_order;//已经订餐的人数
      
        double doubleUnit_price = [(NSString *)([[self.already_Oder objectAtIndex:row]objectForKey:@"packagePrice"]) doubleValue];
        //把单价字符串转变为double型
        
        if ( doubleUnit_price > 11.00)
        {
            cell.priceLabel.textColor = [UIColor redColor];
        }
        
    }
    
    if (section == 1)
    {
        cell.persLabel.text = [ arr_person_name objectAtIndex:row];
    }
    // Configure the cell...
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section   //section的头标题
{
    
    if (section == 0)
        return [NSString stringWithFormat:@"%d人已定",personNumber];
    return [NSString stringWithFormat:@"%d人未定",number_not_order];
    
}


- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section  //section的脚标题

{
    
    if (section == 0)
        return 0;
    return [NSString stringWithFormat:@"%d人已定,%d人未定,总计:%.2f元",personNumber,number_not_order,total];
    
}


@end
