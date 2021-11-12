//
//  RRSeasonSeniorCommentsSinglePhotoCollectionViewCell.m
//  NJVideo
//
//  Created by rrtv on 2021/11/8.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsSinglePhotoCollectionViewCell.h"

@interface RRSeasonSeniorCommentsSinglePhotoCollectionViewCell ()
//@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation RRSeasonSeniorCommentsSinglePhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.imageView];
//    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@(0));
//        make.bottom.equalTo(@(0));
//        make.leading.equalTo(@(0));
//        make.trailing.equalTo(@(0));
//    }];
    
    self.contentView.layer.cornerRadius = 4;
    self.contentView.layer.masksToBounds = YES;
}

- (void)setModel:(RRSeniorCommentsImageModel *)model {
    _model = model;
//    [self.imageView rr_downloadImageWithURLString:model.url placeholderImage:KplaceholderImg];
    
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    NSInteger modelImageWidth = model.width;
    NSInteger modelImageHeight = model.height;
    NSInteger showImageWidth = width;
    NSInteger showImageHeight = height;
    
    CGFloat orginY = 0;
    //图片尺寸转变，图片的宽width = 屏幕点宽，计算出图片的高height
    showImageHeight = showImageWidth * modelImageHeight / modelImageWidth;
    if (showImageHeight <= height) {
        showImageHeight = height;
    } else {
        //图片居中
//        orginY = -(showImageHeight - height) / 2.0;
    }
    self.imageView.frame = CGRectMake(0, orginY, showImageWidth, showImageHeight);
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
//        _imageView.clipsToBounds = YES;
//        _imageView.layer.cornerRadius = 4;
//        _imageView.layer.masksToBounds = YES;
        _imageView.backgroundColor = [UIColor blackColor];
        }
    return _imageView;
}

@end
