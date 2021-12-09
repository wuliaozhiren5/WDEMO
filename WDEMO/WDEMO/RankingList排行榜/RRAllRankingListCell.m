//
//  RRAllRankingListCell.m
//  WDEMO
//
//  Created by rrtv on 2021/10/20.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRAllRankingListCell.h"
#import "RRAllRankingTagCell.h"

@interface RRAllRankingListCell () //<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation RRAllRankingListCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    self.contentView.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
 
    CGFloat top = 20;
    CGFloat leading = 16;
    CGFloat trailing = -16;
    CGFloat scale = 686.0 / 260;
    CGFloat coverScale = 1.0 / 1.3;
    CGFloat width = KWidth - leading * 2;
    CGFloat coverHeight = width / scale;
    CGFloat coverWidth = coverScale * coverHeight;
//    CGFloat photoHeight = ceil(coverHeight);
//    CGFloat photoWidth = ceil(width - coverWidth - 8);
//    CGFloat spacing = 10;
//    CGFloat titleHeight = 27;
//    CGFloat currentHeight = top + coverHeight + titleHeight;
    
    [self.contentView addSubview:self.coverImgV];
    [self.coverImgV addSubview:self.followBtn];
    [self.contentView addSubview:self.photoView];
    [self.photoView addSubview:self.photoBackgroundImgV];
    [self.photoView addSubview:self.banner];
    [self.contentView addSubview:self.numberIconImgV];
    [self.numberIconImgV addSubview:self.numberLab];
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.countIconImgV];
    [self.contentView addSubview:self.countLab];
    [self.contentView addSubview:self.collectionView];
    [self.contentView addSubview:self.commentLab];
    [self.contentView addSubview:self.line];
    
    //抗压缩
    [self.titleLab setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self.countLab setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.coverImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(top));
        make.leading.equalTo(@(leading));
        make.width.equalTo(@(coverWidth));
        make.height.equalTo(@(coverHeight));
    }];
    
    [self.photoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(top));
        make.leading.equalTo(self.coverImgV.mas_trailing).offset(8);
        make.trailing.equalTo(@(trailing));
        make.height.equalTo(@(coverHeight));
    }];
    
    [self.photoBackgroundImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.photoView);
    }];
    
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.leading.equalTo(@0);
        make.width.equalTo(@25);
        make.height.equalTo(@25);
    }];
    
    [self.numberIconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImgV.mas_bottom).offset(7);
        make.leading.equalTo(@(leading));
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.numberIconImgV);
    }];
    
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.numberIconImgV.mas_centerY).offset(1);
        make.trailing.equalTo(@(-19));
        make.height.equalTo(@20);
    }];
    
    [self.countIconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.numberIconImgV);
        make.trailing.equalTo(self.countLab.mas_leading).offset(-3);
        make.width.equalTo(@15);
        make.height.equalTo(@15);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.numberIconImgV);
        make.leading.equalTo(self.numberIconImgV.mas_trailing).offset(11);
        make.trailing.lessThanOrEqualTo(self.countIconImgV.mas_leading).offset(-11);
        make.height.equalTo(@20);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(self.commentLab.mas_bottom).offset(8);
        make.bottom.equalTo(@0);
        make.leading.equalTo(@8);
        make.trailing.equalTo(@-8);
        //线的高度
        make.height.equalTo(@(1.0f / [UIScreen mainScreen].scale));
    }];
}

- (void)setModel:(RRAllRankingModel *)model {
    _model = model;
    
    CGFloat top = 20;
    CGFloat leading = 16;
//    CGFloat trailing = -16;
    CGFloat scale = 686.0 / 260;
    CGFloat coverScale = 1.0 / 1.3;
    CGFloat width = KWidth - leading * 2;
    CGFloat coverHeight = width / scale;
    CGFloat coverWidth = coverScale * coverHeight;
    CGFloat photoHeight = ceil(coverHeight);
    CGFloat photoWidth = ceil(width - coverWidth - 8);
    CGFloat spacing = 10;
    CGFloat titleHeight = 27;
    CGFloat currentHeight = top + coverHeight + titleHeight;
    
//    [self.coverImgV rr_delaySetImageWithURLString:model.cover placeholderImage:IMAGENAME(@"ranking_cover")];
    self.coverImgV.image = IMAGENAME(@"ranking_cover");
    
    self.followBtn.selected = model.favorite;

    //    NSArray *array = @[@"4.jpg", @"4.jpg", @"4.jpg", @"4.jpg", @"4.jpg"];
    NSArray *imagesArr = [model.imageList valueForKeyPath:@"url"];
    self.banner.frame = CGRectMake(0, 0, photoWidth, photoHeight);
    self.banner.hidden = (imagesArr.count > 0) ? NO : YES;
    @weakify(self)
    self.banner.clickImage = ^(NSInteger index) {
        @strongify(self)
        [self clickImage:index];
    };
    self.banner.slideImage = ^(NSInteger index) {
        @strongify(self)
        [self slideImage:index];
    };
    self.banner.imageArr = imagesArr;

//    UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
//    [self.banner addGestureRecognizer:tapGesturRecognizer];
    
    self.titleLab.text = model.title;
    
    NSString *iconNameStr = @"ic_home_star_h_24";
    NSString *countStr = model.sortValue;
    self.countIconImgV.hidden = NO;
    self.countLab.hidden = NO;
    if ([model.sortType isEqualToString:@"SEARCH"]) {
        iconNameStr = @"ic_home_search_h_24";
    } else if ([model.sortType isEqualToString:@"HOT"]) {
        iconNameStr = @"ic_home_hot_h_24";
    } else if ([model.sortType isEqualToString:@"SCORE"]) {
        iconNameStr = @"ic_home_star_h_24";
    } else {
        countStr = @"";
        self.countIconImgV.hidden = YES;
        self.countLab.hidden = YES;
    }
    self.countIconImgV.image = IMAGENAME(iconNameStr);
    self.countLab.text = countStr;
    
////    CGFloat currentHeight = 177;
//    CGFloat currentHeight = top + coverHeight + 27;
//    CGFloat spacing = 10;

    NSArray *tagList = model.tagList;
    self.collectionView.data = tagList;
    
    CGFloat collectionViewHeight = 0;
    if (tagList.count > 0) {
        CGFloat minHeight = 20;
        CGFloat maxHeight = 45;
        if (self.collectionView.contentSize.height >= maxHeight) {
            collectionViewHeight = maxHeight;
        } else {
            collectionViewHeight = minHeight;
        }
    }
    self.collectionView.frame = CGRectMake(0, currentHeight + spacing, KWidth, collectionViewHeight);
    if (collectionViewHeight > 0) {
        currentHeight = currentHeight + spacing + self.collectionView.frame.size.height;
    }
    
//    model.shortDesc = @"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试";
    self.commentLab.hidden = YES;
    if (model.shortDesc && model.shortDesc.length > 0) {
        NSString *nameStr = @"看点：";
        NSString *commentStr = model.shortDesc;
        
        //初始化NSMutableAttributedString
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]init];
        
        NSString *str0 = nameStr;
        NSDictionary *dictAttr0 = @{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:kCOLOR_BCBCBC};
        NSAttributedString *attr0 = [[NSAttributedString alloc]initWithString:str0 attributes:dictAttr0];
        [attributedString appendAttributedString:attr0];
        
        NSString *str2 = commentStr;
        NSDictionary *dictAttr2 = @{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:kCOLOR_dynamicProvider_525252_DADBDC};
        NSAttributedString *attr2 = [[NSAttributedString alloc]initWithString:str2 attributes:dictAttr2];
        [attributedString appendAttributedString:attr2];
        
        //段落样式
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
        //行间距
        paragraph.lineSpacing = 6;
        //    //正确的实现行间距
        //    paragraph.lineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
        
        //对齐方式两边对齐
        //    paragraph.alignment = NSTextAlignmentJustified;
        paragraph.lineBreakMode = NSLineBreakByTruncatingTail;
        
        [attributedString addAttributes:@{
            //        NSFontAttributeName:textFont,
            //        NSForegroundColorAttributeName: [UIColor blackColor],
            NSParagraphStyleAttributeName:paragraph}
                                  range:NSMakeRange(0, attributedString.length)];
        
        self.commentLab.attributedText = attributedString;
        self.commentLab.hidden = NO;
        
        CGSize size = [self.commentLab sizeThatFits:CGSizeMake(KWidth - 16 * 2, MAXFLOAT)];
        self.commentLab.frame = CGRectMake(16, currentHeight + 14, KWidth - 16 * 2, size.height + 1);
        
        currentHeight = currentHeight + spacing + self.commentLab.frame.size.height;
    }
    
}

- (void)setRow:(NSInteger)row {
    _row = row;
    //    _numberIconImgV.image = IMAGENAME(@"ic_paihangbang_top1");
    //    _numberIconImgV.image = IMAGENAME(@"ic_paihangbang_top2");
    //    _numberIconImgV.image = IMAGENAME(@"ic_paihangbang_top3");
    //    _numberIconImgV.image = IMAGENAME(@"ic_paihangbang_top4");
    
    UIColor *color = kCOLOR_FFFFFF;
    NSString *imageName = @"ic_paihangbang_top4";
    switch (row + 1) {
        case 1:
            imageName = @"ic_paihangbang_top1";
            break;
        case 2:
            imageName = @"ic_paihangbang_top2";
            break;
        case 3:
            imageName = @"ic_paihangbang_top3";
            break;
        default:
            imageName = @"ic_paihangbang_top4";
            color = kCOLOR_A08873;
            break;
    }
    
    self.numberLab.text = @(row + 1).stringValue;
    self.numberLab.textColor = color;
    self.numberIconImgV.image = IMAGENAME(imageName);
}

#pragma mark - 点击图片
- (void)clickImage:(NSInteger)index {
    RRSeniorCommentsImageModel *imageModel = [self.model.imageList objectOrNilAtIndex:index];
    if (self.clickBanner) {
        self.clickBanner(self.model, imageModel ,index);
    }
}

- (void)slideImage:(NSInteger)index {
    RRSeniorCommentsImageModel *imageModel = [self.model.imageList objectOrNilAtIndex:index];
    if (self.slideBanner) {
        self.slideBanner(self.model, imageModel ,index);
    }
}
 
//- (void)tap:(UITapGestureRecognizer *)tap {
//    if (self.clickBanner) {
//        self.clickBanner(self.model);
//    }
//}

#pragma mark - 点击按钮
- (void)clickFollowBtn:(UIButton *)btn {
    NSLog(@"点击了追剧按钮");
//    WS(weakSelf);
//    //追剧
//    [RRMJTool pushToLoginVCWith:[RRAppLinkManager sharedManager].currentTopNavigationController Block:^{
//        BOOL isfous = weakSelf.model.favorite;
//        NSString *idStr = weakSelf.model.dramaId;
//        weakSelf.followBtn.userInteractionEnabled = NO;
//        [ColletionTool getSeasonID:idStr IsFocus:isfous WithBlock:^(BOOL isFavo, NSError *error) {
//            weakSelf.model.favorite = isFavo;
//            weakSelf.followBtn.userInteractionEnabled = YES;
//            weakSelf.followBtn.selected = isFavo;
//            if (isFavo) {
//                [weakSelf.model.rr_contentContext seasonBingeWatchingLog];
//            } else {
//                [weakSelf.model.rr_contentContext seasonUnBingeWatchingLog];
//            }
//        }];
//    }];
}

+ (CGFloat)cellHeightWithModel:(RRAllRankingModel *)model {
     
    CGFloat top = 20;
    CGFloat leading = 16;
//    CGFloat trailing = -16;
    CGFloat scale = 686.0 / 260;
//    CGFloat coverScale = 1.0 / 1.3;
    CGFloat width = KWidth - leading * 2;
    CGFloat coverHeight = width / scale;
//    CGFloat coverWidth = coverScale * coverHeight;
//    CGFloat photoHeight = ceil(coverHeight);
//    CGFloat photoWidth = ceil(width - coverWidth - 8);
    CGFloat spacing = 10;
    CGFloat titleHeight = 27;
    CGFloat currentHeight = top + coverHeight + titleHeight;
 
    //初始化collectionLayout
    UICollectionViewLeftAlignedLayout *collectionLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
    collectionLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    collectionLayout.sectionInset = UIEdgeInsetsMake(0, 16, 0, 16);
    collectionLayout.estimatedItemSize = CGSizeZero;
    collectionLayout.minimumLineSpacing = 5;                        //水平间距
    collectionLayout.minimumInteritemSpacing = 5;
    
    //初始化collectionView
    RRAllRankingTagCollectionView *collectionView = [[RRAllRankingTagCollectionView alloc]initWithFrame:CGRectMake(0, 0, KWidth, 55) collectionViewLayout:collectionLayout];
    
    NSArray *tagList = model.tagList;
    collectionView.data = tagList;
    
    CGFloat collectionViewHeight = 0;
    if (tagList.count > 0) {
        CGFloat minHeight = 20;
        CGFloat maxHeight = 45;
        if (collectionView.contentSize.height >= maxHeight) {
            collectionViewHeight = maxHeight;
        } else {
            collectionViewHeight = minHeight;
        }
    }
    collectionView.frame = CGRectMake(0, currentHeight + spacing, KWidth, collectionViewHeight);
    if (collectionViewHeight > 0) {
        currentHeight = currentHeight + spacing + collectionView.frame.size.height;
    }
    
//    model.shortDesc = @"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试";
    if (model.shortDesc && model.shortDesc.length > 0) {
        
        UILabel *commentLab = [[UILabel alloc] init];
        commentLab.frame = CGRectMake(0, 0, 40, 40);
        commentLab.font = RR_COMMONFONT(14);
        commentLab.textColor = kCOLOR_88898F;
        commentLab.numberOfLines = 2;
        
        NSString *nameStr = @"看点：";
        NSString *commentStr = model.shortDesc;
        
        //初始化NSMutableAttributedString
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]init];
        
        NSString *str0 = nameStr;
        NSDictionary *dictAttr0 = @{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:kCOLOR_BCBCBC};
        NSAttributedString *attr0 = [[NSAttributedString alloc]initWithString:str0 attributes:dictAttr0];
        [attributedString appendAttributedString:attr0];
        
        NSString *str2 = commentStr;
        NSDictionary *dictAttr2 = @{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:kCOLOR_dynamicProvider_525252_DADBDC};
        NSAttributedString *attr2 = [[NSAttributedString alloc]initWithString:str2 attributes:dictAttr2];
        [attributedString appendAttributedString:attr2];
        
        //段落样式
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
        //行间距
        paragraph.lineSpacing = 6;
        //    //正确的实现行间距
        //    paragraph.lineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
        
        //对齐方式两边对齐
        //    paragraph.alignment = NSTextAlignmentJustified;
        paragraph.lineBreakMode = NSLineBreakByTruncatingTail;
        
        [attributedString addAttributes:@{
            //        NSFontAttributeName:textFont,
            //        NSForegroundColorAttributeName: [UIColor blackColor],
            NSParagraphStyleAttributeName:paragraph}
                                  range:NSMakeRange(0, attributedString.length)];
        
        commentLab.attributedText = attributedString;
        commentLab.hidden = NO;
        
        CGSize size = [commentLab sizeThatFits:CGSizeMake(KWidth - 16 * 2, MAXFLOAT)];
        commentLab.frame = CGRectMake(16, currentHeight + 14, KWidth - 16 * 2, size.height + 1);
        
        currentHeight = currentHeight + spacing + commentLab.frame.size.height;
    }
    
    return currentHeight + 14;
}

#pragma mark - lazy
- (UIImageView *)coverImgV {
    if (!_coverImgV) {
        _coverImgV = [[UIImageView alloc] init];
        _coverImgV.frame = CGRectMake(0, 0, 36, 36);
        _coverImgV.contentMode = UIViewContentModeScaleAspectFill;
        //        _avatarImageView.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
        _coverImgV.layer.cornerRadius = 8;
        _coverImgV.layer.masksToBounds = YES;
        _coverImgV.userInteractionEnabled = YES;
        _coverImgV.image = IMAGENAME(@"ranking_cover");
    }
    return _coverImgV;
}

- (UIButton *)followBtn {
    if (!_followBtn) {
        _followBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 45)];
        [_followBtn setImage:IMAGENAME(@"ic_home_zhuiju_n") forState:UIControlStateNormal];
        [_followBtn setImage:IMAGENAME(@"ic_home_zhuiju_h") forState: UIControlStateHighlighted | UIControlStateSelected];
        [_followBtn setImage:IMAGENAME(@"ic_home_zhuiju_h") forState:UIControlStateSelected];
        //        _followBtn.selected = YES;
        [_followBtn addTarget:self action:@selector(clickFollowBtn:) forControlEvents:UIControlEventTouchUpInside];
        //        _followBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //        _followBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 0);
    }
    return _followBtn;
}

- (UIView *)photoView {
    if (!_photoView) {
        _photoView = [[UIView alloc] init];
        _photoView.frame = CGRectMake(0, 0, KWidth - 124 - 16, 130);
        _photoView.layer.cornerRadius = 8;
        _photoView.layer.masksToBounds = YES;
        
    }
    return _photoView;
}


- (UIImageView *)photoBackgroundImgV {
    if (!_photoBackgroundImgV) {
        _photoBackgroundImgV= [[UIImageView alloc] init];
        _photoBackgroundImgV.frame = CGRectMake(0, 0, KWidth - 124 - 16, 130);
        _photoBackgroundImgV.contentMode = UIViewContentModeScaleAspectFill;
        _photoBackgroundImgV.image = IMAGENAME(@"ranking_image");
    }
    return _photoBackgroundImgV;
}

- (UIImageView *)numberIconImgV {
    if (!_numberIconImgV) {
        _numberIconImgV = [[UIImageView alloc] init];
        _numberIconImgV.frame = CGRectMake(0, 0, 40, 40);
        _numberIconImgV.contentMode = UIViewContentModeScaleAspectFill;
        //        _numberIconImgV.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
        //        _numberIconImgV.layer.cornerRadius = 8;
        //        _numberIconImgV.layer.masksToBounds = YES;
        _numberIconImgV.image = IMAGENAME(@"ic_paihangbang_top1");
        //        _numberIconImgV.image = IMAGENAME(@"ic_paihangbang_top2");
        //        _numberIconImgV.image = IMAGENAME(@"ic_paihangbang_top3");
        //        _numberIconImgV.image = IMAGENAME(@"ic_paihangbang_top4");
        
    }
    return _numberIconImgV;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [[UILabel alloc] init];
        _numberLab.frame = CGRectMake(0, 0, 40, 40);
        _numberLab.text = @"1";
        _numberLab.textColor = kCOLOR_FFFFFF;
        _numberLab.font = BOLDSYSTEMFONT(12);
    }
    return _numberLab;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        //        _titleLab.font = RR_COMMONFONT(14);
        _titleLab.font = BOLDSYSTEMFONT(14);
        _titleLab.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
    }
    return _titleLab;
}

- (UIImageView *)countIconImgV {
    if (!_countIconImgV) {
        _countIconImgV = [[UIImageView alloc] init];
        _countIconImgV.frame = CGRectMake(0, 0, 40, 40);
        _countIconImgV.contentMode = UIViewContentModeScaleAspectFill;
        
        //        _countIconImgV.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
        //        _numberIconImgV.layer.cornerRadius = 8;
        //        _numberIconImgV.layer.masksToBounds = YES;
    }
    return _countIconImgV;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [[UILabel alloc] init];
        _countLab.frame = CGRectMake(0, 0, 40, 40);
        _countLab.text = @"";
        _countLab.textColor = kCOLOR_1890FF;
        _countLab.font = BebasNeue(17);
    }
    return _countLab;
}

- (RRAllRankingTagCollectionView *)collectionView {
    if (!_collectionView) {
        
        //初始化collectionLayout
        UICollectionViewLeftAlignedLayout *collectionLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
        collectionLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        collectionLayout.sectionInset = UIEdgeInsetsMake(0, 16, 0, 16);
        collectionLayout.estimatedItemSize = CGSizeZero;
        collectionLayout.minimumLineSpacing = 5;                        //水平间距
        collectionLayout.minimumInteritemSpacing = 5;
        
        //初始化collectionView
        _collectionView = [[RRAllRankingTagCollectionView alloc]initWithFrame:CGRectMake(0, 0, KWidth, 55) collectionViewLayout:collectionLayout];
        _collectionView.userInteractionEnabled = NO;
    }
    return _collectionView;
}

- (UILabel *)commentLab {
    if (!_commentLab) {
        _commentLab = [[UILabel alloc] init];
        _commentLab.frame = CGRectMake(0, 0, 40, 40);
        _commentLab.font = RR_COMMONFONT(14);
        _commentLab.textColor = kCOLOR_88898F;
        _commentLab.numberOfLines = 2;
    }
    return _commentLab;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.frame = CGRectMake(0, 0, 200, 1);
        _line.backgroundColor = LineColor;
    }
    return _line;
}

- (RRAllRankingImageBanner *)banner {
    if (!_banner) {
//        CGFloat top = 20;
        CGFloat leading = 16;
//        CGFloat trailing = -16;
        CGFloat scale = 686.0 / 260;
        CGFloat coverScale = 1.0 / 1.3;
        CGFloat width = KWidth - leading * 2;
        CGFloat coverHeight = width / scale;
        CGFloat coverWidth = coverScale * coverHeight;
        CGFloat photoHeight = ceil(coverHeight);
        CGFloat photoWidth = ceil(width - coverWidth - 8);
//        CGFloat spacing = 10;
//        CGFloat titleHeight = 27;
//        CGFloat currentHeight = top + coverHeight + titleHeight;
        _banner = [[RRAllRankingImageBanner alloc] initWithFrame:CGRectMake(0, 0, photoWidth, photoHeight)];
    }
    return _banner;
}
 
@end

