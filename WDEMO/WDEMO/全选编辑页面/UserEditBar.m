//
//  UserEditBar.m
//  WDEMO
//
//  Created by rrtv on 2020/12/29.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "UserEditBar.h"
#import "WMacros.h"
@interface UserEditBar ()
@property (nonatomic, strong) UIView *topLine;//顶线
@property (nonatomic, strong) UIView *centerLine;//中线
@property (nonatomic, strong) UIButton *selectBtn;//全选/取消全选
@property (nonatomic, strong) UIButton *deleteBtn;//删除
@property (nonatomic, assign) CGFloat btnHeight;//按钮高度

@end
@implementation UserEditBar

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _btnHeight = 53;
        self.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.selectBtn];
    [self addSubview:self.deleteBtn];
    [self addSubview:self.centerLine];
    [self addSubview:self.topLine];
    
}

- (void)reset {
    self.selectBtn.selected = NO;
    self.deleteBtn.enabled = NO;
}

- (void)isAllSelected:(BOOL)isAll {
    self.selectBtn.selected = isAll;
}

- (void)deleteCount:(NSInteger)count {
    if (count > 0) {
        self.deleteBtn.enabled = YES;
        NSString *str = [NSString stringWithFormat:@"删除(%zi)", count];
        [_deleteBtn setTitle:str forState:UIControlStateNormal];
    } else {
        self.deleteBtn.enabled = NO;
    }
}

//全选/取消全选
- (void)clickSelectBtn:(UIButton *)btn {
    BOOL isSelected = !btn.isSelected;
    //全选：YES
    //取消全选：NO
    btn.selected = isSelected;
    //    self.bingWatcgVC.isUserEditing = isSelected;
    
    //    [self deleteCount:11];
    
    if (self.selectClick) {
        self.selectClick(isSelected);
    }
}

//删除
- (void)clickDeleteBtn:(UIButton *)btn {
    if (self.deleteClick) {
        self.deleteClick();
    }
}

- (UIView *)topLine {
    if (!_topLine) {
        _topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 0.5)];
        //        _topLine.backgroundColor = [UIColor blackColor];
        _topLine.backgroundColor = kCOLOR_dynamicProvider_CACBCC_414141;
    }
    return _topLine;
}

- (UIView *)centerLine {
    if (!_centerLine) {
        _centerLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, 20)];
        //        _centerLine.backgroundColor = [UIColor blackColor];
        _centerLine.backgroundColor = kCOLOR_dynamicProvider_CACBCC_414141;
        _centerLine.center = CGPointMake(self.center.x, _btnHeight/2);
    }
    return _centerLine;
}

- (UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KWidth/2, _btnHeight)];
        [_selectBtn addTarget:self action:@selector(clickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
        _selectBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_selectBtn setTitle:@"全选" forState:UIControlStateNormal];
        [_selectBtn setTitle:@"取消全选" forState:UIControlStateSelected];
        [_selectBtn setTitleColor:kCOLOR_dynamicProvider_222222_E5E7EB forState:UIControlStateNormal];
        [_selectBtn setTitleColor:kCOLOR_dynamicProvider_222222_E5E7EB forState:UIControlStateSelected];
    }
    return _selectBtn;
}

- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(KWidth/2, 0, KWidth/2, _btnHeight)];
        [_deleteBtn addTarget:self action:@selector(clickDeleteBtn:) forControlEvents:UIControlEventTouchUpInside];
        _deleteBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteBtn setTitle:@"删除" forState:UIControlStateDisabled];
        //        [_deleteBtn setTitle:@"删除()" forState:UIControlStateSelected];
        [_deleteBtn setTitleColor:kCOLOR_FF617B forState:UIControlStateNormal];
        [_deleteBtn setTitleColor:kCOLOR_CBCDD4 forState:UIControlStateDisabled];
        //        [_deleteBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        //不可编辑
        _deleteBtn.enabled = NO;
    }
    return _deleteBtn;
}
@end
