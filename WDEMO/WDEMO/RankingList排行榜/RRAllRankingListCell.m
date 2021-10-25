//
//  RRAllRankingListCell.m
//  WDEMO
//
//  Created by rrtv on 2021/10/20.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRAllRankingListCell.h"
#import "RRAllRankingTagCell.h"

@interface RRAllRankingListCell () <UICollectionViewDelegate, UICollectionViewDataSource>

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
    [self.contentView addSubview:self.coverImgV];
    [self.coverImgV addSubview:self.followBtn];
    [self.contentView addSubview:self.photoView];
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
        make.top.equalTo(@8);
        make.leading.equalTo(@8);
        make.width.equalTo(@50);
        make.height.equalTo(@60);
    }];
    
    [self.photoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@8);
        make.leading.equalTo(@70);
        make.trailing.equalTo(@-8);
        make.height.equalTo(@60);
    }];

    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.leading.equalTo(@0);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    [self.numberIconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImgV.mas_bottom).offset(8);
        make.leading.equalTo(@8);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.numberIconImgV);
    }];

    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImgV.mas_bottom).offset(8);
        make.trailing.equalTo(@-8);
        make.height.equalTo(@20);
    }];
    
    [self.countIconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImgV.mas_bottom).offset(8);
        make.trailing.equalTo(self.countLab.mas_leading).offset(-8);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImgV.mas_bottom).offset(8);
        make.leading.equalTo(self.numberIconImgV.mas_trailing).offset(8);
        make.trailing.lessThanOrEqualTo(self.countIconImgV.mas_leading).offset(-8);
        make.height.equalTo(@20);
    }];
     
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
//        make.height.equalTo(@300);
        //二行 10 + 20 + 10 + 20 + 10
        make.height.equalTo(@70);
        make.top.equalTo(self.titleLab.mas_bottom).offset(8);
    }];
    
    [self.commentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom).offset(8);
        make.leading.equalTo(@8);
        make.trailing.equalTo(@-8);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.commentLab.mas_bottom).offset(8);
        make.leading.equalTo(@8);
        make.trailing.equalTo(@-8);
        //线的高度
        make.height.equalTo(@(1.0f / [UIScreen mainScreen].scale));
    }];
    
    self.coverImgV.backgroundColor = [UIColor redColor];
    self.photoView.backgroundColor = [UIColor redColor];
    self.followBtn.backgroundColor = [UIColor greenColor];
    self.numberIconImgV.backgroundColor = [UIColor yellowColor];
    self.numberLab.text = @"99";
    self.numberLab.textColor = [UIColor blackColor];

    self.countLab.text = @"9999";
    self.countLab.textColor = [UIColor blackColor];

    self.countIconImgV.backgroundColor = [UIColor yellowColor];
    self.titleLab.text = @"生活大爆炸生活大爆炸生活大爆炸生活大爆炸生活大爆炸生活大爆炸生活大爆炸生活大爆炸生活大爆炸生活大爆炸生活大爆炸生活大爆炸生活大爆炸生活大爆炸";
    self.titleLab.textColor = [UIColor blackColor];
     
    NSString *nameStr = @"评论家共识：";
    NSString *commentStr = @"生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。生活大爆炸第一季很好看。";

  
    //初始化NSMutableAttributedString
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]init];
     
    NSString *str0 = nameStr;
    NSDictionary *dictAttr0 = @{NSFontAttributeName:[UIFont systemFontOfSize:10], NSForegroundColorAttributeName:[UIColor purpleColor]};
    NSAttributedString *attr0 = [[NSAttributedString alloc]initWithString:str0 attributes:dictAttr0];
    [attributedString appendAttributedString:attr0];
    
    NSString *str2 = commentStr;
    NSDictionary *dictAttr2 = @{NSFontAttributeName:[UIFont systemFontOfSize:14], NSForegroundColorAttributeName:[UIColor redColor]};
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

    self.titleArr = @[
        @"测试",
        @"生活大爆炸",
        @"爱情",
        @"LOVE",
        @"港剧",
        @"巾帼枭雄之义海豪情",
        @"大时代",
        @"男亲女爱",
        @"美剧",
        @"老友记",
        @"风骚律师",
        @"绝命毒师",
        @"权力的游戏",
        @"123",
        @"喜剧",
        @"悲剧",
        @"很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长",
        @"短",
    ];
    [self.collectionView reloadData];
    
    NSArray *array = @[@"5.jpg", @"4.jpg", @"3.jpg", @"2.jpg", @"1.jpg"];
    RRRankingImageBanner *banner = [[RRRankingImageBanner alloc] initWithFrame:CGRectMake(0, 0, KWidth - 70 - 8, 60)
                                                         array:array];
    banner.autoScroll = NO;
    UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [banner addGestureRecognizer:tapGesturRecognizer];
    [self.photoView addSubview:banner];
    self.banner = banner;
    
    self.line.backgroundColor = [UIColor blackColor];

}

#pragma mark - 点击头像 点击昵称
- (void)tap:(UITapGestureRecognizer *)tap {
    if (self.clickBanner) {
        self.clickBanner();
    }
}

#pragma mark --UICollectionViewDataSource
//有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
        return 1;
}
///每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return self.titleArr.count;
}


//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    //    cell.contentView.backgroundColor = [UIColor grayColor];
    //    return cell;
    
    
    //代码
    RRAllRankingTagCell *cell = (RRAllRankingTagCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRAllRankingTagCell class]) forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor grayColor];
//    NSString *str = [NSString stringWithFormat:@"%zi:%zi", indexPath.section, indexPath.item];
    NSString *str = [self.titleArr objectOrNilAtIndex:indexPath.item];
    cell.titleLab.text = str;
    return cell;
}

#pragma mark -- UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return;
}

//CGSize itemSize：它定义了每一个item的大小，通过itemSize可以快捷给每一个cell设置一样的大小，如果你想到不同的尺寸，-collectionView:layout:sizeForItemAtIndexPath:来给每一个item指定不同的尺寸。
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *str = self.titleArr[indexPath.item];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    titleLab.font = RR_COMMONFONT(14);
    titleLab.text = str;
    CGSize size = [titleLab sizeThatFits:CGSizeMake(MAXFLOAT, 20)];
    CGFloat width = size.width;
    CGFloat maxWidth = KWidth - 10 * 2;
    if (width >= maxWidth) {
        width = maxWidth;
    }
    return CGSizeMake(width, 20);
}
    
#pragma mark - 点击按钮
- (void)clickFollowBtn:(UIButton *)btn {
    
}

#pragma mark - lazy
- (UIImageView *)coverImgV {
    if (!_coverImgV) {
        _coverImgV = [[UIImageView alloc] init];
        _coverImgV.frame = CGRectMake(0, 0, 36, 36);
//        _avatarImageView.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
        _coverImgV.layer.cornerRadius = 8;
        _coverImgV.layer.masksToBounds = YES;
        _coverImgV.userInteractionEnabled = YES;

    }
    return _coverImgV;
}

- (UIButton *)followBtn {
    if (!_followBtn) {
        _followBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 45)];
        [_followBtn setImage:IMAGENAME(@"ic_common_like_n_28") forState:UIControlStateNormal];
        [_followBtn setImage:IMAGENAME(@"ic_common_like_h_28") forState: UIControlStateHighlighted | UIControlStateSelected];
        [_followBtn setImage:IMAGENAME(@"ic_common_like_h_28") forState:UIControlStateSelected];
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
        _photoView.frame = CGRectMake(0, 0, KWidth - 70 - 8, 60);
        _photoView.layer.cornerRadius = 8;
        _photoView.layer.masksToBounds = YES;
    }
    return _photoView;
}

- (UIImageView *)numberIconImgV {
    if (!_numberIconImgV) {
        _numberIconImgV = [[UIImageView alloc] init];
        _numberIconImgV.frame = CGRectMake(0, 0, 40, 40);
//        _numberIconImgV.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
//        _numberIconImgV.layer.cornerRadius = 8;
//        _numberIconImgV.layer.masksToBounds = YES;
    }
    return _numberIconImgV;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [[UILabel alloc] init];
        _numberLab.frame = CGRectMake(0, 0, 40, 40);
        _numberLab.font = RR_COMMONFONT(14);
        _numberLab.textColor = kCOLOR_88898F;
    }
    return _numberLab;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        _titleLab.font = RR_COMMONFONT(14);
        _titleLab.textColor = kCOLOR_88898F;
    }
    return _titleLab;
}

- (UIImageView *)countIconImgV {
    if (!_countIconImgV) {
        _countIconImgV = [[UIImageView alloc] init];
        _countIconImgV.frame = CGRectMake(0, 0, 40, 40);
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
        _countLab.font = RR_COMMONFONT(14);
        _countLab.textColor = kCOLOR_88898F;
    }
    return _countLab;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        //初始化collectionLayout
        UICollectionViewLeftAlignedLayout *collectionLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
        collectionLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        collectionLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        collectionLayout.estimatedItemSize = CGSizeZero;
        collectionLayout.minimumLineSpacing = 10;                        //水平间距
        collectionLayout.minimumInteritemSpacing = 10;
 
        //初始化collectionView
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:collectionLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.userInteractionEnabled = NO;
        
        _collectionView.backgroundColor = [UIColor whiteColor];

        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
        [_collectionView registerClass:[RRAllRankingTagCell class] forCellWithReuseIdentifier:NSStringFromClass([RRAllRankingTagCell class])];
        [_collectionView registerNib:[UINib nibWithNibName:@"WCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"xib"];
     
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
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
        _line.backgroundColor = [UIColor grayColor];
    }
    return _line;
}
 
@end
