//
//  RRAllRankingListVC.m
//  WDEMO
//
//  Created by rrtv on 2021/10/20.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRAllRankingListVC.h"
#import "RRAllRankingListCell.h"
#import "RRAllRankingListHeader.h"
#import "CHTCollectionViewWaterfallLayout.h"
//#import "RRAllRankingListApi.h"
#import "RRAllRankingListModel.h"

@interface RRAllRankingListVC ()<UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
//@property (nonatomic, strong) RRDataSource *dataSource;
//@property (nonatomic, copy) NSArray *data;
//@property (nonatomic, copy) NSArray *titleData;
//@property (nonatomic, copy) NSString *pageSize;
//@property (nonatomic, assign) BOOL isShowMore;    //是否显示更多数据 默认NO
//@property (nonatomic, assign) BOOL isNoOtherData; //是否没有其他数据 默认NO

@property (nonatomic, copy) NSArray *data;

@end

@implementation RRAllRankingListVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.customTabbar.hidden = YES;
//    self.dataSource = [[RRDataSource alloc] init];
//
//    self.loadingView.hidden = NO;
//    self.loadingView.center = CGPointMake(self.view.centerX, self.view.centerY - 99 - appMargin().top);
//    self.noDataView.center = self.loadingView.center;
 
    [self setupViews];
    [self refreshData];
}

- (void)refreshData {
    //iOS 读取本地Json文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"排行榜列表" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        //DLog(@"JSON解码失败");
    } else {
        //DLog(@"JSON解码成功");
    }
    NSDictionary *dic = (NSDictionary *)jsonObj;
    RRAllRankingListModel *model = [RRAllRankingListModel modelWithJSON:dic[@"data"]];
    self.data = [NSMutableArray arrayWithArray:model.content];
    [self.collectionView reloadData];
 
}

//- (void)requestData {
//    [self refreshData];
//}
//
//- (void)refreshData {
//    if (self.dataSource.isLoading) {
//        if (!self.dataSource.isRefreshing && self.collectionView.mj_header.isRefreshing) {
//            [self.collectionView.mj_header endRefreshing];
//        }
//        return;
//    }
//    self.dataSource.isLoading = YES;    //loading中
//    self.dataSource.isRefreshing = YES; //下拉加载
//    [self loadDataWithPage:1];
//}
//
//- (void)loadMoreData {
//    if (self.dataSource.isLoading) {
//        if (self.dataSource.isRefreshing && self.collectionView.mj_footer.isRefreshing) {
//            [self.collectionView.mj_footer endRefreshing];
//        }
//        return;
//    }
//    self.dataSource.isLoading = YES; //loading中
//    self.dataSource.isRefreshing = NO;//上拉加载
//
//    [self loadDataWithPage:self.dataSource.page + 1];
//}
//
//- (void)loadDataWithPage:(NSInteger)page {
//    NSString *topId = self.rankingContentModel.ID;
//    NSInteger pageSize = 10;
//    WS(weakSelf)
//    [RRAllRankingListApi requestAllRankingListWithTopId:topId
//                                                   page:page
//                                               pageSize:pageSize
//                                                  block:^(RRAllRankingListModel * _Nonnull model, NSError * _Nonnull error) {
//        //        //测试代码
//        //        error = [[NSError alloc] init];
//        if (error) {
//            if (weakSelf.loadingView) {
//                if (weakSelf.loadingView.isHidden) {
//                    TOAST(@"加载失败");
//                } else {
//                    weakSelf.loadingView.msgType = RRMJLoadingErrorDefault;
//                    weakSelf.dataSource.error = error;
//                }
//            }
//            [weakSelf stopLoading];
//            return;
//        }
//        //        listArray = @[];
//        weakSelf.loadingView.hidden = YES;
//        [weakSelf.dataSource appendDatas:model.content];
//        weakSelf.dataSource.isLoading = NO;
//        weakSelf.dataSource.isRefreshing = NO;
//        weakSelf.dataSource.noMoreData = model.isEnd;
//        weakSelf.dataSource.error = error;
//        weakSelf.dataSource.page = page;
//        [weakSelf stopLoading];
//
//    }];
//}
//
//- (void)stopLoading {
//
//    self.dataSource.isLoading = NO;
//    self.dataSource.isRefreshing = NO;
//
//    [self addHeader];
//    [self addFooter];
//    [self.collectionView.mj_footer endRefreshing];
//    [self.collectionView.mj_header endRefreshing];
//
//    if (self.dataSource.noMoreData) {
//        [self.collectionView.mj_footer endRefreshingWithNoMoreData];
//    } else {
//        [self.collectionView.mj_footer resetNoMoreData];
//    }
//
//    self.noDataView.hidden = !self.dataSource.isNoData;
//    self.noDataView.placeText = @"抱歉，没有找到相关内容";
//    [self.collectionView reloadData];
//
//}
//
//- (void)addHeader {
//    if (self.collectionView.mj_header) {
//        return;
//    }
//    @weakify(self)
//    MJDIYHeader *header = [MJDIYHeader headerWithRefreshingBlock:^{
//        @strongify(self)
//        [self refreshData];
//    }];
//    self.collectionView.mj_header = header;
//}
//
//- (void)removeHeader {
//    if (self.collectionView.mj_header) {
//        [self.collectionView.mj_header endRefreshing];
//        self.collectionView.mj_header = nil;
//    }
//}
//
//- (void)addFooter {
//    if (self.dataSource.dataArray.count <= 0) {
////        self.collectionView.mj_footer = nil;
//        [self removeFooter];
//        return;
//    }
//    if (self.collectionView.mj_footer) {
//        return;
//    }
//    @weakify(self)
//    MJDIYFooter *footer = [MJDIYFooter footerWithRefreshingBlock:^{
//        @strongify(self)
//        [self loadMoreData];
//    }];
//    [footer setTitle:@"" forState:MJRefreshStateIdle];
//    [footer setTitle:@"" forState:MJRefreshStateRefreshing];
//    [footer setTitle:@"已经到底啦～" forState:MJRefreshStateNoMoreData];
//    footer.stateLabel.font = [UIFont systemFontOfSize:12];
//    footer.stateLabel.textColor = kCOLOR_85888F;
//    self.collectionView.mj_footer = footer;
//}
//
//- (void)removeFooter {
//    if (self.collectionView.mj_footer) {
//        [self.collectionView.mj_footer endRefreshing];
//        self.collectionView.mj_footer = nil;
//    }
//}

- (void)setupViews {
    [self createCollectionView];
//    [self.view bringSubviewToFront:self.loadingView];
//    [self.view bringSubviewToFront:self.noDataView];
}

- (void)createCollectionView {
    
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
  
    [self.collectionView registerClass:[RRAllRankingListCell class] forCellWithReuseIdentifier:NSStringFromClass([RRAllRankingListCell class])];

    //xib header footer
//    [self.collectionView registerNib:[UINib nibWithNibName:@"RRActorHeader" bundle:nil] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([RRActorHeader class])];
//    [self.collectionView registerNib:[UINib nibWithNibName:@"RRActorFooter" bundle:nil] forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([RRActorFooter class])];
    //code header footer
    [self.collectionView registerClass:[RRAllRankingListHeader class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([RRAllRankingListHeader class])];
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
 
    self.scrollView = self.collectionView;
}

#pragma mark --UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor grayColor];
//    return cell;
     
    RRAllRankingListCell *cell = (RRAllRankingListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRAllRankingListCell class]) forIndexPath:indexPath];
    RRAllRankingModel *model = [self.data objectOrNilAtIndex:indexPath.item];
    @weakify(self);
    cell.clickBanner = ^(RRAllRankingModel * _Nonnull allRankingModel, RRSeniorCommentsImageModel * _Nonnull imageModel, NSInteger index) {
        @strongify(self);
        NSLog(@"点击排行榜cell的banner");
        //跳转
        [self goSeasonDetailWithModel:allRankingModel];
//        //埋点
//        NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
//        paramDict[kRRUmengEventKeySourcePage] = self.rr_UMemgPageName;
////        paramDict[kRRUmengEventKeySourceChannel] = @"";
//        paramDict[kRRUmengEventKeySourceGroup] = self.rankingContainerModel.name;
//        paramDict[kRRUmengEventKeySourceSection] = self.rankingContentModel.name;
//        paramDict[kRRUmengEventKeyContentName] = @"剧照";
//        paramDict[kRRUmengEventKeyContentID] =  @"";
//        paramDict[kRRUmengEventKeyContentType] = @"图片";
//        paramDict[kRRUmengEventKeySeason] = model.dramaId;
//        paramDict[kRRUmengEventKeySourceLocation] = @(index);
//        [RRUMengLogger contentClickedWithParams:paramDict];

    };
    cell.slideBanner = ^(RRAllRankingModel * _Nonnull allRankingModel, RRSeniorCommentsImageModel * _Nonnull imageModel, NSInteger index) {
        @strongify(self);
//        NSLog(@"滑动排行榜cell的banner");
//        //埋点
//        NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
//        paramDict[kRRUmengEventKeyExposurePage] = self.rr_UMemgPageName;
////        paramDict[kRRUmengEventKeyExposureChannel] = @"";
//        paramDict[kRRUmengEventKeyExposureGroup] = self.rankingContainerModel.name;
//        paramDict[kRRUmengEventKeyExposureSection] = self.rankingContentModel.name;
//        paramDict[kRRUmengEventKeyContentName] = @"剧照";
//        paramDict[kRRUmengEventKeyContentID] =  @"";
//        paramDict[kRRUmengEventKeyContentType] = @"图片";
//        paramDict[kRRUmengEventKeySeason] = model.dramaId;
//        paramDict[kRRUmengEventKeyExposureLocation] = @(index);
//        [RRUMengLogger contentExposureWithParams:paramDict];
    };
    
    cell.model = model;
    cell.row = indexPath.item;
    
//    if (!model.rr_contentContext) {
//        RRUmengContentContext *context = [[RRUmengContentContext alloc] init];
//        context.contentName = model.title;
//        context.contentID = model.dramaId;
//        context.contentType = kRRUmengEventVideoTypeValueLongVideo;
//        context.page = self.rr_UMemgPageName;
////        context.channel = self.channel;
//        context.group = self.rankingContainerModel.name;
//        context.section = self.rankingContentModel.name;
//        context.location = @(indexPath.row).stringValue;
//        model.rr_contentContext = context;
//    }
//    cell.rr_statisticsExposureModel = model;
    return cell;
}

//定义并返回每个headerView或footerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]){
        RRAllRankingListHeader *header = (RRAllRankingListHeader *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([RRAllRankingListHeader class]) forIndexPath:indexPath];
        header.titleLab.text = self.rankingContentModel.showRules ?: @"";
        return header;
     } else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter]) {
         RRSafeEndOfCollectionReusableView;
    } else {
        RRSafeEndOfCollectionReusableView;
    }
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //todo
    NSLog(@"点击排行榜cell");
    RRAllRankingModel *model = [self.data objectOrNilAtIndex:indexPath.item];
    [self goSeasonDetailWithModel:model];

}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
//指定项单元格的大小。
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    RRSearchVideoNewDataModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.item];
//    CGFloat height = [RRSearchResultVideoCollectionViewCell heightForCellWithModel:model];
//    CGFloat width = (KWidth - 16 - 16 - 8) / 2;
     
    RRAllRankingModel *model = [self.data objectOrNilAtIndex:indexPath.item];
    CGFloat height = [RRAllRankingListCell cellHeightWithModel:model];
    CGFloat width = KWidth;
    return CGSizeMake(width, height);
}

// 每个区多少列
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section {
    return 1;
}

//每一行之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1.0;
}

//每一列之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumColumnSpacingForSectionAtIndex:(NSInteger)section {
    return 1.0;
}

// 每个区的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    UIEdgeInsets edgeInsets = {0, 0, 0, 0};
    return edgeInsets;
}

// header的高度
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section {
    return 15.0;
}

- (void)goSeasonDetailWithModel:(RRAllRankingModel *)model {
//    [[RRAppLinkManager sharedManager] goSeasonDetail:model.dramaId title:model.title isMovie:NO toRoot:NO];
}

- (NSString *)rr_UMemgPageName {
    return @"排行榜列表页";
}
@end
