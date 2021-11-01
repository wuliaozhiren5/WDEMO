//
//  RRDramaCommentBottomView.m
//  NJVideo
//
//  Created by rrtv on 2021/8/6.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRDramaCommentBottomView.h"

@implementation RRDramaCommentBottomView

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
        make.centerX.equalTo(self);
        make.top.equalTo(@9);
        make.width.equalTo(@14);
        make.height.equalTo(@14);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.equalTo(@12);
        make.bottom.equalTo(@-9);
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
        _icon.image = IMAGENAME(@"ic_compile_white_24");
    }
    return _icon;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 12)];
        _titleLab.font = BOLDSYSTEMFONT(10);
        _titleLab.textColor = kCOLOR_FFFFFF;
        _titleLab.text = @"写影评";
    }
    return _titleLab;
}
@end
