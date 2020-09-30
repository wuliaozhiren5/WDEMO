//
//  RRSeasonTiebaHotDiscussionSubViewController.m
//  PUClient
//
//  Created by rrtv on 2020/9/29.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "RRSeasonTiebaHotDiscussionSubViewController.h"
#import "RRSeasonTiebaHotDiscussionBaseCell.h"

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
    
//   cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionTextCell class]) forIndexPath:indexPath];
//        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionSinglePictureCell class]) forIndexPath:indexPath];
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionThreePictureCell class]) forIndexPath:indexPath];
    [cell fillWithData:nil];

    
    
    
//    if (model.images.count >= 3) {
//        cell = [tableView dequeueReusableCellWithIdentifier:@"RRSeasonReviewThreePictureCell"];
//    } else if (model.images.count > 0) {
//        cell = [tableView dequeueReusableCellWithIdentifier:@"RRSeasonReviewSinglePictureCell"];
//    } else {
//        cell = [tableView dequeueReusableCellWithIdentifier:@"RRSeasonReviewTextCell"];
//    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 500;

//    RRHeadlineModel *model = self.dataSource.dataArray[indexPath.row];
//    if (model.images.count >= 3) {
//        return [RRSeasonReviewThreePictureCell heightForCellWithModel:model];
//    } else if (model.images.count > 0) {
//        return [RRSeasonReviewSinglePictureCell heightForCellWithModel:model];
//    } else {
//        return [RRSeasonReviewTextCell heightForCellWithModel:model];
//    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    RRHeadlineModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
////    [[RRAppLinkManager sharedManager] goBitDanceDetailWithUrl:model.jumpUrl];
//    RRAmwayPageDetailController *vc = [[RRAmwayPageDetailController alloc] init];
//    vc.amwayId = model.ID;
//    [[RRAppLinkManager sharedManager] pushViewController:vc animated:YES];
//    [[RRLogSDK sharedRRLogSDK] logAliWithId:RRStatisticsSeasonReviewClick itemId:_seasonId externDict:@{@"reviewId": model.ID ?: @"", @"index": @(indexPath.row)}];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.backgroundColor = [UIColor whiteColor];

        [_tableView registerClass:[RRSeasonTiebaHotDiscussionBaseCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionBaseCell class])];
        [_tableView registerClass:[RRSeasonTiebaHotDiscussionTextCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionTextCell class])];
        [_tableView registerClass:[RRSeasonTiebaHotDiscussionSinglePictureCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonTiebaHotDiscussionSinglePictureCell class])];
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
