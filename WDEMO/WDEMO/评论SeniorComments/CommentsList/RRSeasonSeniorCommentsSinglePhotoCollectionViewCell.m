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
    CGFloat cellwidth = self.size.width;
    CGFloat cellheight = self.size.height;
    CGFloat width = model.width;
    CGFloat height = model.height;
    CGFloat showWidth = 0;
    CGFloat showHeight = 0;
 
    CGFloat orginX = 0;
    CGFloat orginY = 0;
    
    if (width > height) {
        //居中上下可以有黑边，左右不能有黑便
        showWidth = cellwidth;
        showHeight = showWidth * height / width;
        orginX = 0;
        orginY = (cellheight - showHeight) / 2.0;
        
    } else if (width < height) {
        showWidth = cellwidth;
        showHeight = showWidth * height / width;
        orginX = 0;
        orginY = 0;
        
    } else {
        showWidth = cellwidth;
        showHeight = cellheight;
        orginX = 0;
        orginY = 0;
        
    }
    self.imageView.frame = CGRectMake(orginX, orginY, showWidth, showHeight);
//    [self.imageView rr_downloadImageWithURLString:model.url placeholderImage:KplaceholderImg];
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
