//
//  SeeLivingBaseCell.m
//  WDEMO
//
//  Created by WDEMO on 2020/8/12.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "SeeLivingBaseCell.h"
#import <Masonry/Masonry.h>
@implementation SeeLivingBaseCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.cornerRadius = 3;
        self.contentView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.coverImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.numberLabel];
        
        [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@12);
            make.leading.equalTo(@12);
            make.width.equalTo(@35);
            make.height.equalTo(@49);
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.coverImageView.mas_trailing).offset(9);
            make.top.equalTo(self.coverImageView.mas_top);
            make.trailing.equalTo(self.contentView.mas_trailing).offset(-12);
            
        }];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.mas_bottom).offset(11.5);
            make.leading.equalTo(self.nameLabel.mas_leading);
            
        }];
    }
    return self;
}

-(UIImageView *)coverImageView {
    
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc]init];
        _coverImageView.frame = CGRectMake(0, 0, 40, 40);
        _coverImageView.backgroundColor = [UIColor grayColor];
        _coverImageView.layer.cornerRadius = 3;
        //      _coverImageView.layer.masksToBounds = YES;
        
    }
    return _coverImageView;
}

-(UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _nameLabel.frame = CGRectMake(0, 0, 40, 40);
        _nameLabel.font = [UIFont systemFontOfSize:15.0];
        _nameLabel.frame = CGRectMake(10, 10, 50, 50);
        
    }
    return _nameLabel;
}

-(UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _numberLabel.frame = CGRectMake(0, 0, 40, 40);
        _numberLabel.font = [UIFont systemFontOfSize:12.0];
        _numberLabel.frame = CGRectMake(10, 10, 50, 50);
        
    }
    return _numberLabel;
}

- (void)fillWithData:(id)data {
    
}

@end

@implementation RRSubscribeSeeLivingCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.startTime];
        [self.contentView addSubview:self.subscribeBtn];
        
        [self.startTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.numberLabel.mas_centerY);
            make.leading.equalTo(self.numberLabel.mas_trailing).offset(6);
        }];
        [self.subscribeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.numberLabel.mas_centerY);
            make.trailing.equalTo(self.contentView.mas_trailing).offset(-12);
            make.width.equalTo(@72);
            make.height.equalTo(@27);
        }];
        
    }
    return self;
}
-(UILabel *)startTime {
    if (!_startTime) {
        _startTime = [[UILabel alloc]initWithFrame:CGRectZero];
        _startTime.frame = CGRectMake(0, 0, 40, 40);
        _startTime.font = [UIFont systemFontOfSize:12.0];
        _startTime.frame = CGRectMake(10, 10, 50, 50);
        
    }
    return _startTime;
}

-(UIButton *)subscribeBtn {
    
    if (!_subscribeBtn) {
        _subscribeBtn = [[UIButton alloc]init];
        _subscribeBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        _subscribeBtn.frame = CGRectMake(0, 0, 40, 40);
        
        [_subscribeBtn setTitle:@"立即预约" forState:UIControlStateNormal];
        _subscribeBtn.layer.cornerRadius = 27/2.0;
        _subscribeBtn.layer.masksToBounds = YES;
        [_subscribeBtn addTarget:self action:@selector(clickSubscribeBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _subscribeBtn;
}

- (void)clickSubscribeBtn:(UIButton *)button {
    if (self.delegate && [self.delegate respondsToSelector:@selector(seeLivingCell:subscribe:)]) {
        [self.delegate seeLivingCell:self firstLook:self.seeLivingModel];
    }
}

- (void)fillWithData:(id)data {
    
    self.coverImageView.backgroundColor = [UIColor blackColor];
    self.nameLabel.text = @"第name:324231942134892134921348120934asdfasdasdfasdfasdfasdf";
    self.numberLabel.text = @"第20辑";
    self.startTime.text = @"20:20";
    self.subscribeBtn.backgroundColor=[UIColor blueColor];
}

@end


@implementation RRSeeLivingCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.firstLookBtn];
        [self.contentView addSubview:self.seeLivingBtn];
        
    }
    return self;
}

-(UIButton *)firstLookBtn {
    
    if (!_firstLookBtn) {
        _firstLookBtn = [[UIButton alloc]init];
        _firstLookBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        _firstLookBtn.frame = CGRectMake(0, 0, 40, 40);
        [_firstLookBtn setTitle:@"快翻熟肉" forState:UIControlStateNormal];
        _firstLookBtn.layer.cornerRadius = 27/2.0;
        [_firstLookBtn addTarget:self action:@selector(clickFirstLookBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _firstLookBtn;
}
-(UIButton *)seeLivingBtn {
    
    if (!_seeLivingBtn) {
        _seeLivingBtn = [[UIButton alloc]init];
        _seeLivingBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        _seeLivingBtn.frame = CGRectMake(0, 0, 40, 40);
        [_seeLivingBtn setTitle:@"同步转播" forState:UIControlStateNormal];
        _seeLivingBtn.layer.cornerRadius = 27/2.0;;
        _seeLivingBtn.layer.masksToBounds = YES;
        [_seeLivingBtn addTarget:self action:@selector(clickSeeLivingBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _seeLivingBtn;
}

- (void)clickFirstLookBtn:(UIButton *)button {
    if (self.delegate && [self.delegate respondsToSelector:@selector(seeLivingCell:firstLook:)]) {
        [self.delegate seeLivingCell:self firstLook:self.seeLivingModel];
        
    }
    
}

- (void)clickSeeLivingBtn:(UIButton *)button {
    if (self.delegate && [self.delegate respondsToSelector:@selector(seeLivingCell:seeLiving:)]) {
        [self.delegate seeLivingCell:self seeLiving:self.seeLivingModel];
        
    }
}

- (void)fillWithData:(id)data {
    
    self.coverImageView.backgroundColor = [UIColor blackColor];
    self.nameLabel.text = @"name:";
    self.numberLabel.text = @"第20辑";
    self.firstLookBtn.backgroundColor=[UIColor blueColor];
    self.seeLivingBtn.backgroundColor=[UIColor blueColor];
    
    
    //第1种情况
    self.firstLookBtn.hidden = NO;
    self.seeLivingBtn.hidden = NO;
    
    [self.seeLivingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.numberLabel.mas_centerY);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-12);
        make.width.equalTo(@90);
        make.height.equalTo(@27);
    }];
    [self.firstLookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.numberLabel.mas_centerY);
        make.trailing.equalTo(self.seeLivingBtn.mas_leading).offset(-9);
        make.width.equalTo(@72);
        make.height.equalTo(@27);
    }];
    
    
    
    //    //第2种情况
    //    self.firstLookBtn.hidden = NO;
    //    self.seeLivingBtn.hidden = YES;
    //    [self.seeLivingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.equalTo(self.numberLabel.mas_centerY);
    //        make.trailing.equalTo(self.contentView.mas_trailing).offset(-12);
    //        make.width.equalTo(@90);
    //        make.height.equalTo(@27);
    //    }];
    //    [self.firstLookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.equalTo(self.numberLabel.mas_centerY);
    //        make.trailing.equalTo(self.contentView.mas_trailing).offset(-12);
    //        make.width.equalTo(@72);
    //        make.height.equalTo(@27);
    //    }];
    
    
    
    //    //第3种情况
    //      self.firstLookBtn.hidden = YES;
    //      self.seeLivingBtn.hidden = NO;
    //      [self.seeLivingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    //          make.centerY.equalTo(self.numberLabel.mas_centerY);
    //          make.trailing.equalTo(self.contentView.mas_trailing).offset(-12);
    //          make.width.equalTo(@90);
    //          make.height.equalTo(@27);
    //      }];
    //      [self.firstLookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    //          make.centerY.equalTo(self.numberLabel.mas_centerY);
    //          make.trailing.equalTo(self.seeLivingBtn.mas_leading).offset(-9);
    //          make.width.equalTo(@72);
    //          make.height.equalTo(@27);
    //      }];
    
}
@end
