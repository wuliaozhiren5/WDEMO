//
//  PersonalCenterBar.m
//  xxx
//
//  Created by xxx on 16/12/7.
//  Copyright © 2016年 developer. All rights reserved.
//
#define lineWidth 80.0
#define lineHeight 2.0
#import "PersonalCenterBar.h"
#import "PersonalCenterBarBtn.h"
@interface PersonalCenterBar ()
@property(nonatomic,strong)NSMutableArray *btnArr;
@property(nonatomic,strong)UIColor *normalColor;
@property(nonatomic,strong)UIColor *highlightedColor;
@property(nonatomic,strong)UIView  *bottomline;
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)UIView  *movingView;

@property(nonatomic,strong)UIFont  *normalTitleFont;
@property(nonatomic,strong)UIFont  *highlightedTitleFont;

@property(nonatomic,strong)UIColor *moveLineColor;
@property(nonatomic,assign)CGFloat moveLineWidth;
@property(nonatomic,strong)UIColor *bottomLineColor;
@property(nonatomic,assign)CGFloat bottomLineHeight;
@end
@implementation PersonalCenterBar

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
              NormalTitleFont:(UIFont *)normalTitleFont
         HighlightedTitleFont:(UIFont *)highlightedTitleFont
                MoveLineColor:(UIColor *)moveLineColor
                MoveLineWidth:(CGFloat)moveLineWidth
              BottomLineColor:(UIColor *)bottomLineColor
             BottomLineHeight:(CGFloat)bottomLineHeight; {
    
    self = [super initWithFrame:frame];
    if (self) {
        if (titleArr && titleArr.count>0) {
            _titleArr = titleArr;
            _btnArr = [NSMutableArray array];
            _normalColor = [UIColor whiteColor];
            _highlightedColor = [UIColor blackColor];
            _normalTitleFont = [UIFont systemFontOfSize:16.0];
            _highlightedTitleFont = [UIFont systemFontOfSize:16.0];
            _moveLineColor = [UIColor blackColor];
            _moveLineWidth = lineWidth;
            _bottomLineColor = [UIColor grayColor];
            _bottomLineHeight = 0.5;
            
            if (normalColor) {
                _normalColor = normalColor;
            }
            if (highlightedColor) {
                _highlightedColor = highlightedColor; 
            }
            if (normalTitleFont) {
                _normalTitleFont = normalTitleFont;
            }
            if (highlightedTitleFont) {
                _highlightedTitleFont = highlightedTitleFont;
            }
            if (moveLineColor) {
                _moveLineColor = moveLineColor;
            }
            if (moveLineWidth > 0) {
                _moveLineWidth = moveLineWidth;
            }
            if (bottomLineColor) {
                _bottomLineColor = bottomLineColor;
            }
            if (bottomLineHeight > 0) {
                _bottomLineHeight = bottomLineHeight;
            }
            
            [titleArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                NSString *str = obj;
                PersonalCenterBarBtn *btn = [[PersonalCenterBarBtn alloc]initWithFrame:CGRectMake((frame.size.width/titleArr.count) * idx,0, (frame.size.width/titleArr.count), frame.size.height) Title:str TitleFont:_normalTitleFont];
                btn.tag = idx;
                btn.titleLabel.textColor = normalColor;
                [btn addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:btn];
                
                [_btnArr addObject:btn];
            }];
            
            _bottomline = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height - _bottomLineHeight, frame.size.width, _bottomLineHeight)];
            _bottomline.backgroundColor = _bottomLineColor;
            [self addSubview:_bottomline];
            
            _movingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _moveLineWidth, lineHeight)];
            _movingView.backgroundColor = _moveLineColor;
            [self addSubview:_movingView];
            PersonalCenterBarBtn *firstbtn = _btnArr.firstObject;
            _movingView.center = CGPointMake(firstbtn.center.x, frame.size.height-lineHeight/2);
            firstbtn.titleLabel.textColor = _highlightedColor;
            firstbtn.titleLabel.font = _highlightedTitleFont;

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
    oldBtn.titleLabel.font  = _normalTitleFont;

    PersonalCenterBarBtn *newbtn = _btnArr[index];
    newbtn.titleLabel.textColor = _highlightedColor;
    newbtn.titleLabel.font  = _highlightedTitleFont;

    _selectIndex = index;
    
    [UIView animateWithDuration:0.2 animations:^{
        _movingView.center = CGPointMake(newbtn.center.x, _movingView.center.y);
    }];
    
    if (_delegate && [_delegate respondsToSelector:@selector(personalCenterBar:changeBarIndex:)]) {
        
        [_delegate personalCenterBar:self changeBarIndex:_selectIndex];
    }
}

- (void)setSelectIndex:(NSInteger)selectIndex{
    
    NSInteger index = selectIndex;
    
    PersonalCenterBarBtn *oldBtn = _btnArr[_selectIndex];
    oldBtn.titleLabel.textColor  = _normalColor;
    
    PersonalCenterBarBtn *newbtn = _btnArr[index];
    newbtn.titleLabel.textColor = _highlightedColor;
    
    _selectIndex = index;
    
    [UIView animateWithDuration:0.2 animations:^{
        _movingView.center = CGPointMake(newbtn.center.x, _movingView.center.y);
    }];
    
}

- (void)setTipIndex:(NSInteger)tipIndex{
    
    NSString *str = _titleArr[tipIndex];
    PersonalCenterBarBtn *btn = _btnArr[tipIndex];
    
    NSMutableAttributedString *attributedString=[[NSMutableAttributedString alloc]initWithString:str attributes:@{NSFontAttributeName:btn.titleLabel.font}];
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed: @"startIcon"];
    attachment.bounds = CGRectMake(0,10, 5, 5);
    
    [attributedString appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
    
    btn.titleLabel.attributedText = attributedString;
     
}

- (void)setHiddenTipIndex:(NSInteger)hiddenTipIndex{
    
    NSString *str = _titleArr[hiddenTipIndex];
    PersonalCenterBarBtn *btn = _btnArr[hiddenTipIndex];
    
    NSMutableAttributedString *attributedString=[[NSMutableAttributedString alloc]initWithString:str attributes:@{NSFontAttributeName:btn.titleLabel.font}];
    
    btn.titleLabel.attributedText = attributedString;
}

-(void)setHiddenLine:(BOOL)hiddenLine {
    _hiddenLine = hiddenLine;
    _bottomline.hidden = _hiddenLine;
}
@end
