//
//  MyOneTableViewCell.m
//  FirstApp
//
//  Created by hyz on 10/1/18.
//  Copyright © 2018年 hyz. All rights reserved.
//

#import "MyOneTableViewCell.h"

@interface MyOneTableViewCell()
@property UIImageView *iconImageView;
@property UILabel *topticLabel;
@property UILabel *contentLabel;
@end

@implementation MyOneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.iconImageView = [[UIImageView alloc]init];
        
        [self.contentView addSubview:self.iconImageView];
        
        self.iconImageView.backgroundColor = [UIColor blackColor];
        
        self.topticLabel = [[UILabel alloc]init];
        
        [self.contentView addSubview:self.topticLabel];
        
        self.topticLabel.backgroundColor = [UIColor yellowColor];
        
        self.contentLabel = [[UILabel alloc]init];
        
        [self.contentView addSubview: self.contentLabel];
        
        self.contentView.backgroundColor = [UIColor greenColor];
        
        
        
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
    self.contentView.backgroundColor = [UIColor blackColor];
    static int time = 1;
    NSLog(@"time %d",time);
    time ++;
    
    
}

- (void)updateLayout
{
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(10);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(40);
    }];
    
    [self.topticLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_top);
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
        make.height.mas_equalTo(20);
        make.right.equalTo(self).offset(-10);
    }];
    
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.iconImageView.mas_bottom);
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
        make.height.mas_equalTo(20);
        make.right.equalTo(self).offset(-10);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
