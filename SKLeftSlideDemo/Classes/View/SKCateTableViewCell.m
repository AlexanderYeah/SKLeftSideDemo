//
//  SKCateTableViewCell.m
//  SKLeftSlideDemo
//
//  Created by AlexanderYeah on 2017/6/27.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "SKCateTableViewCell.h"

@implementation SKCateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        [self setupUI];
    }
    
    return self;

}

#pragma mark - 创建UI
-(void)setupUI
{
    // 1 左边的图标
    _leftIconView = [[UIImageView alloc]init];
    _leftIconView.frame = CGRectMake(20, 5, 28, 28);
    [self.contentView addSubview:_leftIconView];

    // 2 文字
    _textLbl = [[UILabel alloc]init];
    _textLbl.frame =  CGRectMake(80, 0, 100, 40);
    [self.contentView addSubview:_textLbl];
    // 3 更多图标
    UIImageView *moreNav = [[UIImageView alloc]init];
    moreNav.frame = CGRectMake(190, 10, 20, 20);
    moreNav.image = [UIImage imageNamed:@"more_nav"];
    [self.contentView addSubview:moreNav];
    
    

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
