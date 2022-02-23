//
//  RRAllRankingSwitchView.m
//  NJVideo
//
//  Created by WDEMO on 2021/12/3.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRAllRankingSwitchView.h"
#import "RRAllRankingSwitchViewCell.h"

@interface RRAllRankingSwitchView ()<UICollectionViewDelegate, UICollectionViewDataSource>
//容器
@property (nonatomic, strong) UIView *container;
//点击事件
@property (nonatomic, strong) UIControl *control;
//列表
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation RRAllRankingSwitchView 

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {

    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.container];
    [self.container addSubview:self.control];
    [self.container addSubview:self.collectionView];

    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    [self.control mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
  
}

- (void)setTagArr:(NSArray *)tagArr {
    _tagArr = tagArr;
    [self.collectionView reloadData];
    [self layoutIfNeeded];
    
    //163 = 33 * 3 + 20 *2 + 12 * 2
    CGFloat maxHeight = 163;
    CGFloat height = self.collectionView.contentSize.height;
    if (self.collectionView.contentSize.height > maxHeight) {
        height = maxHeight;
    }
    self.collectionView.frame = CGRectMake(0, 0, KWidth, height);
    
}

#pragma mark -- UICollectionViewDataSource
//有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tagArr.count;
}

//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    RRAllRankingSwitchViewCell *cell = (RRAllRankingSwitchViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRAllRankingSwitchViewCell class]) forIndexPath:indexPath];
 
    NSString *str = [self.tagArr objectOrNilAtIndex:indexPath.item];
    cell.titleStr = str ?: @"";
    cell.isSelected = (indexPath.item == self.selectIndex);
    return cell;
}

#pragma mark -- UICollectionViewDelegate
//UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //iOS 中获取当前点击的cell
    NSInteger item = indexPath.item; 
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickAllRankingSwitchViewIndex:)]) {
        [self.delegate clickAllRankingSwitchViewIndex:item];
    }
    [self hidden];
}

- (void)show {
}

- (void)hidden {
    [self removeFromSuperview];
    if (self.delegate && [self.delegate respondsToSelector:@selector(hiddenAllRankingSwitchView)]) {
        [self.delegate hiddenAllRankingSwitchView];
    }
}

//lazy
- (UIView *)container {
    if (!_container) {
        _container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 320)];
        _container.backgroundColor = [kCOLOR_000000 colorWithAlphaComponent:0.7];

    }
    return _container;
}

- (UIControl *)control {
    if (!_control) {
        _control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, KWidth, 320)];
        [_control addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
//        _control.backgroundColor = [kCOLOR_000000 colorWithAlphaComponent:0.7];
    }
    return _control;
}

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        //垂直
        flowLayout.scrollDirection= UICollectionViewScrollDirectionVertical;
        //设置senction的内边距
        flowLayout.sectionInset = UIEdgeInsetsMake(20, 16, 20, 16);
        //    Math中的round/ceil/floorf方法总结
        flowLayout.itemSize = CGSizeMake((KWidth - 16 * 2 - 20 * 2) / 3, 33);
        //    设置同一列中间隔的cell最小间距
        flowLayout.minimumInteritemSpacing = 0.0;
        //     设置最小行间距
        flowLayout.minimumLineSpacing = 12.0;
        
        //初始化collectionView
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KWidth, 320) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
    //    _collectionView.showsHorizontalScrollIndicator = NO;
    //    _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = kCOLOR_FFFFFF;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
        [_collectionView registerClass:[RRAllRankingSwitchViewCell class] forCellWithReuseIdentifier:NSStringFromClass([RRAllRankingSwitchViewCell class])];
    //
    //    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    //    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
    }
    return _collectionView;
 }
 
- (void)dealloc {
    
}
@end
