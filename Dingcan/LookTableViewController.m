//
//  LookTableViewController.m
//  Dingcan
//
//  Created by 李旗 on 15/11/12.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "LookTableViewController.h"
#import "DingDanTableViewCell.h"
#import "NavigationItem.h"

@implementation LookTableViewController


-(NSString *)read_filePath_with_name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory ,NSUserDomainMask, YES);
    NSString  *docDir = [paths objectAtIndex:0];
    
    NSString *readPath = [docDir stringByAppendingPathComponent:@"oderinfo4.plist"];
    return readPath;
}

-(double)total_price
{
    m_total = 0;  //总价初始为0
    for (int i = 0; i <[self.already_Oder count] ; i++ )
    {
        NSString *unit_price =  [[self.already_Oder objectAtIndex:i]objectForKey:@"packagePrice"];
        m_total +=  unit_price.doubleValue;
        //计算总价
    }

    return m_total;
}

-(NSArray *)person_not_order
{
    
    m_arr_person_name = [[NSMutableArray alloc]initWithObjects:@"赵大",@"钱二",@"张三",@"李四",@"王五",@"赵六", nil];//声明一个人名组成的数组
    
    NSMutableArray *person_name_already_order = [[NSMutableArray alloc]initWithCapacity:0];
    //声明一个数组，初始化
    
    for (int i=0; i < m_arr_person_name.count; i ++)
    {
        for (int j = 0; j < self.already_Oder.count; j ++) {
            if ([[[self.already_Oder objectAtIndex:j]objectForKey:@"personName"] isEqualToString:[m_arr_person_name objectAtIndex:i]])
            {
                [person_name_already_order addObject:[m_arr_person_name objectAtIndex:i]];
                //如果沙盒里的人名和arr_person_name的人名一样的话  把一样的人名加到rm_person里
            }
        }
        
    }
    [m_arr_person_name removeObjectsInArray:person_name_already_order];
    //把rm_person从arr_person_name里删除 那arr_person_name就只剩下不同的人名了

    return m_arr_person_name;
}

-(UIToolbar *)creat_toolbar
{
    UIToolbar *toolbar =[[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-90,self.view.frame.size.width, 50)];
    UILabel *toolbar_label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    toolbar_label.backgroundColor = [UIColor blackColor];
    toolbar_label.textColor = [UIColor whiteColor];
    toolbar_label.text = [NSString stringWithFormat:@"%d人已定,%d人未定,总计:%.2f元",m_person_number,m_number_not_order,m_total];
    toolbar_label.textAlignment =UITextAlignmentCenter;
    toolbar_label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:toolbar];
    [toolbar addSubview:toolbar_label];
    return toolbar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.lookTableView = [[UITableViewController alloc]initWithStyle:UITableViewStyleGrouped];

    UILabel *label_look_order =  [NavigationItem creat_item_label:@"订单显示" :CGRectMake(0, 0, 200, 50)];
    self.navigationItem.titleView = label_look_order;
//    设置页面标题
   
    m_number_not_order = 6;
    //设置初始没有订餐的人数
    
    NSString *read_path = [self read_filePath_with_name];
    NSMutableArray *array_orderList = [[NSMutableArray alloc]initWithContentsOfFile:read_path];
   
    self.already_Oder = array_orderList;
    //取出沙盒的文件
    [self person_not_order];
    [self total_price];
    [self creat_toolbar];
    m_number_not_order = (int)m_arr_person_name.count;//没订餐的人数
    m_person_number = 6 - m_number_not_order;//已经订餐的人数

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
    return [m_arr_person_name count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellWithIndentifier = @"Cell";
    DingDanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIndentifier];
    if(cell == nil)
    {
        cell = [[DingDanTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIndentifier];
    }
    if (indexPath.section == 0 )
    {
        [cell setCellInfoWithDicInfo:[self.already_Oder objectAtIndex:indexPath.row]];
        cell.priceLabel.textColor = [self getCellPriceColor:(int)indexPath.row];
    }
    else
        cell.persLabel.text = [ m_arr_person_name objectAtIndex:indexPath.row];
    
    return cell;
}
- (UIColor *)getCellPriceColor :(int)row
{
    UIColor *priceColor = [UIColor blackColor];
    if ([[[self.already_Oder objectAtIndex:row]objectForKey:@"packagePrice"]doubleValue] > 11.00)
    {
        priceColor = [UIColor redColor];
    }
    return priceColor;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section   //section的头标题
{

    
    if (section == 0)
        return  [self creat_section_header_label:[NSString stringWithFormat:@"%d人已定",m_person_number]];
    else
        return [self creat_section_header_label:[NSString stringWithFormat:@"%d人未定",m_number_not_order]];
}
-(UILabel *)creat_section_header_label :(NSString *)title
{
    UILabel *header_label = [[UILabel alloc]init];
    header_label.text = title;
    header_label.backgroundColor = [UIColor blueColor];
    header_label.textColor = [UIColor whiteColor];
    [self.view addSubview:header_label];
    return header_label;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 44.0;
    return 44.0;
}//设置头标题的高度

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}



@end
