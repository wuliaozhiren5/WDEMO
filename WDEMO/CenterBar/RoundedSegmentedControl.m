//
//  RoundedSegmentedControl.m
//  xxx
//
//  Created by xxx on 17/4/18.
//  Copyright © 2017年 developer. All rights reserved.
//

#import "RoundedSegmentedControl.h"
#import "PersonalCenterBarBtn.h"

@interface RoundedSegmentedControl ()
@property(nonatomic,strong)NSMutableArray *btnArr;
@property(nonatomic,strong)UIColor *normalColor;
@property(nonatomic,strong)UIColor *highlightedColor;
@property(nonatomic,strong)UIColor *movingViewbgColor;
//@property(nonatomic,strong)UIView  *bottomline;
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)UIImageView *movingView;
@end
@implementation RoundedSegmentedControl

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame
                   TitleArray:(NSArray *)titleArr
                  NormalColor:(UIColor *)normalColor
             HighlightedColor:(UIColor *)highlightedColor
    MovingViewBackgroundColor:(UIColor *)movingViewbgColor {
    self = [super initWithFrame:frame];
    if (self) {
        if (titleArr && titleArr.count>0) {
            _titleArr = titleArr;
            _btnArr = [NSMutableArray array];
            _normalColor = [UIColor whiteColor];
            _highlightedColor = [UIColor orangeColor];
            _movingViewbgColor = [UIColor orangeColor];
            if (normalColor) {
                _normalColor = normalColor;
            }
            if (highlightedColor) {
                _highlightedColor = highlightedColor;
            }
            if (movingViewbgColor) {
                _movingViewbgColor = movingViewbgColor;
            }
            
            self.layer.cornerRadius = frame.size.height/2;
            self.layer.masksToBounds = YES;
            self.layer.borderColor = _movingViewbgColor.CGColor;
            self.layer.borderWidth = 1.0;
            
            [titleArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                NSString *str = obj;
                PersonalCenterBarBtn *btn = [[PersonalCenterBarBtn alloc]initWithFrame:CGRectMake((frame.size.width/titleArr.count) * idx,0, (frame.size.width/titleArr.count), frame.size.height) Title:str TitleFont:[UIFont systemFontOfSize:16]];
                btn.tag = idx;
                btn.titleLabel.textColor = normalColor;
                [btn addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:btn];
                
                [_btnArr addObject:btn];
            }];
            
            _movingView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (frame.size.width/titleArr.count), frame.size.height)];
            _movingView.backgroundColor = _movingViewbgColor;
            _movingView.layer.cornerRadius = _movingView.frame.size.height/2;
            _movingView.layer.masksToBounds = YES;
            [self addSubview:_movingView];
            [self sendSubviewToBack:_movingView];
            PersonalCenterBarBtn *firstbtn = _btnArr.firstObject;
            _movingView.center = firstbtn.center;
            firstbtn.titleLabel.textColor = _highlightedColor;
            
            _selectIndex = 0;
            
        }
    }
    return self;
    
}

- (void)changeView:(UIControl *)sender{
    
    NSInteger index = sender.tag;
    
    if (index == _selectIndex) {
        return;
    }
    
    PersonalCenterBarBtn *oldBtn = _btnArr[_selectIndex];
    oldBtn.titleLabel.textColor  = _normalColor;
    
    PersonalCenterBarBtn *newbtn = _btnArr[index];
    newbtn.titleLabel.textColor = _highlightedColor;
    
    _selectIndex = index;
    
    [UIView animateWithDuration:0.2 animations:^{
        _movingView.center = newbtn.center;
    }];
    
    if (_delegate && [_delegate respondsToSelector:@selector(roundedSegmentedControl:changeBarIndex:)]) {
        
        [_delegate roundedSegmentedControl:self changeBarIndex:_selectIndex];
    }
}

@end
