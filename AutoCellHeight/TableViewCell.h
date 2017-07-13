//
//  TableViewCell.h
//  AutoCellHeight
//
//  Created by 张小牛 on 2017/7/13.
//  Copyright © 2017年 ZXN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

+ (NSString *)reuseIdentifier;

@property (nonatomic,strong) UILabel *content;

@end
