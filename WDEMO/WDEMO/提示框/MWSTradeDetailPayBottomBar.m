//
//  MWSTradeDetailPayBottomBar.m
//  MoWanShang
//
//  Created by aimeiju on 2022/6/29.
//

#import "MWSTradeDetailPayBottomBar.h"

@implementation MWSTradeDetailPayBottomBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}


- (void)setupViews {
    self.backgroundColor = [UIColor clearColor];

//    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
//    [self addSubview:self.detailBtn];
    [self addSubview:self.nextBtn];
    [self addSubview:self.tipsLabBackgroundView];
    [self addSubview:self.tipsLab];
   
//    [self.detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@(50));
//        make.bottom.equalTo(@(0));
//        make.leading.equalTo(@0);
//        make.width.equalTo(@(KWidth / 2.0));
//    }];

    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(50));
        make.bottom.equalTo(@(0));
        make.leading.equalTo(@17);
        make.trailing.equalTo(@-17);
//        make.width.equalTo(@(KWidth / 2.0));
    }];

    [self.tipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-55));
        make.height.equalTo(@(30));
        make.centerX.equalTo(@0);

    }];
    
    [self.tipsLabBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.tipsLab.mas_top).offset();
        make.bottom.equalTo(@(-55));
        make.height.equalTo(@(30));
//        make.leading.equalTo(self.tipsLab.mas_leading).offset(-16.5);
//        make.trailing.equalTo(self.tipsLab.mas_trailing).offset(16.5);
        make.leading.equalTo(@37.5);
        make.trailing.equalTo(@-37.5);
    }];
    
//    self.detailBtn.backgroundColor = kCOLOR_1D1D1D;
    self.nextBtn.backgroundColor = kCOLOR_C13030;
    
}

- (void)setCount:(NSInteger)count {
    _count = count;
//    NSString *countStr = [NSString stringWithFormat:@"已打包%zi件物品", count];
//    if (self.isTrade) {
//        countStr = [NSString stringWithFormat:@"已选%zi件交易品", count];
//    }
//    [self.detailBtn setTitle:countStr forState:UIControlStateNormal];
//    
//    //先还原
//    self.detailBtn.titleEdgeInsets = UIEdgeInsetsZero;
//    self.detailBtn.imageEdgeInsets = UIEdgeInsetsZero;
//    
//    CGRect imageRect = self.detailBtn.imageView.frame;
//    CGRect titleRect = self.detailBtn.titleLabel.frame;
//
//    CGFloat padding = 5.0;
//    
//    //图片在右，文字在左
//    self.detailBtn.titleEdgeInsets = UIEdgeInsetsMake(0,
//                                                  -(imageRect.size.width + padding/2),
//                                                  0,
//                                                  (imageRect.size.width + padding/2));
//
//    self.detailBtn.imageEdgeInsets = UIEdgeInsetsMake(0,
//                                                  (titleRect.size.width+ padding/2),
//                                                  0,
//                                                  -(titleRect.size.width+ padding/2));
//    
}

//- (void)setIsTrade:(BOOL)isTrade {
//    _isTrade = isTrade;
//    [self.nextBtn setTitle:@"去发货" forState:UIControlStateNormal];
//    self.tipsLab.hidden = NO;
//    self.tipsLabBackgroundView.hidden = NO;
//
//    if (self.isTrade) {
//        [self.nextBtn setTitle:@"发布交易" forState:UIControlStateNormal];
//        self.tipsLab.hidden = YES;
//        self.tipsLabBackgroundView.hidden = YES;
//    }
//}


////lazy
//- (UIButton *)detailBtn {
//    if (!_detailBtn) {
//        _detailBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KWidth / 2, 320)];
//        [_detailBtn setTitle:@"已打包0件物品" forState:UIControlStateNormal];
//        [_detailBtn setImage:IMAGENAME(@"pic_uo") forState:UIControlStateNormal];
//        [_detailBtn setImage:IMAGENAME(@"pic_uo") forState:UIControlStateHighlighted];
//
//////        _detailBtn.imageView.contentMode = UIViewContentModeRight;
////        _detailBtn.imageView.contentMode = UIViewContentModeRight;
//////        _detailBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
////        _detailBtn.titleLabel.contentMode = UIViewContentModeRight;
//
//        //先还原
//        _detailBtn.titleEdgeInsets = UIEdgeInsetsZero;
//        _detailBtn.imageEdgeInsets = UIEdgeInsetsZero;
//
//        CGRect imageRect = _detailBtn.imageView.frame;
//        CGRect titleRect = _detailBtn.titleLabel.frame;
//
//        CGFloat padding = 5.0;
//
//        //图片在右，文字在左
//        _detailBtn.titleEdgeInsets = UIEdgeInsetsMake(0,
//                                                      -(imageRect.size.width + padding/2),
//                                                      0,
//                                                      (imageRect.size.width + padding/2));
//
//        _detailBtn.imageEdgeInsets = UIEdgeInsetsMake(0,
//                                                      (titleRect.size.width+ padding/2),
//                                                      0,
//                                                      -(titleRect.size.width+ padding/2));
//    }
//    return _detailBtn;
//}

- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KWidth / 2, 320)];
        [_nextBtn setTitle:@"支付 ¥48 元 购买" forState:UIControlStateNormal];
    }
    return _nextBtn;
}

- (UILabel *)tipsLab {
    if (!_tipsLab) {
        _tipsLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        _tipsLab.text = @"提示：付款后即刻成交";
        _tipsLab.font = [UIFont systemFontOfSize:12.0];
        _tipsLab.textColor = [UIColor whiteColor];
        _tipsLab.textAlignment = NSTextAlignmentCenter;
    }
    return _tipsLab;
}

- (UIView *)tipsLabBackgroundView {
    if (!_tipsLabBackgroundView) {
        _tipsLabBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
//        _tipsLabBackgroundView.backgroundColor = [UIColor blackColor];
        _tipsLabBackgroundView.backgroundColor = kCOLOR_1D1D1D;
        _tipsLabBackgroundView.layer.cornerRadius = 15;
        _tipsLabBackgroundView.layer.masksToBounds = YES;
        _tipsLabBackgroundView.hidden = YES;
    }
    return _tipsLabBackgroundView;
}
@end
