//
//  RRAllRankingListCell.m
//  WDEMO
//
//  Created by rrtv on 2021/10/20.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRAllRankingListCell.h"
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
//    //aavatar
//    [self.contentView addSubview:self.avatarImageView];
//    [self.contentView addSubview:self.avatarVipIconImageView];
//    //nickname
//    [self.contentView addSubview:self.nicknameLab];
//    [self.contentView addSubview:self.nicknameLevelView];
//    [self.nicknameLevelView addSubview:self.nicknameLevelLab];
//    [self.contentView addSubview:self.nicknameVipIconImageView];
//    //置顶
//    [self.contentView addSubview:self.toppingTagView];
//
//    //bottomView
//    [self.contentView addSubview:self.bottomView];
//    [self.contentView addSubview:self.bottomViewLine];
//    [self.bottomView addSubview:self.dateLab];
//    [self.bottomView addSubview:self.praiseBtn];
//    [self.praiseBtn addSubview:self.praiseBtnLab];
//    //    [self.bottomView addSubview:self.praiseImageView];
//
//    //抗压缩
//    [self.nicknameLab setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
//    [self.nicknameLevelLab setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
//
//    CGFloat avatarImageViewTop = [[self class] getAvatarImageViewTop];
//
//    //top 20
//    //头像
//    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.equalTo(@36);
//        make.top.equalTo(@(avatarImageViewTop));
//        make.leading.equalTo(@16);
//    }];
//    [self.avatarVipIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.avatarImageView);
//        make.trailing.equalTo(self.avatarImageView);
//        make.width.equalTo(@11);
//        make.height.equalTo(@11);
//    }];
    
    
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
    
    
    
    self.collectionLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
    self.collectionLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.collectionLayout.estimatedItemSize = CGSizeZero;                 //关闭模拟高度,8.0系统模拟高度会导致崩溃。mmp。
    self.collectionLayout.minimumLineSpacing = 10;                        //水平间距
    self.collectionLayout.minimumInteritemSpacing = 10;
//    self.collectionLayout.headerReferenceSize = CGSizeMake(KWidth, 18);   //组头视图高度
    
     
    //初始化collectionView
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.collectionLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.scrollEnabled = NO;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];

    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    [self.collectionView registerClass:[WCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([WCollectionViewCell class])];
    [self.collectionView registerNib:[UINib nibWithNibName:@"WCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"xib"];
 
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
    
    [self.contentView addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
        
        
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
//        make.height.equalTo(@300);
        //二行 10 + 20 + 10 + 20 + 10
        make.height.equalTo(@70);
        make.top.equalTo(@100); 
    }];

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
//    WCollectionViewCell *cell = (WCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WCollectionViewCell class]) forIndexPath:indexPath];
//    cell.contentView.backgroundColor = [UIColor grayColor];
//    NSString *str = [NSString stringWithFormat:@"%zi:%zi", indexPath.section, indexPath.item];
//    cell.titleLabel.text = str;
    
    //xib
    WCollectionViewCell *cell = (WCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"xib" forIndexPath:indexPath];
//    NSString *str = [NSString stringWithFormat:@"xib=%zi:%zi", indexPath.section, indexPath.item];
    NSString *str = self.titleArr[indexPath.item];
    cell.xibLabel.text = str;
    cell.contentView.backgroundColor = [UIColor grayColor];
    return cell;
}

#pragma mark -- UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //iOS 中获取当前点击的cell
    //一般情况，cell不是自定义
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath]; //即为要得到的cell
    //自定义的cell
//    TitleViewCell * cell = (TitleViewCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];//即为要得到的cell
    
    cell.contentView.backgroundColor = [UIColor redColor];
    NSLog(@"%@",cell);

}

//CGSize itemSize：它定义了每一个item的大小，通过itemSize可以快捷给每一个cell设置一样的大小，如果你想到不同的尺寸，-collectionView:layout:sizeForItemAtIndexPath:来给每一个item指定不同的尺寸。
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *str = self.titleArr[indexPath.item];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    titleLab.text = str;
    CGSize size = [titleLab sizeThatFits:CGSizeMake(MAXFLOAT, 20)];
    CGFloat width = size.width;
    CGFloat maxWidth = KWidth - 10 * 2;
    if (width >= maxWidth) {
        width = maxWidth;
    }
    return CGSizeMake(width, 20);
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
//        [_followBtn addTarget:self action:@selector(clickPraiseBtn:) forControlEvents:UIControlEventTouchUpInside];
//        _followBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        _followBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 0);
    }
    return _followBtn;
}

- (UIView *)pohtoView {
    if (!_pohtoView) {
        _pohtoView = [[UIView alloc] init];
        _pohtoView.frame = CGRectMake(0, 0, 200, 40);
        _pohtoView.layer.cornerRadius = 8;
        _pohtoView.layer.masksToBounds = YES;
    }
    return _pohtoView;
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

- (UILabel *)commentLab {
    if (!_commentLab) {
        _commentLab = [[UILabel alloc] init];
        _commentLab.frame = CGRectMake(0, 0, 40, 40);
        _commentLab.font = RR_COMMONFONT(14);
        _commentLab.textColor = kCOLOR_88898F;
    }
    return _commentLab;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.frame = CGRectMake(0, 0, 200, 1);
    }
    return _line;
}
 
@end
