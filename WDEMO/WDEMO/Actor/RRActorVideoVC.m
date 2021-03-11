//
//  RRActorVideoVC.m
//  PUClient
//
//  Created by rrtv on 2021/3/9.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRActorVideoVC.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "RRActorHeader.h"
#import "RRActorFooter.h"
#import "RRActorIntroCell.h"
#import "RRActorInfoCell.h"
#import <Masonry/Masonry.h>
#import "ACMacros.h"
#import "UIColor+color.h"

@interface RRActorVideoVC ()<UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
//@property (nonatomic, strong) RRDataSource *dataSource;
//@property (nonatomic, copy) NSArray *data;
//@property (nonatomic, copy) NSArray *titleData;
//@property (nonatomic, copy) NSString *pageSize;
//@property (nonatomic, assign) BOOL isShowMore;    //是否显示更多数据 默认NO
//@property (nonatomic, assign) BOOL isNoOtherData; //是否没有其他数据 默认NO

@end

@implementation RRActorVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.isShowMore = NO;
//    self.isNoOtherData = NO;
//    self.customTabbar.hidden = YES;
//    self.customTabbar.hidden = YES;
//    self.dataSource = [[RRDataSource alloc] init];
//    self.pageSize = @"10";
//    [self createData];
    [self setupViews];
//    self.loadingView.hidden = NO;
//    self.loadingView.center = CGPointMake(self.view.centerX, self.view.centerY - 99 - appMargin().top);
//    self.noDataView.center = self.loadingView.center;
//    [self refreshData];
}

- (void)setupViews {
    
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc]init];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //用来控制滚动视图是否反弹
    self.collectionView.bounces = YES;
    //alwaysBounceVertical设置垂直方向的反弹是否有效
    self.collectionView.alwaysBounceVertical = YES;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator =NO;
    //    self.collectionView.backgroundColor = kCOLOR_AppBackground;
    self.collectionView.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;

    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    
//    [self.collectionView registerNib:[UINib nibWithNibName:@"RRSearchResultMultipleRelevantCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([RRSearchResultMultipleRelevantCollectionViewCell class])];
//    [self.collectionView registerClass:[RRSearchResultSeasonCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([RRSearchResultSeasonCollectionViewCell class])];
//    [self.collectionView registerClass:[RRSearchResultMultipleSheetCell class] forCellWithReuseIdentifier:NSStringFromClass([RRSearchResultMultipleSheetCell class])];
//    [self.collectionView registerClass:[RRSearchResultMultipleUperCell class] forCellWithReuseIdentifier:NSStringFromClass([RRSearchResultMultipleUperCell class])];
//    [self.collectionView registerNib:[UINib nibWithNibName:@"RRSearchResultVideoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([RRSearchResultVideoCollectionViewCell class])];
//    [self.collectionView registerClass:[RRSearchResultMultipleStarCell class] forCellWithReuseIdentifier:NSStringFromClass([RRSearchResultMultipleStarCell class])];
//    //header
//    [self.collectionView registerNib:[UINib nibWithNibName:@"RRSearchResultMultipleCollectionViewHeader" bundle:nil] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([RRSearchResultMultipleCollectionViewHeader class])];
//
//    [self.collectionView registerNib:[UINib nibWithNibName:@"RRSearchResultMultipleCollectionViewFooter" bundle:nil] forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([RRSearchResultMultipleCollectionViewFooter class])];
      
    
    //code cell
    [self.collectionView registerClass:[RRActorIntroCell class] forCellWithReuseIdentifier:NSStringFromClass([RRActorIntroCell class])];
//    [self.collectionView registerClass:[RRActorInfoCell class] forCellWithReuseIdentifier:NSStringFromClass([RRActorInfoCell class])];
    //xib cell
//    [self.collectionView registerNib:[UINib nibWithNibName:@"RRActorIntroCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([RRActorIntroCell class])];
//    [self.collectionView registerNib:[UINib nibWithNibName:@"RRActorInfoCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([RRActorInfoCell class])];

    
    //xib header footer
    [self.collectionView registerNib:[UINib nibWithNibName:@"RRActorHeader" bundle:nil] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([RRActorHeader class])];
    [self.collectionView registerNib:[UINib nibWithNibName:@"RRActorFooter" bundle:nil] forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([RRActorFooter class])];
    //code header footer
//    [self.collectionView registerClass:[RRActorHeader class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([RRActorHeader class])];
//    [self.collectionView registerClass:[RRActorFooter class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([RRActorFooter class])];
 
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
//    WS(weakSelf)
//    MJRefreshAutoStateFooter *footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
////        [weakSelf loadMoreData];
//    }];
//    [footer setTitle:@"" forState:MJRefreshStateIdle];
//    //    [footer setTitle:@"" forState:MJRefreshStateRefreshing];
//    [footer setTitle:@"已经到底啦～" forState:MJRefreshStateNoMoreData];
//    footer.stateLabel.font = [UIFont systemFontOfSize:12];
//    footer.stateLabel.textColor = kCOLOR_85888F;
//    self.collectionView.mj_footer = footer;
    
}

#pragma mark --UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    RRSearchResultVideoCollectionViewCell *cell = (RRSearchResultVideoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRSearchResultVideoCollectionViewCell class]) forIndexPath:indexPath];
//    RRSearchVideoNewDataModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.item];
//    cell.model = model;
//    if (!model.rr_contentContext) {
//        RRUmengContentContext *context = [[RRUmengContentContext alloc] init];
//        context.contentName = model.title;
//        context.contentID = @(model.ID).stringValue;
//        context.contentType = kRRUmengEventVideoTypeValueShortVideo;
//        context.page = self.rr_UMemgPageName;
//        context.channel = self.rr_UMemgChannelName;
//        context.location = @(indexPath.row).stringValue;
//        context.searchKeyword = self.searchWord;
//        model.rr_contentContext = context;
//    }
//    cell.rr_statisticsExposureModel = model;
//    return cell;
    
 
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

//定义并返回每个headerView或footerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]){
        RRActorHeader *header = (RRActorHeader *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([RRActorHeader class]) forIndexPath:indexPath];
        NSString *text = @"休闲鞋";
        header.titleLab.text = text;
        return header;
     } else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter]) {
        RRActorFooter *footer = (RRActorFooter *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([RRActorFooter class]) forIndexPath:indexPath];
        return footer;
    } else {
        RRSafeEndOfCollectionReusableView;
    }
}
 
#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
//指定项单元格的大小。
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    RRSearchVideoNewDataModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.item];
//    CGFloat height = [RRSearchResultVideoCollectionViewCell heightForCellWithModel:model];
//    CGFloat width = (KWidth - 16 - 16 - 8) / 2;
     
 
    return CGSizeMake(KWidth, KWidth);
 
}

// 每个区多少列
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section {
    return 2;
}

//每一行之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 8;
}

//每一列之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumColumnSpacingForSectionAtIndex:(NSInteger)section {
    return 8.0;
}

// 每个区的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    UIEdgeInsets edgeInsets = {12, 16, 12, 16};
    return edgeInsets;
}

// header的高度
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section {
    return 41.0;
}
@end
