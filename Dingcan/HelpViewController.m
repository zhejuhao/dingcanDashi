//
//  HelpViewController.m
//  Dingcan
//
//  Created by 李旗 on 15/11/9.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "HelpViewController.h"
#import "PersonViewController.h"
#import "RestaurantTableViewController.h"

#import "PackTableViewController.h"

#import "CreatButton.h"
@interface HelpViewController ()

@end

@implementation HelpViewController


-(UILabel *)creat_label_with_text:(NSString *)text :(CGRect)frame
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    return label;
}

-(UILabel *)creat_label_with_board :(CGRect)frame
{
    UILabel *choose_label = [[UILabel alloc]initWithFrame:frame];
    choose_label.backgroundColor = [UIColor grayColor];
    choose_label.layer.borderColor = [UIColor grayColor].CGColor;
    choose_label.layer.borderWidth = 0.5;
    choose_label.layer.cornerRadius = 10.0;
    [self.view addSubview:choose_label];
    return choose_label;
}

-(void)creat_label
{
    
    [self creat_label_with_text:@"人：" :CGRectMake(10, 60,70, 50)];
    //    创建一个内容为 人 的label
    [self creat_label_with_text:@"餐厅：" :CGRectMake(10, 250,70, 50)];
    //    创建一个内容为 餐厅 的label
    [self creat_label_with_text:@"套餐：" :CGRectMake(10, 450,70, 50)];
    //    创建一个内容为 套餐 的label
    
    UILabel *persChoose = [self creat_label_with_board:CGRectMake(35, 110, 300, 45)];
    self.persName = persChoose;
    //    创建人名选择的label
    UILabel *restChoose =[self creat_label_with_board:CGRectMake(35, 300,300, 45)];
    self.restName = restChoose;
    //    创建餐厅选择的label
    UILabel *packChoose = [self creat_label_with_board: CGRectMake(35, 490, 300, 45)];
    self.packName = packChoose;
    //    创建套餐选择的label
}


-(void)creat_button
{
    UIButton *btnPerson = [CreatButton creatButtonWithTitle:@"选人" :CGRectMake(35, 170, 300, 50) :@selector(btnPressed_pers:) :self];
    [self.view addSubview:btnPerson];
    //创建选人的按钮
    
    
    UIButton *btnRest =[CreatButton creatButtonWithTitle:@"选餐厅" :CGRectMake(35, 360, 300, 50) :@selector(btnPressed_rest:) :self];
    [self.view addSubview:btnRest];
    //创建选餐厅的按钮
    

    btnPackage = [CreatButton creatButtonWithTitle:@"选套餐" :CGRectMake(35, 550, 300, 50) :@selector(btnPressed_pack:) :self];
    [btnPackage setEnabled:NO]; //初始设置选套餐的按钮不可点击
    [self.view addSubview:btnPackage];
    //创建选套餐的按钮
    
    
    btnConfirm = [CreatButton creatButtonWithTitle:@"确认" :CGRectMake(35, 600, 300, 50) :@selector(btnPressed_confirm:) :self];
    [btnConfirm setEnabled:NO];//初始设置确认的按钮不可点击
    [self.view addSubview:btnConfirm];
    //创建确认的按钮

}
-(void)creat_dictionary
{
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"田园鸡腿堡",@"name",@"10.00",@"price", nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"黄金咖喱猪排饭",@"name",@"23.50",@"price", nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"意式肉酱猪排饭",@"name",@"16.00",@"price", nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"老北京鸡肉卷",@"name",@"14.00",@"price", nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:@"劲脆鸡腿堡",@"name",@"15.00",@"price", nil];
    
    
    dic_rest_package = [[NSDictionary alloc]initWithObjectsAndKeys:[NSArray arrayWithObjects:dic1,dic2,dic3, nil],@"KFC",[NSArray arrayWithObjects:dic4,dic5, nil],@"MDL", nil];
    //    定义一个字典，把字典dic1,dic2,dic3放进一个数组里，与key kfc对应  把dic4，dic5放到一个数组里与key mdl对应。

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creat_label];
    [self creat_button];
    [self creat_dictionary];
 
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationNamepers:) name:@"persRset" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationNamerest:) name:@"nameRset" object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationNamepack:) name:@"packRset" object:nil];


}

    










-(void)btnPressed_pers:(id)sender
{
    PersonViewController *personView = [[PersonViewController alloc]init];
    [self.navigationController pushViewController:personView animated:YES];
    
    //点选人按钮的动作是跳转到personView
}

-(void)btnPressed_rest:(id)sender
{
    RestaurantTableViewController *restaurantView = [[RestaurantTableViewController alloc]initWithStyle:UITableViewStyleGrouped :[dic_rest_package allKeys]];
    
    [self.navigationController pushViewController:restaurantView animated:YES];

}//点选餐厅按钮的动作是跳转到restaurantView



-(void)btnPressed_pack:(id)sender
{
    PackTableViewController *packageView = [[PackTableViewController alloc]initWithStyle:UITableViewStyleGrouped :[dic_rest_package objectForKey:self.restName.text]];
    
    [self.navigationController pushViewController:packageView animated:YES];
    
}//点选套餐按钮的动作是跳转到packageView
    

-(void)notificationNamepers:(NSNotification *)psnotification
{
    self.persName.text = psnotification.object;
      //    反馈选人名字的通知
    
    if (self.persName.text != nil && self.packName.text != nil && self.restName.text != nil)
    {
        [btnConfirm setEnabled:YES];
    }
    
}






-(void)notificationNamerest:(NSNotification *)rnotification
{
    self.restName.text = rnotification.object;
    
//    反馈选餐厅名字的通知
    
    if (self.restName.text != nil)
    {
        [btnPackage setEnabled:YES];//选了餐厅之后设置套餐按钮可以点击
    }
}


-(void)notificationNamepack:(NSNotification *)pknotification
{
    self.packName.text = pknotification.object;

    //    反馈选套餐名字的通知
    
    if (self.persName.text != nil && self.packName.text != nil && self.restName.text != nil)
    {
        [btnConfirm setEnabled:YES];//如果人名、餐厅名、套餐名不为空设置确认按钮可点击
    }
    
}    //如果先选套餐，人名不选的话，确定是不可点击的，再选人名之后，依旧不可点击，所以在人名的通知里再写一遍这个条件





-(NSString *)set_filePath_with_name  //沙盒机制
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory ,NSUserDomainMask, YES);
    NSString  *docDir = [paths objectAtIndex:0];
    //以上两行是获取Document目录
    
    NSString *filePath = [docDir stringByAppendingPathComponent:@"oderinfo3.plist"];
    //“”内是自己起的名字  创建一个文件
    return filePath;
}



-(void)btnPressed_confirm:(id)sender
{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    NSArray *arr = [dic_rest_package objectForKey:self.restName.text];
    
    for (int i=0; i<arr.count; i++) {
        if ([[[arr objectAtIndex:i]objectForKey:@"name"] isEqualToString: self.packName.text])
        {
          self.pack_price  = [[arr objectAtIndex:i]objectForKey:@"price"];
        }
    }
    
   
    
    NSDictionary *order = [[NSDictionary alloc]initWithObjectsAndKeys:self.persName.text,@"personName",self.restName.text,@"restaurant",self.packName.text,@"packageName",self.pack_price,@"packagePrice",  nil];
    
    NSString *file_path = [self set_filePath_with_name];
    NSMutableArray *array_orders = [[NSMutableArray alloc]initWithContentsOfFile:file_path];
//    先取出来
    if (array_orders == nil) {
        array_orders = [[NSMutableArray alloc]initWithCapacity:0];
    }
    [array_orders addObject:order];
//    再一起加进去就不会覆盖以前的数据了。
    
    BOOL is_save_success = [array_orders writeToFile:file_path atomically:YES];
    if (is_save_success == true)
    {
        [(UIButton *)sender setEnabled:NO];
    }

}
//   确定按钮跳转至上一层






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
