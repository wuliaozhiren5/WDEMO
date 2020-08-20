//
//  TagListCell.m
//  gaodengDemo
//
//  Created by Sun on 2020/7/11.
//  Copyright © 2020 Sun. All rights reserved.
//

#import "TagListCell.h"
@interface TagListCell ()
@property (nonatomic, strong) UILabel *tagLabel;
@property (nonatomic, strong) UIView *line;
//@property (nonatomic, strong) UIButton *tagBtn;

@end

@implementation TagListCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        if (!self.textHighlightColor) {
            self.textHighlightColor = [UIColor whiteColor];
        }
        if (!self.textDefaultColor) {
            self.textDefaultColor = [UIColor blackColor];
        }
        if (!self.textHighBackgroundColor) {
            
            self.textHighBackgroundColor = [UIColor blueColor];
        }
    }
    return self;
}

- (void)setTextHighlightColor:(UIColor *)textHighlightColor{
    if (textHighlightColor) {
        _textHighlightColor = textHighlightColor;
        
    }
}
- (void)setTextDefaultColor:(UIColor *)textDefaultColor{
    if (textDefaultColor) {
        _textDefaultColor = textDefaultColor;

    }
}
- (void)setTextHighBackgroundColor:(UIColor *)textHighBackgroundColor{
    if (textHighBackgroundColor) {
        _textHighBackgroundColor = textHighBackgroundColor;

    }
}
 
-(void)setTagStr:(NSString *)tagStr{
    
    _tagStr = tagStr;
//    self.tagLabel.text = tagStr;
//    self.tagLabel.frame = self.contentView.bounds;
    [self.tagBtn setTitle:tagStr forState:UIControlStateNormal];
 

}

-(void)setIsHideLine:(BOOL)isHideLine{
    _isHideLine = isHideLine;
    self.line.hidden = _isHideLine;
    
    if (_isHideLine) {
        [_tagBtn setTitleColor:self.textDefaultColor  forState:UIControlStateNormal];
    } else {
        [_tagBtn setTitleColor:self.textHighlightColor forState:UIControlStateNormal];
    }
}

-(UILabel *)tagLabel {

    if (!_tagLabel) {
        _tagLabel = [[UILabel alloc]initWithFrame:self.contentView.bounds];
        _tagLabel.frame = self.contentView.bounds;
        _tagLabel.font = [UIFont systemFontOfSize:12.0];
        _tagLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_tagLabel];
//        [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(self.contentView);
//        }];
    }
    return _tagLabel;
}

-(UIView *)line {
    
    if (!_line) {
        _line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 28)];
        _line.backgroundColor = self.textHighBackgroundColor;
        _line.layer.cornerRadius = 14;
        _line.layer.masksToBounds = YES;
        [self.contentView addSubview:_line];
        
        _line.center = self.contentView.center;
//        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self.contentView);
//        }];
    }
    [self.contentView sendSubviewToBack:_line];

    return _line;
}

-(UIButton *)tagBtn {
    
    if (!_tagBtn) {
        _tagBtn = [[UIButton alloc]init];
        _tagBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:_tagBtn];
        _tagBtn.frame = self.contentView.bounds;
        _tagBtn.center = self.contentView.center;

//        [_tagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(self.contentView);
//        }];
        [_tagBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_tagBtn addTarget:self action:@selector(clickCell) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tagBtn;
}
//
//-(void) clickCell {
//
//
//}

@end
