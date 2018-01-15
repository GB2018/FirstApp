//
//  MyTwoTableViewCell.m
//  FirstApp
//
//  Created by hyz on 13/1/18.
//  Copyright © 2018年 hyz. All rights reserved.
//

#import "MyTwoTableViewCell.h"

@interface MyTwoTableViewCell()
@property UIImageView *iconImageView;
@property UILabel *titleLable;
@end
@implementation MyTwoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.iconImageView = [[UIImageView alloc]init];
        
        [self.contentView addSubview:self.iconImageView];
        
        
        self.titleLable = [[UILabel alloc]init];
        
        [self.contentView addSubview:self.titleLable];
    }
    return self;
}

- (void)updateLayoutWithTitleString:(NSString *)string{
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        
    }];
    
    self.iconImageView.image = [UIImage imageNamed:@"1.jpg"];

    [self.titleLable mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.iconImageView.mas_centerY);
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(20);
        
    }];
    
    self.titleLable.text = string;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
