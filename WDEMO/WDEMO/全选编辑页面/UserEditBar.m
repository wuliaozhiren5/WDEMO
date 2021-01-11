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
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIButton *selectBtn;//全选/取消全选
@property (nonatomic, strong) UIButton *deleteBtn;//删除
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
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.selectBtn];
    [self addSubview:self.deleteBtn];
    [self addSubview:self.line];
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

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, 20)];
        _line.backgroundColor = [UIColor blackColor];
        _line.center = self.center;
    }
    return _line;
}

- (UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2, self.frame.size.height)];
        [_selectBtn addTarget:self action:@selector(clickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
////        _editBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_selectBtn setTitle:@"全选" forState:UIControlStateNormal];
        [_selectBtn setTitle:@"取消全选" forState:UIControlStateSelected];
        [_selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    }
    return _selectBtn;
}

- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, self.frame.size.height)];
        [_deleteBtn addTarget:self action:@selector(clickDeleteBtn:) forControlEvents:UIControlEventTouchUpInside];
//        _editBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteBtn setTitle:@"删除" forState:UIControlStateDisabled];
//        [_deleteBtn setTitle:@"删除()" forState:UIControlStateSelected];
        [_deleteBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_deleteBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
//        [_deleteBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        //不可编辑
        _deleteBtn.enabled = NO;
    }
    return _deleteBtn;
}
@end
