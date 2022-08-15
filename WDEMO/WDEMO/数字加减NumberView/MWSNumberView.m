//
//  MWSNumberView.m
//  MoWanShang
//
//  Created by aimeiju on 2022/7/8.
//

#import "MWSNumberView.h"

@implementation MWSNumberView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.max = 100;
        self.min = 0;
        [self setupViews];
    }
    return self;
}
 
- (void)setupViews {


    self.backgroundColor = [UIColor clearColor];
//    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.userInteractionEnabled = YES;
    
    [self addSubview:self.subtractionBtn];
    [self addSubview:self.additionBtn];
    [self addSubview:self.numberView];
    [self addSubview:self.numberLab];
//    [self addSubview:self.tipsLab];
//
    [self.subtractionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.bottom.equalTo(@(0));
        make.leading.equalTo(@0);
        make.width.equalTo(self.subtractionBtn.mas_height).multipliedBy(1);
    }];
//
    [self.additionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.bottom.equalTo(@(0));
        make.trailing.equalTo(@0);
        make.width.equalTo(self.additionBtn.mas_height).multipliedBy(1);

    }];
     
    [self.numberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.bottom.equalTo(@(0));
        make.leading.equalTo(self.subtractionBtn.mas_trailing).offset(2);
        make.trailing.equalTo(self.additionBtn.mas_leading).offset(-2);
 
    }];
    
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.bottom.equalTo(@(0));
        make.leading.equalTo(self.subtractionBtn.mas_trailing).offset(0);
        make.trailing.equalTo(self.additionBtn.mas_leading).offset(0);
 
    }];
 
    self.number = 0;
    self.numberLab.text = @(self.number).stringValue;

    
//    [self.tipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(@(-55));
//        make.height.equalTo(@(30));
//        make.centerX.equalTo(@0);
//
//    }];
//
//    [self.tipsLabBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.equalTo(self.tipsLab.mas_top).offset();
//        make.bottom.equalTo(@(-55));
//        make.height.equalTo(@(30));
////        make.leading.equalTo(self.tipsLab.mas_leading).offset(-16.5);
////        make.trailing.equalTo(self.tipsLab.mas_trailing).offset(16.5);
//        make.leading.equalTo(@37.5);
//        make.trailing.equalTo(@-37.5);
//    }];
//
//    self.detailBtn.backgroundColor = kCOLOR_1D1D1D;
//    self.nextBtn.backgroundColor = kCOLOR_C13030;
    
}

//- (void)setCount:(NSInteger)count {
//    _count = count;
//    NSString *countStr = [NSString stringWithFormat:@"已打包%zi件物品", count];
////    if (self.isTrade) {
////        countStr = [NSString stringWithFormat:@"已选%zi件交易品", count];
////    }
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
//}

 

////穿透
//- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    UIView *hitView = [super hitTest:point withEvent:event];
//    if(hitView == self) {
//        return nil;
//    }
//    return hitView;
//}

- (void)setNumber:(NSInteger)number {
    _number = number;
    self.numberLab.text = @(self.number).stringValue;
}

- (void)clickAdditionBtn:(UIButton *)btn {
  
    NSInteger max = self.max;
    if (self.number < max) {
        self.number += 1;
    } else {
        self.number = max;
    }
    self.numberLab.text = @(self.number).stringValue;

    if (self.delegate && [self.delegate respondsToSelector:@selector(numberViewChangeNumber:)]) {
        [self.delegate numberViewChangeNumber:self.number]; 
    }
}

 
- (void)clickSubtractionBtn:(UIButton *)btn {
 
    NSInteger min = self.min; 
    if (self.number <= min) {
        self.number = min;
    } else {
        self.number -= 1;
    }
    self.numberLab.text = @(self.number).stringValue;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberViewChangeNumber:)]) {
        [self.delegate numberViewChangeNumber:self.number];
    }
}
 

- (UIButton *)additionBtn {
    if (!_additionBtn) {
        _additionBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KWidth / 2, 320)];
//        [_additionBtn setTitle:@"+" forState:UIControlStateNormal];
//        _additionBtn.titleLabel.textColor = [UIColor redColor];
        [_additionBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_additionBtn addTarget:self action:@selector(clickAdditionBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [_additionBtn setImage:[UIImage imageNamed:@"ic_dl_add"] forState:UIControlStateNormal];

    }
    return _additionBtn;
}

- (UIButton *)subtractionBtn {
    if (!_subtractionBtn) {
        _subtractionBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KWidth / 2, 320)];
//        [_subtractionBtn setTitle:@"-" forState:UIControlStateNormal];
        _subtractionBtn.titleLabel.textColor = [UIColor redColor];
        [_subtractionBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_subtractionBtn addTarget:self action:@selector(clickSubtractionBtn:) forControlEvents:UIControlEventTouchUpInside];

        [_subtractionBtn setImage:[UIImage imageNamed:@"ic_dl_reduce"] forState:UIControlStateNormal];
    }
    return _subtractionBtn;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        _numberLab.text = @"0";
        _numberLab.font = [UIFont systemFontOfSize:12.0];
//        _numberLab.textColor = [UIColor whiteColor];
        _numberLab.textAlignment = NSTextAlignmentCenter;
    }
    return _numberLab;
}
//
//- (UIView *)tipsLabBackgroundView {
//    if (!_tipsLabBackgroundView) {
//        _tipsLabBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
////        _tipsLabBackgroundView.backgroundColor = [UIColor blackColor];
//        _tipsLabBackgroundView.backgroundColor = kCOLOR_1D1D1D;
//        _tipsLabBackgroundView.layer.cornerRadius = 15;
//        _tipsLabBackgroundView.layer.masksToBounds = YES;
//    }
//    return _tipsLabBackgroundView;
//}
//

- (UIView *)numberView {
    if (!_numberView) {
        _numberView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
//        _numberView.layer.cornerRadius = 6;
//        _numberView.layer.masksToBounds = YES;
//        _numberView.layer.borderWidth = 2;
//        _numberView.layer.borderColor  = kCOLOR_D9D9D9.CGColor;
    }
    return _numberView;
}
 

 
@end
