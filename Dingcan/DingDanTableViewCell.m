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
        self.persLabel.font = [UIFont boldSystemFontOfSize:20];
        [self addSubview:self.persLabel];
        
        
        self.packLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 150, 20)];
//        self.packLabel.font = [UIFont boldSystemFontOfSize:20];
        [self addSubview:self.packLabel];
        
        
        self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 20, 100,20)];
        self.priceLabel.font = [UIFont boldSystemFontOfSize:20];
        [self addSubview:self.priceLabel];
        
        
        
            }
    return self;
}
- (void)setCellInfoWithDicInfo :(NSDictionary *)dicInfo
{
    NSString *strPersonName = [dicInfo objectForKey:@"personName"];
    NSString *strPackageName = [dicInfo objectForKey:@"packageName"];
    NSString *strPrice = [NSString stringWithFormat:@"¥%@",[dicInfo objectForKey:@"packagePrice"]];
    [self setCellInfoWithPersonName:strPersonName packageName:strPackageName PackagePrice:strPrice];
}
- (void)setCellInfoWithPersonName :(NSString *)personName packageName :(NSString *)packageName PackagePrice :(NSString *)price
{
    self.persLabel.text = personName;
    self.packLabel.text = packageName;
    self.priceLabel.text = price;
}

@end
