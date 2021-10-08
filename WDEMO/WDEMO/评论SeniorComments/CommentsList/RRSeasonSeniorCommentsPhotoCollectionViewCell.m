//
//  RRSeasonSeniorCommentsPhotoCollectionViewCell.m
//  NJVideo
//
//  Created by rrtv on 2021/7/27.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsPhotoCollectionViewCell.h"
@interface RRSeasonSeniorCommentsPhotoCollectionViewCell ()
//@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation RRSeasonSeniorCommentsPhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.bottom.equalTo(@(0));
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
    }];
}

- (void)setModel:(RRSeniorCommentsImageModel *)model {
    _model = model;
//    [self.imageView rr_downloadImageWithURLString:model.url placeholderImage:KplaceholderImg];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _imageView.backgroundColor = [UIColor grayColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        _imageView.layer.cornerRadius = 4;
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
}

@end
