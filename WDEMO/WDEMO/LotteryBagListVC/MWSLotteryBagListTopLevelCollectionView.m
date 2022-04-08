//
//  MWSLotteryBagListTopLevelCollectionView.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/30.
//

#import "MWSLotteryBagListTopLevelCollectionView.h"
#import "MWSLotteryBagListTopLevelCollectionViewCell.h"

@interface MWSLotteryBagListTopLevelCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation MWSLotteryBagListTopLevelCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    //    self.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_2A2A2A;
    //    self.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
    self.delegate = self;
    self.dataSource = self;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator =NO;
    //codecell
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    
    [self registerClass:[MWSLotteryBagListTopLevelCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([MWSLotteryBagListTopLevelCollectionViewCell class])];
    
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
    //    NSInteger imageCount = self.data.count;
    MWSLotteryBagListTopLevelCollectionViewCell *cell = (MWSLotteryBagListTopLevelCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MWSLotteryBagListTopLevelCollectionViewCell class]) forIndexPath:indexPath];
    MWSLotteryBagListTopModel *model = [self.data objectOrNilAtIndex:indexPath.item];
    cell.model= model;
    
    cell.isSelect = (self.selectIndex == indexPath.item);
    
    //    cell.contentView.backgroundColor = [UIColor redColor];
    
    return cell;
    
}

#pragma mark -- UICollectionViewDelegate
//UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 
    MWSLotteryBagListTopModel *model = [self.data objectOrNilAtIndex:indexPath.item];
    
//    if (self.selectIndex == indexPath.item) {
//        return;
//    }
    self.selectIndex = indexPath.item;
    [self reloadData];
    //    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

    if (self.collectionViewDelegate && [self.collectionViewDelegate respondsToSelector:@selector(levelCollectionDidSelectWithIndex:levelModel:)]) {
        [self.collectionViewDelegate levelCollectionDidSelectWithIndex:indexPath.item levelModel:model];
    }
    //    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath]; //即为要得到的cell
    //    NSLog(@"%@",cell);
    //    NSLog(@"%@",indexPath);
    //
    //    if (self.collectionViewDelegate && [self.collectionViewDelegate respondsToSelector:@selector(seasonSeniorCommentsPhotoCollectionView:didSelectItemAtIndexPath:)]) {
    //        [self.collectionViewDelegate seasonSeniorCommentsPhotoCollectionView:self didSelectItemAtIndexPath:indexPath];
    //    }
}

- (void)setData:(NSArray *)data {
    _data = data;
    [self reloadData];
    //    [self layoutIfNeeded];
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    _selectIndex = selectIndex;
    [self reloadData];
}
@end

