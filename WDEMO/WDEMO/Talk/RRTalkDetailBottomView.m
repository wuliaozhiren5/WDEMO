//
//  RRTalkDetailBottomView.m
//  PPVideo
//
//  Created by rrtv on 2021/12/15.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkDetailBottomView.h"

@implementation RRTalkDetailBottomView

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
    [self addSubview:self.sendBtn];
    [self.sendBtn addSubview:self.icon];
    [self.sendBtn addSubview:self.titleLab];
    [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.leading.equalTo(@20);
        make.width.equalTo(@14);
        make.height.equalTo(@14);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.trailing.equalTo(@-20);
//        make.height.equalTo(@12);
//        make.bottom.equalTo(@-9);
    }];
    
//    self.icon.backgroundColor = [UIColor redColor];
}

//- (void)clickSendBtn:(UIButton *)btn {
//    NSLog(@"发影评");
//}

- (UIButton *)sendBtn {
    if (!_sendBtn) {
        _sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _sendBtn.backgroundColor = kCOLOR_1890FF;
        _sendBtn.layer.cornerRadius = 25;
        _sendBtn.layer.masksToBounds = YES;
    }
    return _sendBtn;
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 14, 14)];
        _icon.image = IMAGENAME(@"ic_huati_add");
    }
    return _icon;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 12)];
        _titleLab.font = BOLDSYSTEMFONT(14);
        _titleLab.textColor = kCOLOR_FFFFFF;
        _titleLab.text = @"参与讨论";
    }
    return _titleLab;
}
@end
