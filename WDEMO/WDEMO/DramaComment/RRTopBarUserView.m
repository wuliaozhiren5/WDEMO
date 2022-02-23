//
//  RRTopBarUserView.m
//  NJVideo
//
//  Created by WDEMO on 2021/8/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTopBarUserView.h"
//#import "RrmjUser.h"

@implementation RRTopBarUserView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];

    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.avaterImgV];
    [self addSubview:self.nickNameLab];
    [self addSubview:self.vipImgV];
}

- (void)headImgUrl:(NSString *)headImgUrl
          nickName:(NSString *)nickName
             isVip:(BOOL)isVip
          vipLeveL:(NSInteger)vipLeveL
         isExpired:(BOOL)isExpired {

    NSString *headImgUrlStr = headImgUrl ?: @"";
    NSString *nickNameStr = nickName ?: @"";
    CGFloat vipImgVWidth = 14;
    CGFloat vipImgVHeight = 14; 
    if (vipLeveL > 0) {
        vipImgVWidth = 24;
    }
    
    //头像
//    [self.avaterImgV rr_setImageWithURLString:headImgUrlStr placeholderImage:KPersonHolderImg];
    //nickname
    self.nickNameLab.text = nickNameStr;
//    UIImage *vipImage = [RrmjUser vipMedalImageWithIsVip:isVip vipLevel:vipLeveL isExpired:isExpired];
    UIImage *vipImage = nil;
    
//    B68540
    //头像
    [self.avaterImgV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.leading.mas_equalTo(0);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    //vip图片不存在
    if (!vipImage) {
        [self.nickNameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.leading.mas_equalTo(self.avaterImgV.mas_trailing).offset(10);
            make.trailing.mas_lessThanOrEqualTo(0);
            make.height.mas_equalTo(30);
        }];
        [self.vipImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.avaterImgV);
            make.leading.mas_equalTo(self.nickNameLab.mas_trailing).offset(4);
            make.width.mas_equalTo(vipImgVWidth);
            make.height.mas_equalTo(vipImgVHeight);
        }];
//        self.nickNameLab.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
        self.vipImgV.image = nil;
        self.vipImgV.hidden = YES;
    } else {
        //vip图片存在
        [self.nickNameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.leading.mas_equalTo(self.avaterImgV.mas_trailing).offset(10);
            make.trailing.mas_lessThanOrEqualTo(@-34);
            make.height.mas_equalTo(30);
        }];
        [self.vipImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.avaterImgV);
            make.leading.mas_equalTo(self.nickNameLab.mas_trailing).offset(4);
            make.width.mas_equalTo(vipImgVWidth);
            make.height.mas_equalTo(vipImgVHeight);
        }];
//        self.nickNameLab.textColor = kCOLOR_B68540;
        self.vipImgV.image = vipImage;
        self.vipImgV.hidden = NO;
    }
    
    //昵称颜色
    if (isVip && !isExpired) {
        //是vip并且没过期
        self.nickNameLab.textColor = kCOLOR_B68540;
    } else {
        //是vip并且过期
        //不是vip
        self.nickNameLab.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
    }
}

#pragma mark - 点击头像 点击昵称
- (void)tapAction:(UITapGestureRecognizer *)tap {
    NSString *userId = self.userId;
    if (userId) {
//        [[RRAppLinkManager sharedManager] goUpuserDetail:userId toRoot:NO];
    }
}

#pragma mark - 点击Vip
- (void)tapVipAction:(UITapGestureRecognizer *)tap {
//    [[RRAppLinkManager sharedManager] goCenterToRoot:NO];
}

//lazy
- (UIImageView *)avaterImgV {
    if (!_avaterImgV) {
        _avaterImgV = [[UIImageView alloc] init];
        _avaterImgV.frame = CGRectMake(0, 0, 30, 30);
        _avaterImgV.layer.cornerRadius = 15;
        _avaterImgV.layer.masksToBounds = YES;
        _avaterImgV.layer.borderWidth = 1;
        _avaterImgV.layer.borderColor = [kCOLOR_85888F colorWithAlphaComponent:0.2].CGColor;
        _avaterImgV.userInteractionEnabled = YES; 
        UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [_avaterImgV addGestureRecognizer:tapGesturRecognizer];
    }
    return _avaterImgV;
}

- (UILabel *)nickNameLab {
    if (!_nickNameLab) {
        _nickNameLab = [[UILabel alloc] init];
        _nickNameLab.frame  = CGRectMake(0, 0, 100, 30);
        _nickNameLab.font = BOLDSYSTEMFONT(17.0);
        _nickNameLab.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
        //VIP时候
//        _nickNameLab.textColor = kCOLOR_B68540;
        _nickNameLab.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [_nickNameLab addGestureRecognizer:tapGesturRecognizer];
    }
    return _nickNameLab;
}

- (UIImageView *)vipImgV {
    if (!_vipImgV) {
        _vipImgV = [[UIImageView alloc] init];
        _vipImgV.frame  = CGRectMake(0, 0, 28, 14);
        _vipImgV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapVipAction:)];
        [_vipImgV addGestureRecognizer:tapGesturRecognizer];
    }
    return _vipImgV;
}

@end
