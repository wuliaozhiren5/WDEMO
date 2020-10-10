//
//  RRSeasonTiebaHotDiscussionSubViewController.m
//  PUClient
//
//  Created by rrtv on 2020/9/29.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "RRSeasonTiebaHotDiscussionSubViewController.h"
#import "RRSeasonTiebaHotDiscussionBaseCell.h"
#import "RRSeasonTiebaHotDiscussionWebVC.h"

@interface RRSeasonTiebaHotDiscussionSubViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) RRDataSource *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation RRSeasonTiebaHotDiscussionSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.customTabbar.hidden = YES;
    self.loadingView.hidden = NO;
    self.loadingView.frame = CGRectMake(0, 200, KWidth, 200);
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    //    [self refreshData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;//self.dataSource.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RRSeasonTiebaHotDiscussionBaseCell *cell;
    //    cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionBaseCell class]) forIndexPath:indexPath];
    NSInteger imagesCount = 1;
    if (imagesCount >= 3) {
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionThreePictureCell class]) forIndexPath:indexPath];
    } else if (imagesCount > 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionSinglePictureCell class]) forIndexPath:indexPath];
        
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionTextCell class]) forIndexPath:indexPath];
    }
    [cell fillWithData:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger imagesCount = 1;
    if (imagesCount >= 3) {
        return [RRSeasonTiebaHotDiscussionThreePictureCell cellHeightWithModel:nil];
    } else if (imagesCount > 0) {
        return [RRSeasonTiebaHotDiscussionSinglePictureCell cellHeightWithModel:nil];
    } else {
        return [RRSeasonTiebaHotDiscussionTextCell cellHeightWithModel:nil];
    }
    
    //todo
    if (1) {
        
    } else {
        return 0;
    }
    return 500;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    RRHeadlineModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
    ////    [[RRAppLinkManager sharedManager] goBitDanceDetailWithUrl:model.jumpUrl];
    //    RRAmwayPageDetailController *vc = [[RRAmwayPageDetailController alloc] init];
    //    vc.amwayId = model.ID;
    //    [[RRAppLinkManager sharedManager] pushViewController:vc animated:YES];
    //    [[RRLogSDK sharedRRLogSDK] logAliWithId:RRStatisticsSeasonReviewClick itemId:_seasonId externDict:@{@"reviewId": model.ID ?: @"", @"index": @(indexPath.row)}];
    
    RRSeasonTiebaHotDiscussionWebVC *vc =  [[RRSeasonTiebaHotDiscussionWebVC alloc] init];
    [[RRAppLinkManager sharedManager] pushViewController:vc animated:YES];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.backgroundColor = [UIColor whiteColor];
        //BaseCell
        [_tableView registerClass:[RRSeasonTiebaHotDiscussionBaseCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionBaseCell class])];
        //只有文字
        [_tableView registerClass:[RRSeasonTiebaHotDiscussionTextCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionTextCell class])];
        //图片：小于3张图片
        [_tableView registerClass:[RRSeasonTiebaHotDiscussionSinglePictureCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionSinglePictureCell class])];
        //图片：3张以上图片
        [_tableView registerClass:[RRSeasonTiebaHotDiscussionThreePictureCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionThreePictureCell class])];
        
        //        WS(weakSelf)
        //        MJRefreshAutoStateFooter *footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
        //            [weakSelf loadMoreData];
        //            [[RRLogSDK sharedRRLogSDK] logAliWithId:RRStatisticsSeasonCommentLoadMore itemId:weakSelf.seasonId externDict:nil];
        //        }];
        //        [footer setTitle:@"已经到底啦～" forState:MJRefreshStateNoMoreData];
        //        _tableView.mj_footer = footer;
        //        _tableView.mj_header = [MJDIYHeader headerWithRefreshingBlock:^{
        //            [weakSelf refreshData];
        //        }];
        //        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 3)];
        //        _tableView.tableHeaderView = view;
    }
    return _tableView;
}
@end
