//
//  DingDanTableViewCell.h
//  Dingcan
//
//  Created by 李旗 on 15/11/12.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DingDanTableViewCell : UITableViewCell

@property(nonatomic,retain)UILabel *persLabel;
@property(nonatomic,retain)UILabel *priceLabel;
@property(nonatomic,retain)UILabel *packLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)setCellInfoWithPersonName :(NSString *)personName packageName :(NSString *)packageName PackagePrice :(NSString *)price;
- (void)setCellInfoWithDicInfo :(NSDictionary *)dicInfo;
@end
