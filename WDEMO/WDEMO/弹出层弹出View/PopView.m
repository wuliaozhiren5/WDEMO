//
//  PopView.m
//  WDEMO
//
//  Created by aimeiju on 2022/7/21.
//  Copyright © 2022 wwc. All rights reserved.
//

#import "PopView.h"

@implementation PopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        
    }
    return self;
}

- (void)setupViews {
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    [self addSubview:self.control];
    [self addSubview:self.container];
//    [self.container addSubview:self.closeBtn];
//    [self.container addSubview:self.allBoxBtn];
//    [self.container addSubview:self.nowBoxBtn];
//    [self.container addSubview:self.listView];

    [self.control mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.bottom.equalTo(self);
    }];
    
//    CGFloat btnWidth = 50.0 / 375.0 * KWidth;
//    CGFloat boxBtnWidth = ((KWidth - 22.5 * 2) - (50.0 / 375.0 * KWidth))/2.0;

    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.bottom.equalTo(@0);
        make.height.equalTo(self.container.mas_width).multipliedBy(500.0 / 375.0);
    }];
    
//    self.container.backgroundColor = [UIColor yellowColor];
 
//    [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(@0);
//        make.leading.equalTo(@0);
//        make.trailing.equalTo(@0);
//        make.height.equalTo(@(450));
//    }];
//
//    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@3);
//        make.trailing.equalTo(@0);
//        make.width.equalTo(@(btnWidth));
//        make.height.equalTo(@(btnWidth));
//
//    }];
//
//    [self.allBoxBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@3);
//        make.leading.equalTo(@0);
//        make.width.equalTo(@(boxBtnWidth));
//        make.height.equalTo(@(btnWidth));
//    }];
//
//    [self.nowBoxBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@3);
//        make.leading.equalTo(self.allBoxBtn.mas_trailing).offset(0);
//        make.width.equalTo(@(boxBtnWidth));
//        make.height.equalTo(@(btnWidth));
//    }];
//
//    self.listView.backgroundColor = [UIColor blackColor];
    
   
}

//- (void)setSelectIndex:(NSInteger)selectIndex {
////    if (_selectIndex == selectIndex) {
////        return;
////    }
//    _selectIndex = selectIndex;
//
//    if (_selectIndex == 0) {
//        _allBoxBtn.selected = YES;
//        _nowBoxBtn.selected = NO;
//
//        [self.listView addSubview:self.allBoxWinningRecordVC.view];
//        [self.allBoxWinningRecordVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(@3);
//            make.bottom.equalTo(@-3);
//            make.leading.equalTo(@0);
//            make.trailing.equalTo(@0);
//        }];
////        _allBoxWinningRecordVC.view.hidden = NO;
////
////        if (_nowBoxWinningRecordVC) {
////            _nowBoxWinningRecordVC.view.hidden = YES;
////        }
//    } else {
//        _allBoxBtn.selected = NO;
//        _nowBoxBtn.selected = YES;
//
//        [self.listView addSubview:self.nowBoxWinningRecordVC.view];
//        [self.nowBoxWinningRecordVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(@3);
//            make.bottom.equalTo(@-3);
//            make.leading.equalTo(@0);
//            make.trailing.equalTo(@0);
//        }];
//    }
//}

- (void)clickControl:(UIControl *)control {
    [self close];
}

- (void)clickCloseBtn:(UIButton *)btn {
    [self close];
}

//- (void)clickTabBtn:(UIButton *)btn {
//    NSInteger selectIndex = btn.tag;
//    self.selectIndex = selectIndex;
//}

- (void)close {
    [self hidden];
}

- (void)showInView:(UIView *)view {
     
    if (!view) {
        return;
    }
    [view addSubview:self];
    
//    self.container.frame = CGRectMake(0, KHeight, KWidth, KHeight - playerViewHeight());
    self.alpha = 0;
    [UIView animateWithDuration:0.25
                     animations:^{
//        self.container.frame = CGRectMake(0, playerViewHeight(), KWidth, KHeight - playerViewHeight());
        self.alpha = 1;
    }];
}

- (void)hidden {
 
    self.alpha = 1;
    [UIView animateWithDuration:0.25
                     animations:^{
        self.alpha = 0;
    }
                     completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

//layz
- (UIControl *)control {
    if (!_control) {
        _control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth)];
        [_control addTarget:self action:@selector(clickControl:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _control;
}

- (UIView *)container {
    if (!_container) {
        _container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth)];
//        _container.layer.cornerRadius = 0;
//        _container.layer.masksToBounds = YES;
//        _container.layer.borderWidth = 3;
//        _container.layer.borderColor = [UIColor whiteColor].CGColor;
        
    }
    return _container;
}

//- (UIView *)listView {
//    if (!_listView) {
//        _listView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth)];
//        _listView.layer.cornerRadius = 0;
//        _listView.layer.masksToBounds = YES;
//        _listView.layer.borderWidth = 3;
//        _listView.layer.borderColor = [UIColor whiteColor].CGColor;
//
//    }
//    return _listView;
//}
//
//- (UIButton *)allBoxBtn {
//    if (!_allBoxBtn) {
//        _allBoxBtn = [[UIButton alloc] init];
//        [_allBoxBtn setTitle:@"全部记录" forState:UIControlStateNormal];
//        [_allBoxBtn addTarget:self action:@selector(clickTabBtn:) forControlEvents:UIControlEventTouchUpInside];
//        [_allBoxBtn setBackgroundImage:[UIImage imageNamed:@"ic_black_record"] forState:UIControlStateNormal];
//        [_allBoxBtn setBackgroundImage:[UIImage imageNamed:@"ic_blue_record"] forState:UIControlStateSelected];
//        [_allBoxBtn setBackgroundImage:[UIImage imageNamed:@"ic_blue_record"] forState: UIControlStateHighlighted | UIControlStateSelected];
//        _allBoxBtn.selected = YES;
//        _allBoxBtn.tag = 0;
//
//     }
//    return _allBoxBtn;
//}
//
//- (UIButton *)nowBoxBtn {
//    if (!_nowBoxBtn) {
//        _nowBoxBtn = [[UIButton alloc] init];
//        [_nowBoxBtn setTitle:@"我的记录" forState:UIControlStateNormal];
//        [_nowBoxBtn addTarget:self action:@selector(clickTabBtn:) forControlEvents:UIControlEventTouchUpInside];
//        [_nowBoxBtn setBackgroundImage:[UIImage imageNamed:@"ic_black_record"] forState:UIControlStateNormal];
//        [_nowBoxBtn setBackgroundImage:[UIImage imageNamed:@"ic_blue_record"] forState:UIControlStateSelected];
//        [_nowBoxBtn setBackgroundImage:[UIImage imageNamed:@"ic_blue_record"] forState: UIControlStateHighlighted | UIControlStateSelected];
//        _nowBoxBtn.selected = NO;
//        _nowBoxBtn.tag = 1;
//     }
//    return _nowBoxBtn;
//}
//
//- (UIButton *)closeBtn {
//    if (!_closeBtn) {
//        _closeBtn = [[UIButton alloc] init];
//        [_closeBtn setImage:[UIImage imageNamed:@"ic_close"] forState:UIControlStateNormal];
//        [_closeBtn setBackgroundImage:[UIImage imageNamed:@"close__blod"] forState:UIControlStateNormal];
//        [_closeBtn addTarget:self action:@selector(clickCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
//
//     }
//    return _closeBtn;
//}
//
//- (MWSLuandouWinningRecordVC *)allBoxWinningRecordVC {
//    if (!_allBoxWinningRecordVC) {
//        _allBoxWinningRecordVC = [[MWSLuandouWinningRecordVC alloc] init];
//        _allBoxWinningRecordVC.activeId = self.activeId;
//        _allBoxWinningRecordVC.bagId = self.bagId;
////        _allBoxWinningRecordVC.isAll = YES;
//    }
//    return _allBoxWinningRecordVC;
//}
//
//- (MWSActiveLotteryScuffleVC *)nowBoxWinningRecordVC {
//    if (!_nowBoxWinningRecordVC) {
//        _nowBoxWinningRecordVC = [[MWSActiveLotteryScuffleVC alloc] init];
//        _nowBoxWinningRecordVC.activeId = self.activeId;
//        _nowBoxWinningRecordVC.bagId = self.bagId;
////        _nowBoxWinningRecordVC.isAll = NO;
//    }
//    return _nowBoxWinningRecordVC;
//}

@end
