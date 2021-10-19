//
//  RRSeasonSeniorCommentsPhotoCollectionView.m
//  NJVideo
//
//  Created by WDEMO on 2021/7/27.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsPhotoCollectionView.h"
#import "RRSeasonSeniorCommentsPhotoCollectionViewCell.h"

@interface RRSeasonSeniorCommentsPhotoCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, assign) CGFloat maxWidth;
@property (nonatomic, assign) CGFloat maxHeight;

@end

@implementation RRSeasonSeniorCommentsPhotoCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        _maxWidth = frame.size.width;
        _maxHeight = frame.size.height;
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    //    self.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_2A2A2A;
    self.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
    self.delegate = self;
    self.dataSource = self;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator =NO;
    //codecell
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    
    [self registerClass:[RRSeasonSeniorCommentsPhotoCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([RRSeasonSeniorCommentsPhotoCollectionViewCell class])];
}

#pragma mark --UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RRSeasonSeniorCommentsPhotoCollectionViewCell *cell = (RRSeasonSeniorCommentsPhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRSeasonSeniorCommentsPhotoCollectionViewCell class]) forIndexPath:indexPath];
    RRSeniorCommentsImageModel *model = [self.data objectOrNilAtIndex:indexPath.item];
    cell.model= model;
    return cell;
}

#pragma mark -- UICollectionViewDelegate
//UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath]; //即为要得到的cell
    NSLog(@"%@",cell);
    NSLog(@"%@",indexPath);

    if (self.collectionViewDelegate && [self.collectionViewDelegate respondsToSelector:@selector(seasonSeniorCommentsPhotoCollectionView:didSelectItemAtIndexPath:)]) {
        [self.collectionViewDelegate seasonSeniorCommentsPhotoCollectionView:self didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark -- UICollectionViewDelegateFlowLayout
//CGSize itemSize：它定义了每一个item的大小，通过itemSize可以快捷给每一个cell设置一样的大小，如果你想到不同的尺寸，-collectionView:layout:sizeForItemAtIndexPath:来给每一个item指定不同的尺寸。
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger imageCount = self.data.count;
    if (imageCount == 1) {
        //等于1张图
        RRSeniorCommentsImageModel *singleImage = [self.data firstObject];
        CGFloat width = singleImage.width;
        CGFloat height = singleImage.height;
        //        CGFloat x = 61;
        //        CGFloat y = 8 + currentHeight;
        CGFloat max = 197;
        CGFloat showWidth = 0;
        CGFloat showHeight = 0;
        
//        if (width > height) {
//            showWidth = max * 4 / 3;
//            showHeight = max;
//            
//        } else if (width < height) {
//            showWidth = max;
//            showHeight = max * 4 / 3;
//            
//        } else {
//            showWidth = max;
//            showHeight = max;
//        }
        
        //5.9UI展示逻辑修改
        showWidth = _maxWidth - 100;
        showHeight = showWidth;
        
        return CGSizeMake(showWidth, showHeight);
    } else {
        //大于1张图
        //间距
        CGFloat imageSpacing = 2;
        //单个长度
//        CGFloat width = (KWidth - 61 - 16 - imageSpacing * 2) / 3;
        CGFloat width = (self.maxWidth - imageSpacing * 2) / 3;
        return CGSizeMake(width, width);
    }
}

//UIEdgeInsets sectionInset：组内边距，设置UIcollectionView整体的组内边距，同上有特定方法-collectionView:insetForSectionAtIndex:设置具体的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section  {
    //设置senction的内边距
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//CGFloat minimumLineSpacing：最小行间隔，同样你也可以通过-* collectionView:minimumLineSpacingForSectionAtIndex:方法来个没一行设置不同的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section  {
    //     设置最小行间距
    return 2.0;
}

//CGFloat minimumInteritemSpacing：最小cell之间的距离，同上都是可以通过-collectionView:minimumInteritemSpacingForSectionAtIndex:特定的方法，顶底到具体的行和item之间的间距的，非常的灵活。
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    //    设置同一列中间隔的cell最小间距
    return 0.0;
}

- (void)setData:(NSArray *)data {
    _data = data;
    [self reloadData];
}
@end


