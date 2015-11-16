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
#import "ResViewController.h"
#import "PackTableViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    NSArray *restaurant = [NSArray arrayWithObjects:@"KFC",@"7-11",@"成都小吃", nil];
//    self.restaurantList = restaurant;
//    
//    
//    UITableView *resTableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
//    
//    self.restaurantTableview = resTableview;
//    
//    resTableview.dataSource = self;
//    resTableview.delegate = self;
//    
//    [self.view addSubview:resTableview];
//    
    
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"田园鸡腿堡",@"name",@"¥10.00",@"price", nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"黄金咖喱猪排饭",@"name",@"¥23.50",@"price", nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"意式肉酱猪排饭",@"name",@"¥16.00",@"price", nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"老北京鸡肉卷",@"name",@"¥14.00",@"price", nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:@"劲脆鸡腿堡",@"name",@"¥15.00",@"price", nil];
    
    
    dic_rest_package = [[NSDictionary alloc]initWithObjectsAndKeys:[NSArray arrayWithObjects:dic1,dic2,dic3, nil],@"KFC",[NSArray arrayWithObjects:dic4,dic5, nil],@"MDL", nil];
    
    
    
    
    
    
    
    
    
    
    
    
    
    UILabel *labelp = [[UILabel alloc]initWithFrame:CGRectMake(10, 50,70, 50)];
    labelp.text = @"人：";
    labelp.textColor = [UIColor blackColor];
    [self.view addSubview:labelp];
  //    创建一个内容为 人 的label
    
    
    UILabel *labelr = [[UILabel alloc]initWithFrame:CGRectMake(10, 250,70, 50)];
    labelr.text = @"餐厅：";
    labelr.textColor = [UIColor blackColor];
    [self.view addSubview:labelr];
//    创建一个内容为 餐厅 的label
    
    
    UILabel *labelt = [[UILabel alloc]initWithFrame:CGRectMake(10, 450,70, 50)];
    labelt.text = @"套餐：";
    labelt.textColor = [UIColor blackColor];
    [self.view addSubview:labelt];
//    创建一个内容为 套餐 的label

    
    
    
    
    UIButton *btnPerson = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnPerson.frame = CGRectMake(35, 170, 300, 50);
    [btnPerson setTitle:@"选人" forState:UIControlStateNormal];
    [btnPerson addTarget:self action:@selector(btnPressedps:) forControlEvents:UIControlEventTouchUpInside];
    btnPerson.backgroundColor = [UIColor whiteColor];
    [btnPerson.layer setCornerRadius:10.0];
    [btnPerson.layer setBorderWidth:0.5];
    [btnPerson.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.view addSubview:btnPerson];
    
    
    
    UIButton *btnRest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnRest.frame = CGRectMake(35, 360, 300, 50);
    [btnRest setTitle:@"选餐厅" forState:UIControlStateNormal];
    [btnRest addTarget:self action:@selector(btnPressedr:) forControlEvents:UIControlEventTouchUpInside];
    btnRest.backgroundColor = [UIColor whiteColor];
    [btnRest.layer setCornerRadius:10.0];
    [btnRest.layer setBorderWidth:0.5];
    [btnRest.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.view addSubview:btnRest];

    
    
    btnPackage = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnPackage.frame = CGRectMake(35, 550, 300, 50);
    [btnPackage setTitle:@"选套餐" forState:UIControlStateNormal];
    [btnPackage addTarget:self action:@selector(btnPressedpk:) forControlEvents:UIControlEventTouchUpInside];
    btnPackage.backgroundColor = [UIColor whiteColor];
    [btnPackage.layer setCornerRadius:10.0];
    [btnPackage.layer setBorderWidth:0.5];
    [btnPackage.layer setBorderColor:[UIColor grayColor].CGColor];
    
    [btnPackage setEnabled:NO];
    [self.view addSubview:btnPackage];

    
    
    
    btnConfirm = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnConfirm.frame = CGRectMake(35, 600, 300, 50);
    [btnConfirm setTitle:@"确认" forState:UIControlStateNormal];
    [btnConfirm addTarget:self action:@selector(btnPressedc:) forControlEvents:UIControlEventTouchUpInside];
    btnConfirm.backgroundColor = [UIColor whiteColor];
    [btnConfirm.layer setCornerRadius:10.0];
    [btnConfirm.layer setBorderWidth:0.5];
    [btnConfirm.layer setBorderColor:[UIColor grayColor].CGColor];
//    btnConfirm.titleLabel.textColor = [UIColor blackColor];
    [btnConfirm setEnabled:NO];
    
    
    [self.view addSubview:btnConfirm];
    
    
    
    UILabel *resChoose = [[UILabel alloc]initWithFrame:CGRectMake(35, 300,300, 45)];
    self.resName = resChoose;
    resChoose.backgroundColor = [UIColor grayColor];
    [self.view addSubview:resChoose];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationNamerest:) name:@"nameRset" object:nil];
//    创建餐厅选择的label     坐标和大小加背景颜色显示出框架  初始是没有内容的
    
    
    UILabel *packChoose = [[UILabel alloc]initWithFrame:CGRectMake(35, 490, 300, 45)];
    self.packName = packChoose;
    packChoose.backgroundColor = [UIColor grayColor];
    [self.view addSubview:packChoose];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationNamepack:) name:@"packRset" object:nil];
    
 //    创建套餐选择的label
    
    UILabel *persChoose = [[UILabel alloc]initWithFrame:CGRectMake(35, 110, 300, 45)];
    self.persName = persChoose;
    persChoose.backgroundColor = [UIColor grayColor];
    [self.view addSubview:persChoose];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationNamepers:) name:@"persRset" object:nil];
   
    //    创建人名选择的label
    
    
    
    
    
}

    










-(void)btnPressedps:(id)sender
{
    PersonViewController *personView = [[PersonViewController alloc]init];
    [self.navigationController pushViewController:personView animated:YES];
    
    
}

-(void)btnPressedr:(id)sender
{
    RestaurantTableViewController *restaurantView = [[RestaurantTableViewController alloc]initWithStyle:UITableViewStyleGrouped :[dic_rest_package allKeys]];
    
    [self.navigationController pushViewController:restaurantView animated:YES];

}



-(void)btnPressedpk:(id)sender
{
    PackTableViewController *packageView = [[PackTableViewController alloc]initWithStyle:UITableViewStyleGrouped :[dic_rest_package objectForKey:self.resName.text]];
    
    [self.navigationController pushViewController:packageView animated:YES];
    
}
    



//-(void)btnPressedr:(id)sender
//{
//    ResViewController *resView = [[ResViewController alloc]init];
//    
//    [self.navigationController pushViewController:resView animated:YES];
//}


-(void)notificationNamepers:(NSNotification *)psnotification
{
    self.persName.text = psnotification.object;
      //    反馈选人名字的通知
    
    if (self.persName.text != nil && self.packName.text != nil && self.resName.text != nil)
    {
        [btnConfirm setEnabled:YES];
    }

    
    
}






-(void)notificationNamerest:(NSNotification *)rnotification
{
    self.resName.text = rnotification.object;
    
//    反馈选餐厅名字的通知
    
    if (self.resName.text != nil)
    {
        [btnPackage setEnabled:YES];
    }
}




-(void)notificationNamepack:(NSNotification *)pknotification
{
    self.packName.text = pknotification.object;
//    NSDictionary *dicPack = pknotification.object;
//    self.packName.text = [dicPack objectForKey:@"name"];
//    self.pack_price = [dicPack objectForKey:@"price"];
    //    反馈选套餐名字的通知
    
    if (self.persName.text != nil && self.packName.text != nil && self.resName.text != nil)
    {
        [btnConfirm setEnabled:YES];
    }
    
}





-(void)btnPressedc:(id)sender
{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory ,NSUserDomainMask, YES);
    NSString  *docDir = [paths objectAtIndex:0];

    NSString *filePath = [docDir stringByAppendingPathComponent:@"oder_List.plist"];
//    NSArray *orderList = [[NSArray alloc]initWithObjects:self.persName.text,self.resName.text,self.packName.text, nil];
//    [orderList writeToFile:filePath atomically:YES];
    
    NSArray *arr = [dic_rest_package objectForKey:self.resName.text];
    
    for (int i=0; i<arr.count; i++) {
        if ([[[arr objectAtIndex:i]objectForKey:@"name"] isEqualToString: self.packName.text])
        {
            self.pack_price  = [[arr objectAtIndex:i]objectForKey:@"price"];
        }
    }
    
    NSDictionary *order = [[NSDictionary alloc]initWithObjectsAndKeys:self.persName.text,@"personName",self.resName.text,@"restaurant",self.packName.text,@"packageName",self.pack_price,@"packagePrice",  nil];
    
    
    NSMutableArray *array_orders = [[NSMutableArray alloc]initWithContentsOfFile:filePath];
//    先取出来
    if (array_orders == nil) {
        array_orders = [[NSMutableArray alloc]initWithCapacity:0];
    }
    [array_orders addObject:order];
//    再一起加进去就不会覆盖以前的数据了。
    
    BOOL is_save_success = [array_orders writeToFile:filePath atomically:YES];
    if (is_save_success == true)
    {
        [(UIButton *)sender setEnabled:NO];
    }

}
//   确定的通知






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
