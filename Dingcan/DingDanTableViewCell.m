//
//  DingDanTableViewCell.m
//  Dingcan
//
//  Created by 李旗 on 15/11/12.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "DingDanTableViewCell.h"

@implementation DingDanTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.persLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
//        self.persLabel.backgroundColor = [UIColor Color];
        [self addSubview:self.persLabel];
        
        
        self.packLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 100, 20)];
        [self addSubview:self.packLabel];
//        self.lbDetail.backgroundColor = [UIColor yellowColor];
        
        
        self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, 100,20)];
        
        [self addSubview:self.priceLabel];
        
        
        
            }
    return self;
}


@end
