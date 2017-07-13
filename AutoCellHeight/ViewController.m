//
//  ViewController.m
//  AutoCellHeight
//
//  Created by 张小牛 on 2017/7/13.
//  Copyright © 2017年 ZXN. All rights reserved.
//

#define boundWidth      [UIScreen mainScreen].bounds.size.width
#define boundHeight     [UIScreen mainScreen].bounds.size.height
#define ZXNColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#import "ViewController.h"
#import "TableViewCell.h"
#import "Masonry.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>{
    
    UITableView *table;
    UITextField *textField_n;
    NSString *newContent;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpData];
    [self setUpView];
}

- (void)setUpData{
    newContent = @"故天将降大任于斯人也,必先苦其心志,劳其筋骨,饿其体肤,空乏其身,行拂乱其所为,所以动心忍性,曾益其所不能";
}

- (void)setUpView{
    table=[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    table.delegate=self;
    table.dataSource=self;
    table.backgroundColor = [UIColor whiteColor];
    table.estimatedRowHeight = 50;
    [self.view addSubview:table];
    
    UIView *textFieldView = [[UIView alloc]init];
    textFieldView.backgroundColor = ZXNColor(221,221,221, 0.5);
    [self.view addSubview:textFieldView];
    [textFieldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
        make.height.equalTo(@50);
    }];
    
    [self.view bringSubviewToFront:textFieldView];
    
    textField_n = [[UITextField alloc]init];
    textField_n.clearButtonMode = UITextFieldViewModeAlways;
    textField_n.returnKeyType = UIReturnKeyDone; //更改右下角
    textField_n.placeholder = @"输入发送内容";
    textField_n.delegate = self;
    [textFieldView addSubview:textField_n];
    [textField_n mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(textFieldView).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TableViewCell reuseIdentifier]];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[TableViewCell reuseIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.content.text = newContent;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"top.jpg"];
    return imageView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"121221");
    [textField_n resignFirstResponder];
    newContent = textField.text;
    textField_n.text = @"";
    [table reloadData];
    return YES;
}
@end
