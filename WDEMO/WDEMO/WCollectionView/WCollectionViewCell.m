//
//  WCollectionViewCell.m
//  WDEMO
//
//  Created by rrtv on 2020/7/21.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "WCollectionViewCell.h"

@implementation WCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
 
    }
    return self;
}

-(UILabel *)titleLabel {

    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:self.contentView.bounds];
        _titleLabel.frame = self.contentView.bounds;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:12.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.frame = CGRectMake(10, 10, 50, 50);
        [self.contentView addSubview:_titleLabel];
//        [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(self.contentView);
//        }];
    }
    return _titleLabel;
}
@end
 
