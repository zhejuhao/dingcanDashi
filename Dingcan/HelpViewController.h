//
//  HelpViewController.h
//  Dingcan
//
//  Created by 李旗 on 15/11/9.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UIViewController
{
    NSDictionary *m_dic_rest_package;
    
    UIButton *m_btnConfirm ;
    UIButton *m_btnPackage ;
}
@property(nonatomic,retain)UILabel *restName;
@property(nonatomic,retain)UILabel *packName;
@property(nonatomic,retain)UILabel *persName;
@property(nonatomic,retain)NSString *pack_price;

@end
