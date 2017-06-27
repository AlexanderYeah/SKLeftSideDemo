//
//  SKHomePageViewController.m
//  SKLeftSlideDemo
//
//  Created by AlexanderYeah on 2017/6/27.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "SKHomePageViewController.h"
#import "AppDelegate.h"
@interface SKHomePageViewController ()

@end

@implementation SKHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

#pragma mark - 创建UI
- (void)setupUI
{
    self.title = @"AlexanderYeah";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    menuBtn.frame = CGRectMake(0, 0, 20, 18);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"leftnav"] forState:UIControlStateNormal];

    [menuBtn addTarget:self action:@selector(doAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    
}

#pragma mark - 打开关闭左边抽屉
- (void)doAction
{
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (delegate.LeftSlideVC.closed)
    {
        [delegate.LeftSlideVC openLeftView];
    }
    else
    {
        [delegate.LeftSlideVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate.LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
   [delegate.LeftSlideVC setPanEnabled:YES];
}

@end
