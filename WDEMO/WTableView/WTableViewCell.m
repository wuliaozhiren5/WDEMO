//
//  WTableViewCell.m
//  WDEMO
//
//  Created by longzhu on 2019/9/2.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import "WTableViewCell.h"

@interface WTableViewCell ()

//@property (nonatomic, strong) UIImageView *coverImage;
//
//@property (nonatomic, strong) UILabel *anidenceLbl;

@property (nonatomic, strong) UIImageView *headImg;

@property (nonatomic, strong) UILabel *nameLbl;

@property (nonatomic, strong) UILabel *titleLbl;

@property (nonatomic, strong) UIView *auidenceCover;

@property (nonatomic, strong) UIImageView *hotImg;

@property (nonatomic, strong) UIImageView *privateRoomImg;

@property (nonatomic, strong) UIImageView *liveImg;

@property (nonatomic, strong)UIImageView *activityImg;//活动图标

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (nonatomic, strong) UILabel *rateLabel;


@property (nonatomic, strong) UIImageView *avatarImage;

@property (nonatomic, strong) UILabel *leftLabel;

@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, strong) UIImageView *NextImage;

@end

@implementation WTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
