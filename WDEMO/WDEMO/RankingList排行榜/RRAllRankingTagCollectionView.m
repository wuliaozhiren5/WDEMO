//
//  RRAllRankingTagCollectionView.m
//  NJVideo
//
//  Created by rrtv on 2021/11/3.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRAllRankingTagCollectionView.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "RRAllRankingTagCell.h"

@interface RRAllRankingTagCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@end

@implementation RRAllRankingTagCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
   
    self.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
    self.delegate = self;
    self.dataSource = self;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator =NO;
    //codecell
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    [self registerClass:[RRAllRankingTagCell class] forCellWithReuseIdentifier:NSStringFromClass([RRAllRankingTagCell class])];
}

#pragma mark -- UICollectionViewDataSource
//有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

///每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //代码
    RRAllRankingTagCell *cell = (RRAllRankingTagCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRAllRankingTagCell class]) forIndexPath:indexPath];
    RRAllRankingTagModel *model = [self.data objectOrNilAtIndex:indexPath.item];
    cell.model = model;
    return cell;
}

#pragma mark -- UICollectionViewDelegate
//UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

//CGSize itemSize：它定义了每一个item的大小，通过itemSize可以快捷给每一个cell设置一样的大小，如果你想到不同的尺寸，-collectionView:layout:sizeForItemAtIndexPath:来给每一个item指定不同的尺寸。
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //外边距
    CGFloat margin = 16;
    //外边距
    CGFloat padding = 8;

    RRAllRankingTagModel *model = [self.data objectOrNilAtIndex:indexPath.item];
    NSString *str = model.name;
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    titleLab.font = RR_COMMONFONT(14);
    titleLab.text = str;
    CGSize size = [titleLab sizeThatFits:CGSizeMake(MAXFLOAT, 20)];
    CGFloat width = size.width + padding * 2;
    CGFloat maxWidth = KWidth - padding * 2 - margin * 2;
    if (width >= maxWidth) {
        width = maxWidth;
    }
    return CGSizeMake(width, 20);
}
     
- (void)setData:(NSArray *)data {
    _data = data;
    [self reloadData];
}

@end


