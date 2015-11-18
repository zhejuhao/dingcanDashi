//
//  CreatButton.h
//  Dingcan
//
//  Created by 李旗 on 15/11/18.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatButton : UIViewController
+(UIButton *)creatButtonWithTitle: (NSString *)title :(CGRect)frame :(SEL)buttonPressed :(id)target;

@end
