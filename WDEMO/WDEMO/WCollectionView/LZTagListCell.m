//
//  LZTagListCell.m
//  xxx
//
//  Created by xxx on 2017/10/30.
//  Copyright © 2017年 developer. All rights reserved.
//
#import "LZTagListCell.h"
@interface LZTagListCell ()
@property (nonatomic, strong) UILabel *tagLabel;
@property (nonatomic, strong) UIView *line;
//@property (nonatomic, strong) UIButton *tagBtn;

@end
@implementation LZTagListCell
 
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.tagBtn];
        [self.contentView addSubview:self.line];
//        [self.contentView addSubview:self.tagLabel];
 
    }
    return self;
}

-(void)setTagStr:(NSString *)tagStr{
    
    _tagStr = tagStr;
    
    //显示label
//    self.tagLabel.text = tagStr;
//    self.tagLabel.frame = self.contentView.bounds;
    
//    self.tagLabel.text = tagStr;
//    self.tagLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//    self.contentView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//
//    if (_isUserSelected) {
//        self.tagLabel.textColor = [UIColor whiteColor];
//        self.tagLabel.font = [UIFont systemFontOfSize:12.0];
//        [UIView animateWithDuration:0.5
//                              delay:0.1
//                            options:UIViewAnimationOptionCurveEaseInOut
//                         animations:^{
//            self.tagLabel.font = [UIFont systemFontOfSize:20.0];
//
//
//            [self setNeedsLayout];
//            [self layoutIfNeeded];
//
//            self.contentView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//
//        } completion:nil];
//
//    } else {
//        self.tagLabel.textColor = [UIColor blackColor];
//        self.tagLabel.font = [UIFont systemFontOfSize:12.0];
//    }
    
    //显示btn
    [_tagBtn setTitle:tagStr forState:UIControlStateNormal];
//    [_tagBtn sizeToFit];
//    _tagBtn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    if (_isUserSelected) {
        [_tagBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _tagBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [_tagBtn sizeToFit];
        _tagBtn.frame = CGRectMake((self.frame.size.width - _tagBtn.frame.size.width) / 2, 0, _tagBtn.frame.size.width, self.frame.size.height);
        
         [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
             _tagBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
             [_tagBtn sizeToFit];
             _tagBtn.frame = CGRectMake((self.frame.size.width - _tagBtn.frame.size.width) / 2, 0, _tagBtn.frame.size.width, self.frame.size.height);
        } completion:nil];
    } else {
        [_tagBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _tagBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [_tagBtn sizeToFit];
        _tagBtn.frame = CGRectMake((self.frame.size.width - _tagBtn.frame.size.width) / 2, 0, _tagBtn.frame.size.width, self.frame.size.height);
 
    }
}

- (void)setIsUserSelected:(BOOL)isUserSelected {
    _isUserSelected = isUserSelected;
}

//- (void)setIsHideLine:(BOOL)isHideLine{
//    _isHideLine = isHideLine;
////    self.line.hidden = _isHideLine;
////
////    if (_isHideLine) {
////        [_tagBtn setTitleColor:[UIColor blackColor]  forState:UIControlStateNormal];
////    } else {
////        [_tagBtn setTitleColor:[UIColor whiteColor]  forState:UIControlStateNormal];
////    }
////
////    self.line.hidden = YES;
//}

-(UILabel *)tagLabel {

    if (!_tagLabel) {
        _tagLabel = [[UILabel alloc]initWithFrame:self.contentView.bounds];
        _tagLabel.frame = self.contentView.bounds; 
        _tagLabel.font = [UIFont systemFontOfSize:12.0];
        _tagLabel.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:_tagLabel];
//        [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(self.contentView);
//        }];
    }
    return _tagLabel;
}

-(UIView *)line {
    
    if (!_line) {
        _line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 28)];
        _line.backgroundColor = [UIColor blueColor];
        _line.layer.cornerRadius = 14;
        _line.layer.masksToBounds = YES;
//        [self.contentView addSubview:_line];
        _line.center = self.contentView.center;
        _line.hidden = YES;

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
//        [self.contentView addSubview:_tagBtn];
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
