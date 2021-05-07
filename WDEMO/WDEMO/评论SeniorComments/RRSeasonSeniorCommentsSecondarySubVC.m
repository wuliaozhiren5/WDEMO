//
//  RRSeasonSeniorCommentsSecondarySubVC.m
//  PUClient
//
//  Created by rrtv on 2021/3/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsSecondarySubVC.h"
//#import "RRSeasonSeniorCommentsInputBar.h"
#import "RRSeasonSeniorCommentsSecondaryInputBar.h"
//#import "RRCommentService.h"
#import "RRSeasonSeniorCommentsHearder.h"
#import "RRSeasonSeniorCommentsSecondaryReplyCell.h"
#import "RRSeasonSeniorCommentsNoReplyListCell.h"

@interface RRSeasonSeniorCommentsSecondarySubVC () <UITableViewDataSource, UITableViewDelegate>
//@property (nonatomic, strong) RRCommentService *service;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RRSeasonSeniorCommentsSecondaryInputBar *bottomView;

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *headerLab;

@property (nonatomic, assign) BOOL isHalf;          //半屏
@property (nonatomic, strong) UIView *topBar;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIButton *closeBtn; //半屏

@property (nonatomic, copy) NSMutableArray *data;//数据

@end

@implementation RRSeasonSeniorCommentsSecondarySubVC

- (instancetype)initWithIsHalf:(BOOL)isHalf {
    self = [super init];
    if (self) {
        self.isHalf = isHalf;
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
//        _service = [[RRCommentService alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.customTabbar.hidden = YES;
    [self setupViews];
    [self refreshData];

    //    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    ////    view.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:view];
    //
    //    UILabel *tagLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 23, 11)];
    //    tagLab.textAlignment = NSTextAlignmentCenter;
    //    tagLab.font = SYSTEMFONT(8);
    //    tagLab.textColor = kCOLOR_0091FF;
    //    tagLab.backgroundColor = [kCOLOR_0091FF colorWithAlphaComponent:0.1];
    //    tagLab.layer.cornerRadius = 3;
    //    tagLab.layer.masksToBounds = YES;
    //    tagLab.text = @"NEW";
    //    [view addSubview:tagLab];
    //
    //    UILabel *countLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 11, 100, 11)];
    //    countLab.font = SYSTEMFONT(12);
    //    countLab.textColor = kCOLOR_88898F;
    //    countLab.text = @"1214";
    //    [view addSubview:countLab];
    //
    //    [tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(@(0));
    //        make.leading.equalTo(@(0));
    //        make.width.equalTo(@(23));
    //        make.height.equalTo(@(11));
    //    }];
    //    [countLab mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(@(11));
    //        make.leading.equalTo(@(0));
    //    }];
    //    [view mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.bottom.equalTo(countLab);
    //        make.trailing.equalTo(countLab);
    //    }];
}

- (void)refreshData {
    //iOS 读取本地Json文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"回复" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        //DLog(@"JSON解码失败");
    } else {
        //DLog(@"JSON解码成功");
    }
    NSDictionary *dic = (NSDictionary *)jsonObj;
    RRSeniorCommentsReplyListModel *model = [RRSeniorCommentsReplyListModel modelWithJSON:dic[@"data"]];
    self.data = [NSMutableArray arrayWithArray:model.content];
    [self.tableView reloadData];
    //显示
    self.tableView.hidden = NO;
    self.bottomView.hidden = NO;
    //定位
    [self tableViewLocation];
}

- (void)addHeader {
////    if (self.dataSource.dataArray.count > 0) {
//        if (self.tableView.mj_header) {
//            return;
//        }
//        WS(weakSelf);
//        self.tableView.mj_header = [MJDIYHeader headerWithRefreshingBlock:^{
//            [weakSelf refreshData];
//        }];
////    } else {
////        self.tableView.mj_header = nil;
////    }
}

- (void)addFooter {
//    if (self.dataSource.dataArray.count > 0) {
//        if (self.tableView.mj_footer) {
//            return;
//        }
//        WS(weakSelf)
//        MJDIYFooter *footer = [MJDIYFooter footerWithRefreshingBlock:^{
//            [weakSelf loadMoreData];
//        }];
//        [footer setTitle:@"" forState:MJRefreshStateIdle];
//        [footer setTitle:@"" forState:MJRefreshStateRefreshing];
//        [footer setTitle:@"已经到底啦～" forState:MJRefreshStateNoMoreData];
//        footer.stateLabel.font = [UIFont systemFontOfSize:12];
//        footer.stateLabel.textColor = kCOLOR_85888F;
//        self.tableView.mj_footer = footer;
//    } else {
//        self.tableView.mj_footer = nil;
//    }
}

- (void)tableViewSectionHeader {
//    NSInteger count = 10;
//    NSString *text = [NSString stringWithFormat:@"%zi条回复", count];
    NSString *text = @"";
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 21)];
    UILabel *headerLab = [[UILabel alloc] init];
    headerLab.frame = CGRectMake(16, 0, KWidth - 16 * 2, 21);
    headerLab.font = RR_MEDIUMFONT(17);
    headerLab.textColor = kCOLOR_dynamicProvider_222222_E5E7EB;
    headerLab.text = text;
    [header addSubview:headerLab];
    _header = header;
    _headerLab = headerLab;
}

//定位
- (void)tableViewLocation {
    if (!self.replyModel) {
        return;
    }

    NSInteger index = -1;
    for (NSInteger i = 0; i < self.data.count; i++) {
        RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:i];
        if ([model.ID isEqualToString:self.replyModel.ID]) {
            index = i;
            break;
        }
    }

    if (index < 0) {
        return;
    }
    //获取到需要跳转位置的行数
    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:index inSection:1];
    //滚动到其相应的位置
    [self.tableView scrollToRowAtIndexPath:scrollIndexPath
            atScrollPosition:UITableViewScrollPositionTop animated:NO];

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSIndexPath *indexpath =  [NSIndexPath indexPathForRow:index inSection:1];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexpath];
        //    cell.contentView.backgroundColor = [UIColor redColor];
            UIView *colorView = [[UIView alloc] initWithFrame:cell.bounds];
            colorView.backgroundColor = [kCOLOR_0091FF colorWithAlphaComponent:0.08];
            [cell.contentView addSubview:colorView];
            [cell.contentView sendSubviewToBack:colorView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [colorView removeFromSuperview];
        });
    });
    self.replyModel = nil;

    
    //old 不显示 所以加了一个延时
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:1]];
////    cell.contentView.backgroundColor = [UIColor redColor];
//    UIView *colorView = [[UIView alloc] initWithFrame:cell.bounds];
//    colorView.backgroundColor = [kCOLOR_0091FF colorWithAlphaComponent:0.08];
//    [cell.contentView addSubview:colorView];
//    [cell.contentView sendSubviewToBack:colorView];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [colorView removeFromSuperview];
//    });
//    self.replyModel = nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setupViews {
//    if (!_isFisrtRefreshSuccess) {
//        _isFisrtRefreshSuccess = YES;
        
        [self tableViewSectionHeader];
        [self.view addSubview:self.tableView];
        [self.view addSubview:self.bottomView];
        [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(53 - appMargin().bottom));
            make.leading.equalTo(@(0));
            make.trailing.equalTo(@(0));
            make.bottom.equalTo(@(0));
        }];
        
        if (!self.isHalf) {
            [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@(0));
                make.leading.equalTo(@(0));
                make.trailing.equalTo(@(0));
                make.bottom.equalTo(self.bottomView.mas_top).offset(0);
            }];
        } else {
            UIView *topBarBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 49)];
            topBarBackView.backgroundColor = kCOLOR_000000;
            [self.view addSubview:topBarBackView];

            [self.view addSubview:self.topBar];
            [self.topBar addSubview:self.titleLab];
            [self.topBar addSubview:self.closeBtn];
            [self.topBar mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.leading.trailing.equalTo(@0);
                make.height.equalTo(@49);
            }];
            [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(@16);
                make.trailing.equalTo(@-49);
                make.top.bottom.equalTo(@0);
            }];
            [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.trailing.bottom.equalTo(@0);
                make.width.height.equalTo(@49);
            }];
            [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.topBar.mas_bottom).offset(-10);
                make.leading.trailing.equalTo(@0);
                make.bottom.equalTo(self.bottomView.mas_top).offset(0);
            }];
//        }
    }
    self.tableView.hidden = YES;
    self.bottomView.hidden = YES;
//    self.bottomView.commentModel = self.commentModel;
    [self.view bringSubviewToFront:self.tableView];

}


- (void)clickTextBtn:(UIButton *)btn {
    //    WS(weakSelf);
    //    [self.service showSingleTextType:RRCommentViewTypeSeniorWriteComment placeholder:@"说点什么" superView:nil submitBlock:^(NSString * _Nonnull content) {
    //        DLog(@"%@",content);
    //        [[RRLogSDK sharedRRLogSDK] logWithId:RRStatisticsIdSeasonSendComment itemId:self.seasonId externDict:nil];
    //        [weakSelf.service closeReplyView];
    ////        [weakSelf articleReplay:content imageArray:nil toComment:nil subComment:nil];
    //    }];

//    WS(weakSelf);
//    [self.service showSeniorSingleTextType:RRCommentViewTypeSeniorWriteComment
//                               placeholder:@"说点什么"
//                                 superView:nil
//                               submitBlock:^(NSString *_Nonnull content, NSMutableArray *_Nonnull imageDataArray, BOOL isSpoiler) {
//
//                                 [weakSelf.service closeReplyView];
//                               }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        default:
            return self.data.count;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //     return [ArticleDetailCell cellHeightfor:model];
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
        {
            return [RRSeasonSeniorCommentsNoReplyListCell cellHeightWithModel:self.commentModel isShowAll:YES];
        }
            break;
        default:
        {
            RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
            return [RRSeasonSeniorCommentsSecondaryReplyCell cellHeightWithModel:model];
        }
            break;
    }
}

//header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 1:
            return 21.0;
            break;
        default:
            return 0.1;
            break;
    }
}

//footer高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 10.0;
            break;
        default:
            return 0.1;
            break;
    }
}

//自定义头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
        {
            return [[UIView alloc] init];
        }
            break;
        default:
        {
            return [[UIView alloc] init];

//            NSInteger count = self.commentModel.replyCount;
//            NSString *countStr = [NSString transformCountWithString:count];
//            NSString *text = @"";
//            if (countStr.length > 0) {
//                text = [NSString stringWithFormat:@"%@条回复", countStr];
//            }
//            _headerLab.text = text;
//            return _header;
        }
            break;
    }

}

//自定义脚
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
        {
            RRSeasonSeniorCommentsNoReplyListCell *cell = (RRSeasonSeniorCommentsNoReplyListCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonSeniorCommentsNoReplyListCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHalf = YES;
            cell.isShowMore = YES;
            cell.model = self.commentModel;
            cell.praiseBtn.hidden = YES;
            WS(weakSelf)
//            cell.clickText = ^(RRSeniorCommentsModel * _Nonnull model) {
//                [weakSelf clickCommentWithModel:model];
//            };
            cell.clickDelete = ^(RRSeniorCommentsModel * _Nonnull model) {
//                [weakSelf clickDeleteCommentWithModel:model];
            };
            return cell;
        }
            break;
            
        default:{
            RRSeasonSeniorCommentsSecondaryReplyCell *cell = (RRSeasonSeniorCommentsSecondaryReplyCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonSeniorCommentsSecondaryReplyCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHalf = YES;
            RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
            cell.model = model;
            WS(weakSelf)
//            cell.clickText = ^(RRSeniorCommentsModel * _Nonnull model) {
//                [weakSelf clickReplyWithModel:model];
//
//            };
            cell.clickDelete = ^(RRSeniorCommentsModel * _Nonnull model) {
//                [weakSelf clickDeleteReplyWithModel:model];
            };
            return cell;
        }
            break;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
        {
//            //点击cell回复评论
//            RRSeniorCommentsModel *model = self.commentModel;
//            [self clickCommentWithModel:model];
        }
            break;
        default:
        {
//            //点击cell回复回复
//            RRSeniorCommentsModel *model = [self.dataSource.dataArray objectOrNilAtIndex:indexPath.row];
//            [self clickReplyWithModel:model];
        }
            break;
    }
}

//lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
        //iOS11
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            //        self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[RRSeasonSeniorCommentsNoReplyListCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonSeniorCommentsNoReplyListCell class])];
        [_tableView registerClass:[RRSeasonSeniorCommentsSecondaryReplyCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonSeniorCommentsSecondaryReplyCell class])];
        
        
        //        WS(weakSelf)
        //        MJDIYFooter *footer = [MJDIYFooter footerWithRefreshingBlock:^{
        ////            [weakSelf loadMoreData];
        ////            [[RRLogSDK sharedRRLogSDK] logAliWithId:RRStatisticsSeasonCommentLoadMore itemId:weakSelf.seasonId externDict:nil];
        //        }];
        //        [footer setTitle:@"已经到底啦～" forState:MJRefreshStateNoMoreData];
        //        _tableView.mj_footer = footer;
        //        _tableView.mj_header = [MJDIYHeader headerWithRefreshingBlock:^{
        ////            [weakSelf refreshData];
        //        }];
        
        //        RRSeasonSeniorCommentHearder *header = [[RRSeasonSeniorCommentHearder alloc] initWithFrame:CGRectMake(0, 0, KWidth, 42)];
        //        header.clickStatusIndex = ^(UIResponder *sender, NSUInteger index) {
        //
        //        };
        //        header.clickSwichIndex = ^(UIResponder *sender, NSUInteger index) {
        //
        //        };
        //        _tableView.tableHeaderView = header;
    }
    return _tableView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[RRSeasonSeniorCommentsSecondaryInputBar alloc] initWithFrame:CGRectMake(0, 0, 320, 53)];
        [_bottomView.textBoxBtn addTarget:self action:@selector(clickTextBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bottomView];

        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.height.equalTo(@(53 - appMargin().bottom));
          make.leading.equalTo(@(0));
          make.trailing.equalTo(@(0));
          make.bottom.equalTo(@(0));
        }];
        //        [_bottomView sketchShadowWithOffsetX:0 offsetY:0 Blur:15 Spread:0 color:kCOLOR_dynamicProvider_Shadow_bar_000000Alpha008_000000Alpha14 alpha:1];
        
//        [_bottomView sketchShadowWithBottomBar];
    }
    return _bottomView;
}

//topBar
- (UIView *)topBar {
    if (!_topBar) {
        _topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 49)];
        _topBar.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
    }
    return _topBar;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KWidth, 49)];
        _titleLab.text = @"详情";
        _titleLab.font = SYSTEMFONT(17);
    }
    return _titleLab;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc] init];
        _closeBtn.frame = CGRectMake(0, 0, 40, 40);
        [_closeBtn setImage:IMAGENAME(@"ic_search_results_bar_close_28") forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(clickCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

- (void)clickCloseBtn:(UIButton *)btn {
    [self dismiss];
}

- (void)show {
    if (!self.isHalf) {
        return;
    }
    self.view.frame = CGRectMake(0, KHeight, KWidth, KHeight - playerViewHeight());
    [UIView animateWithDuration:0.25
                     animations:^{
                       self.view.frame = CGRectMake(0, playerViewHeight(), KWidth, KHeight - playerViewHeight());
                     }];
}

- (void)dismiss {
    if (!self.isHalf) {
        return;
    }
    [UIView animateWithDuration:0.25
        animations:^{
          self.view.frame = CGRectMake(0, KHeight, KWidth, KHeight - playerViewHeight());
        }
        completion:^(BOOL finished) {
          [self willMoveToParentViewController:nil];
          [self removeFromParentViewController];
          [self.view removeFromSuperview];
        }];
}

//- (NSString *)rr_UMemgPageName {
//    return @"剧集详情页";
//}
//
//- (NSString *)rr_UMemgChannelName {
//    return @"详情";
//}
@end
