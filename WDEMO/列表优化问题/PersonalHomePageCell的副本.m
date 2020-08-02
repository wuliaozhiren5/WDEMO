//
//  PLUPersonalHomePageCell.m
//  TGA
//
//  Created by plu on 16/9/23.
//  Copyright © 2016年 developer. All rights reserved.
//

#import "PLUPersonalHomePageCell.h"

@implementation PLUPersonalHomePageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubview];
    }
    return self;
}

- (void)initSubview {
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
    [self.contentView addSubview:self.arrowImageView];
    [self.contentView addSubview:self.line];
    
    [self.contentView addSubview:self.bookLabel];
    [self.contentView addSubview:self.bookImageView];
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(10);
        make.width.height.equalTo(@24);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_icon.mas_trailing).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(_arrowImageView.mas_leading).offset(-10);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@44);

    }];
    
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(-10);
        make.width.height.equalTo(@24);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_titleLabel);
        make.bottom.trailing.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    
    [self.bookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(-10);
        make.width.equalTo(@33);
        make.height.equalTo(@44);

        make.centerY.equalTo(self.contentView);
    }];
    
    [self.bookLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(_bookImageView.mas_leading).offset(-5);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@44);
//        make.width.equalTo(@80); 
    }];
    

}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
    }
    return _icon;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor colorFromHexRGB:@"283545"];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = [UIColor colorFromHexRGB:@"2D3C4E"];
        _detailLabel.font = [UIFont systemFontOfSize:15];
    }
    return _detailLabel;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor colorFromHexRGB:@"dadde3"];
    }
    return _line;
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        _arrowImageView.image = [UIImage imageNamed:@"btn_home_box_more_normal"];
    }
    return _arrowImageView;
}

- (UILabel *)bookLabel {
    if (!_bookLabel) {
        _bookLabel = [[UILabel alloc] init];
        _bookLabel.textColor = [UIColor colorFromHexRGB:@"2D3C4E" alpha:0.5];
        _bookLabel.font = [UIFont systemFontOfSize:15];
    }
    return _bookLabel;
}

- (UIImageView *)bookImageView {
    if (!_bookImageView) {
        _bookImageView = [[UIImageView alloc] init];
        _bookImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bookImageView.clipsToBounds = YES;
     }
    return _bookImageView;
}

-(UIButton *)getImageBtn{
    if (!_getImageBtn) {
        _getImageBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 56, 24)];
        [self.contentView addSubview:_getImageBtn];
        [self.contentView bringSubviewToFront:_getImageBtn];
        [_getImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.contentView.mas_trailing).offset(-44);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.height.equalTo(@24);
            make.width.equalTo(@56);
        }];
    }
    return _getImageBtn;
}

- (UIView *)redDotView {
    if (!_redDotView) {
        _redDotView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 12, 12)];
        _redDotView.backgroundColor = [UIColor colorFromHexRGB:@"ff0001"];
        _redDotView.layer.cornerRadius = 3;
        _redDotView.layer.masksToBounds = YES;
        [self.contentView addSubview:_redDotView];
        [self.contentView bringSubviewToFront:_redDotView];
        [_redDotView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.contentView.mas_trailing).offset(-27);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.height.equalTo(@6);
            make.width.equalTo(@6);
        }];
    }
    return _redDotView;
}

- (void)updateImageBtnWithImgName:(NSString *)imageName isHidden:(BOOL)hidden{
    [self.getImageBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.getImageBtn setTitle:@"" forState:UIControlStateNormal];
    self.getImageBtn.backgroundColor = [UIColor whiteColor];
    self.getImageBtn.layer.cornerRadius = 0;
    self.getImageBtn.userInteractionEnabled = NO;
    self.getImageBtn.hidden = hidden;
    [self.getImageBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-27);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(16);
    }];
}

- (void)updateImageBtnWithTitle:(NSString *)title isHidden:(BOOL)hidden{
    self.getImageBtn.layer.cornerRadius = 12;
    self.getImageBtn.layer.masksToBounds = YES;
    self.getImageBtn.userInteractionEnabled = NO;
    self.getImageBtn.backgroundColor = [UIColor colorFromHexRGB:@"ff6050"];
    [self.getImageBtn setTitleColor:[UIColor colorFromHexRGB:@"ffffff"] forState:UIControlStateNormal];
    [self.getImageBtn setTitle:title?:@"可领取" forState:UIControlStateNormal];
    self.getImageBtn.titleLabel.font = [UIFont systemFontOfSize:11.0];
    self.getImageBtn.hidden = hidden;
    [self.getImageBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-44);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.equalTo(@24);
        make.width.equalTo(@56);
    }];
}

- (void)updateRedDotView:(PLURoomTaskTabModel *)noviceTaskModel {
    if ([PLUGlobalSettingManager shareManager].firstUserTask) {
        [self updateImageBtnWithImgName:@"icon_activity_new" isHidden:NO];
        self.redDotView.hidden = YES;
    } else if (![PLUPersonalVM me].isLogined) {
        self.redDotView.hidden = YES;
    } else if (noviceTaskModel && noviceTaskModel.hasFinishTask) {
        self.redDotView.hidden = NO;
    } else {
        self.redDotView.hidden = YES;
    }
}

- (void)showAnchorGuide:(BOOL)show {
    self.anchorGuide.hidden = !show;
}


- (LZAnchorCertifyGuide *)anchorGuide {
    if (!_anchorGuide) {
        _anchorGuide = [[LZAnchorCertifyGuide alloc] init];
        _anchorGuide.hidden = YES;
        [self.contentView addSubview:_anchorGuide];
        [self bringSubviewToFront:_anchorGuide];
        [_anchorGuide mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(56);
            make.width.mas_equalTo(180);
            make.centerY.equalTo(self.mas_centerY).offset(3);
            make.leading.equalTo(self.mas_leading).offset(120);
            
        }];
    }
    return _anchorGuide;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.anchorGuide.hidden = YES;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    self.redDotView.backgroundColor = [UIColor redColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.redDotView.backgroundColor = [UIColor redColor];
}

@end
