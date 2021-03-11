//
//  RRActorIntroCell.m
//  PUClient
//
//  Created by rrtv on 2021/3/10.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRActorIntroCell.h"
#import <Masonry/Masonry.h>
#import "ACMacros.h"
#import "UIColor+color.h"

@interface RRActorIntroCell ()
//头像 //昵称 //detail
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *subTitle;
@end

@implementation RRActorIntroCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews]; 
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.subTitle];
  
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@4);
        make.leading.equalTo(@16);
        make.width.equalTo(@60);
        make.height.equalTo(@60);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.avatarImageView.mas_trailing).offset(12);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-16);
        make.top.equalTo(self.avatarImageView.mas_top).offset(13);
        make.height.equalTo(@14);
    }];

    [self.subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.titleLab);
        make.trailing.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(9);
        make.height.equalTo(@12);
    }];
    
//    [self.roleImg mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.trailing.bottom.equalTo(self.avatarImageView);
//        make.width.height.offset(14);
//    }];
    
    self.titleLab.text = @"笑嘻嘻";
    self.subTitle.text = @"日韩剧迷";
}

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc]init];
        _avatarImageView.frame = CGRectMake(0, 0, 60, 60);
        _avatarImageView.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
        _avatarImageView.layer.cornerRadius = 30;
        _avatarImageView.layer.masksToBounds = YES; 
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _avatarImageView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        _titleLab.font = RR_BOLDFONT(14);
        _titleLab.textColor = kCOLOR_dynamicProvider_222222_E5E7EB;
    }
    return _titleLab;
}

- (UILabel *)subTitle {
    if (!_subTitle) {
        _subTitle = [[UILabel alloc] init];
        _subTitle.frame = CGRectMake(0, 0, 40, 40);
        _subTitle.font = RR_COMMONFONT(12);
        _subTitle.textColor = kCOLOR_85888F;
    }
    return _subTitle;
}
@end
