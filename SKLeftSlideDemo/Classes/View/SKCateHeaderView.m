//
//  SKCateHeaderView.m
//  SKLeftSlideDemo
//
//  Created by AlexanderYeah on 2017/6/27.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "SKCateHeaderView.h"

@implementation SKCateHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - setupUI
- (void)setupUI{
    //1 图标
    // 1 左边的图标
    UIImageView * leftIconView = [[UIImageView alloc]init];
    leftIconView.frame = CGRectMake(20, 50, 48, 48);
    leftIconView.image =[UIImage imageNamed:@"list_header"];
    [self addSubview:leftIconView];
    
    // 2 文字
    _accountLbl = [[UILabel alloc]init];
    _accountLbl.frame =  CGRectMake(90, 62, 120, 40);
    _accountLbl.text = @"15112349876";
    [self addSubview:_accountLbl];


}
@end
