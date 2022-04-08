//
//  MWSLotteryBagListTopView.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/30.
//

#import "MWSLotteryBagListTopView.h"
@interface MWSLotteryBagListTopView () <MWSLotteryBagListTopPageCollectionViewDelegate,  MWSLotteryBagListTopOrderWayCollectionViewDelegate, MWSLotteryBagListTopLevelCollectionViewDelegate>

@end

@implementation MWSLotteryBagListTopView


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];

    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];

    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.pageCollectionView];
    [self addSubview:self.orderWayCollectionView];
    [self addSubview:self.levelCollectionView];

    [self.pageCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@44);
    }];
    [self.orderWayCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@44);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@44);
    }];
    [self.levelCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@88);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@44);
    }];
}

- (void)setPageIndex:(NSInteger)pageIndex {
    _pageIndex = pageIndex;
    self.pageCollectionView.selectIndex = pageIndex;
}

- (void)setOrderWayIndex:(NSInteger)orderWayIndex {
    _orderWayIndex = orderWayIndex;
    self.orderWayCollectionView.selectIndex = orderWayIndex;
}

- (void)setLevelIndex:(NSInteger)levelIndex {
    _levelIndex = levelIndex;
    self.levelCollectionView.selectIndex = levelIndex;
}

- (void)setPageArr:(NSArray *)pageArr {
    _pageArr = pageArr;
    self.pageCollectionView.data = pageArr;
}

- (void)setOrderWayArr:(NSArray *)orderWayArr {
    _orderWayArr = orderWayArr;
    self.orderWayCollectionView.data = orderWayArr;
}

- (void)setLevelArr:(NSArray *)levelArr {
    _levelArr = levelArr;
    self.levelCollectionView.data = levelArr;
}

#pragma mark - MWSLotteryBagListTopPageCollectionViewDelegate
- (void)pageCollectionViewDidSelectWithIndex:(NSInteger)index pageModel:(nonnull MWSLotteryBagListTopModel *)pageModel {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(bagListTopViewWithPageModel:)]) {
        [self.delegate bagListTopViewWithPageModel:pageModel];
    }
}

#pragma mark - MWSLotteryBagListTopOrderWayCollectionViewDelegate
- (void)orderWayCollectionDidSelectWithIndex:(NSInteger)index orderWayModel:(nonnull MWSLotteryBagListTopModel *)orderWayModel {
  
    if (self.delegate && [self.delegate respondsToSelector:@selector(bagListTopViewWithOrderWayModel:)]) {
        [self.delegate bagListTopViewWithOrderWayModel:orderWayModel];
    }
}

#pragma mark - MWSLotteryBagListTopLevelCollectionViewDelegate
- (void)levelCollectionDidSelectWithIndex:(NSInteger)index levelModel:(nonnull MWSLotteryBagListTopModel *)levelModel {
 
    if (self.delegate && [self.delegate respondsToSelector:@selector(bagListTopViewWithLevelModel:)]) {
        [self.delegate bagListTopViewWithLevelModel:levelModel];
    }
}

//lazy
- (MWSLotteryBagListTopPageCollectionView *)pageCollectionView {
    if (!_pageCollectionView) {
         
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        //水平
        flowLayout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 12, 0, 12);
        
        flowLayout.itemSize = CGSizeMake(100, 32);
        //    设置同一列中间隔的cell最小间距
        flowLayout.minimumInteritemSpacing = 8.0;
        //     设置最小行间距
        flowLayout.minimumLineSpacing = 16.0; 
        _pageCollectionView = [[MWSLotteryBagListTopPageCollectionView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth) collectionViewLayout:flowLayout];
        _pageCollectionView.selectIndex = 0;
        _pageCollectionView.collectionViewDelegate = self;

    }
    return _pageCollectionView;
}

- (MWSLotteryBagListTopOrderWayCollectionView *)orderWayCollectionView {
    if (!_orderWayCollectionView) {
     
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        //水平
        flowLayout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 12, 0, 12);
        
        flowLayout.itemSize = CGSizeMake(80, 32);
        //    设置同一列中间隔的cell最小间距
        flowLayout.minimumInteritemSpacing = 8.0;
        //     设置最小行间距
        flowLayout.minimumLineSpacing = 0.0;
        _orderWayCollectionView = [[MWSLotteryBagListTopOrderWayCollectionView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth) collectionViewLayout:flowLayout];
        _orderWayCollectionView.selectIndex = 0;
        _orderWayCollectionView.collectionViewDelegate = self;

    }
    return _orderWayCollectionView;
}

- (MWSLotteryBagListTopLevelCollectionView *)levelCollectionView {
    if (!_levelCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        //水平
        flowLayout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 12, 0, 12);
        
        flowLayout.itemSize = CGSizeMake(46, 32);
        //    设置同一列中间隔的cell最小间距
        flowLayout.minimumInteritemSpacing = 8.0;
        //     设置最小行间距
        flowLayout.minimumLineSpacing = 0.0;
        _levelCollectionView = [[MWSLotteryBagListTopLevelCollectionView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth) collectionViewLayout:flowLayout];
        _levelCollectionView.selectIndex = 0;
        _levelCollectionView.collectionViewDelegate = self;

    }
    return _levelCollectionView;
}
@end
