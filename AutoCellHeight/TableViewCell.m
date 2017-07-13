//
//  TableViewCell.m
//  AutoCellHeight
//
//  Created by 张小牛 on 2017/7/13.
//  Copyright © 2017年 ZXN. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"
#define ZXNColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = ZXNColor(221,221,221, 0.5);
        
        UIImageView *leftImageView = [[UIImageView alloc]init];
        leftImageView.backgroundColor = ZXNColor(240, 195, 79, 1);
        [self addSubview:leftImageView];
        [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@10);
            make.top.equalTo(@10);
            make.bottom.equalTo(@-10);
            make.width.equalTo(@40);
        }];
        
        UIImageView *rightImageView = [[UIImageView alloc]init];
        rightImageView.backgroundColor = ZXNColor(240, 195, 79, 1);
        [self addSubview:rightImageView];
        [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-10);
            make.top.equalTo(@10);
            make.bottom.equalTo(@-10);
            make.width.equalTo(@40);
        }];
        
        self.content = [[UILabel alloc]init];
        self.content.numberOfLines = 0;
        self.content.backgroundColor = ZXNColor(70, 122, 142, 1);
        self.content.textColor = ZXNColor(240, 195, 79, 1);
        [self addSubview:self.content];
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftImageView.mas_right).offset(10);
            make.right.mas_equalTo(rightImageView.mas_left).offset(-10);
            make.top.equalTo(@10);
            make.bottom.equalTo(@-10);
        }];
    }
    return self;
}
+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}
@end
