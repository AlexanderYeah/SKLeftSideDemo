//
//  LeftCategoryViewController.m
//  SKLeftSlideDemo
//
//  Created by AlexanderYeah on 2017/6/27.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "LeftCategoryViewController.h"
#import "SKListSonViewController.h"
#import "AppDelegate.h"
#import "SKCateTableViewCell.h"
#import "SKCateHeaderView.h"


#define  kLeftCateHeaderHeight 140
#define  kLeftCateCellHeight 48
@interface LeftCategoryViewController ()<UITableViewDataSource,UITableViewDelegate>

// 标题数据源字典
@property (nonatomic,strong)NSMutableArray *sourceTitleArr;
// 左边icon图标数组
@property (nonatomic,strong)NSMutableArray *sourceIconArr;

@end

@implementation LeftCategoryViewController

// 标题数据源字典
- (NSMutableArray *)sourceArr
{
    if (!_sourceTitleArr) {
        _sourceTitleArr = [NSMutableArray arrayWithCapacity:0];
        NSArray *arr = @[@"我的设备",@"新增设备",@"保养计划",@"个性装扮",@"线上商城",@"关于我的",@"退出"];
        [_sourceTitleArr addObjectsFromArray:arr];
    }
    return _sourceTitleArr;
}
// 左边icon图标数组
- (NSMutableArray *)sourceIconArr
{
    if (!_sourceIconArr) {
        _sourceIconArr = [NSMutableArray arrayWithCapacity:0];
        NSArray *arr = @[@"list_icon1",@"list_icon2",@"list_icon3",@"list_icon4",@"list_icon5",@"list_icon6",@"list_icon1"];
        [_sourceIconArr addObjectsFromArray:arr];
    }
    return _sourceIconArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    
}

#pragma mark - 创建UI
- (void)setupUI
{
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@""];
    [self.view addSubview:imageview];
    
    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.scrollEnabled =NO;
    tableview.rowHeight = kLeftCateCellHeight;
    [self.view addSubview:tableview];

}

#pragma mark - tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"SKCell";
    SKCateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[SKCateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLbl.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLbl.textColor = kMainColor;
    cell.textLbl.text = self.sourceTitleArr[indexPath.row];
    
    
    // cell 图标
   
    cell.leftIconView.image = [UIImage imageNamed:self.sourceIconArr[indexPath.row]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    SKListSonViewController *sonVC = [[SKListSonViewController alloc] init];
    [delegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
    
    [delegate.mainNavigationController pushViewController:sonVC animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kLeftCateHeaderHeight;
}

#pragma mark - 头部区域—留作登录信息

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    SKCateHeaderView *headerView =[[SKCateHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, kLeftCateHeaderHeight)];
    headerView.userInteractionEnabled = YES;
    // 添加一个tap编辑个人信息
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headerTap:)];
    tap.numberOfTapsRequired = 1;
    
    [headerView addGestureRecognizer:tap];
    return headerView;
}

#pragma mark - tap 的点击
- (void)headerTap:(UITapGestureRecognizer *)tap
{
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    SKListSonViewController *sonVC = [[SKListSonViewController alloc] init];
    [delegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
    
    [delegate.mainNavigationController pushViewController:sonVC animated:NO];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
