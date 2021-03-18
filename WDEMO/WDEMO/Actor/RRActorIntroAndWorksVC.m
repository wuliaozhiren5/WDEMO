//
//  RRActorIntroAndWorksVC.m
//  PUClient
//
//  Created by rrtv on 2021/3/9.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRActorIntroAndWorksVC.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "RRActorHeader.h"
#import "RRActorFooter.h"
#import "RRActorIntroCell.h"
#import "RRActorInfoCell.h"
#import <Masonry/Masonry.h>
#import "ACMacros.h"
#import "UIColor+color.h"

#import "RRActorIntroVC.h"

@interface RRActorIntroAndWorksVC ()<UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
//@property (nonatomic, strong) RRDataSource *dataSource;
//@property (nonatomic, copy) NSArray *data;
//@property (nonatomic, copy) NSArray *titleData;
//@property (nonatomic, copy) NSString *pageSize;
@property (nonatomic, assign) BOOL isShowMore;    //是否显示更多数据 默认NO
//@property (nonatomic, assign) BOOL isNoOtherData; //是否没有其他数据 默认NO

@end

@implementation RRActorIntroAndWorksVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.isShowMore = NO;
    //    self.isNoOtherData = NO;
    //    self.customTabbar.hidden = NO;
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
    
    //code cell
    [self.collectionView registerClass:[RRActorIntroCell class] forCellWithReuseIdentifier:NSStringFromClass([RRActorIntroCell class])];
    [self.collectionView registerClass:[RRActorInfoCell class] forCellWithReuseIdentifier:NSStringFromClass([RRActorInfoCell class])];
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
        make.top.equalTo(@0);
        make.leading.trailing.bottom.equalTo(@0);
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
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 10;
            break;
        default:
            return 0;
            break;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
        {
            RRActorIntroCell *cell = (RRActorIntroCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRActorIntroCell class]) forIndexPath:indexPath];
            //            cell.backgroundColor = [UIColor redColor];
            //            [cell.moreBtn addTarget:self action:@selector(clickActorInfoCellMoreBtn:) forControlEvents:(UIControlEventTouchUpInside)];
            ////            cell.isNoOtherData = self.isNoOtherData;
            //            cell.isShowMore = self.isShowMore;
            //            cell.model = nil;
            return cell;
        }
            break;
        case 1:{
            RRActorInfoCell *cell = (RRActorInfoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRActorInfoCell class]) forIndexPath:indexPath];
            //            cell.backgroundColor = [UIColor grayColor];
            [cell.moreBtn addTarget:self action:@selector(clickActorInfoCellMoreBtn:) forControlEvents:(UIControlEventTouchUpInside)];
            cell.isShowMore = self.isShowMore;
            cell.model = nil;
            return cell;
        }
            break;
        default:
        {
            UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
            cell.backgroundColor = [UIColor grayColor];
            return cell;
        }
            break;
    }
}

//定义并返回每个headerView或footerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]){
        RRActorHeader *header = (RRActorHeader *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([RRActorHeader class]) forIndexPath:indexPath];
        NSInteger section = indexPath.section;
        NSString *text = @"";
        switch (section) {
            case 0:
                text = @"明星简介";
                break;
            case 1:
                text = @"明星信息";
                break;
            case 2:
                text = @"作品集";
                break;
            default:
                break;
        }
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
    
    switch (indexPath.section) {
        case 2:
        {
            RRActorIntroVC *vc= [[RRActorIntroVC alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
      
        }
            break;
        default:
            return;
            break;
    }
     

}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
//指定项单元格的大小。
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
            return CGSizeMake(KWidth, 80);
            break;
        case 1:
        {
            CGFloat height = [RRActorInfoCell cellHeightWithModel:nil isShowMore:self.isShowMore];
            //            CGFloat showHeight = height;//显示的高度
            //            //按钮  28
            //            if (height <= 66) {
            //                //不显示more按钮                16
            //                showHeight += 16;
            //            } else {
            //                //显示more按钮                  36
            //                showHeight = 66 + 36;
            //            }
            //            //状态发生变化 显示全部
            //            if (self.isShowMore) {
            //                showHeight = height + 36;
            //            }
            return CGSizeMake(KWidth, height);
        }
            break;
        case 2:
        {
            CGFloat width = floor((KWidth - 16 - 16 - 8 - 8) / 3.0);
            CGFloat height = width * 183 / 109;
            return CGSizeMake(width, height);
        }
            break;
        default:
            return CGSizeMake(0, 0);
            break;
    }
}


// 每个区多少列
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section {
    
    switch (section) {
        case 2:
            return 3;
            break;
        default:
            return 1;
            break;
    }
}

//每一行之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    switch (section) {
        case 2:
            return 16.0;;
            break;
        default:
            return 0.0;
            break;
    }
}

//每一列之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumColumnSpacingForSectionAtIndex:(NSInteger)section {
    switch (section) {
        case 2:
            return 8.0;;
            break;
        default:
            return 0.0;
            break;
    }
}

// 每个区的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    switch (section) {
        case 2:
        {
            UIEdgeInsets edgeInsets = {0, 16, 0, 16};
            return edgeInsets;
        }
            break;
        default:
        {
            UIEdgeInsets edgeInsets = {0, 0, 0, 0};
            return edgeInsets;
        }
            break;
    }
}

// header的高度
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            
            return 41.0;
            //            return 0.0;
            break;
        default:
            return 41.0;
            break;
    }
}

- (void)clickActorInfoCellMoreBtn:(UIButton *)btn {
    self.isShowMore = !self.isShowMore;
    [self.collectionView reloadData];
    
}
@end
