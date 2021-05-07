//
//  RRSeasonSeniorCommentsSubVC.m
//  PUClient
//
//  Created by rrtv on 2021/3/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsSubVC.h"
#import "RRSeasonSeniorCommentsInputBar.h"
//#import "RRCommentService.h"
#import "RRSeasonSeniorCommentsHearder.h"
#import "RRSeasonSeniorCommentsHasReplyListCell.h"
#import "RRSeasonSeniorCommentsSecondarySubVC.h"
//#import "RRAlertBase.h"
#import "RRSeniorCommentsModel.h"


@interface RRSeasonSeniorCommentsSubVC ()<UITableViewDataSource,UITableViewDelegate>
//@property (nonatomic, strong) RRCommentService *service;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RRSeasonSeniorCommentsInputBar *bottomView;

@property (nonatomic, copy) NSMutableArray *data;//数据
@end

@implementation RRSeasonSeniorCommentsSubVC

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
    self.data = [NSMutableArray array];
    
    [self setupViews];
    [self refreshData];

    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UILabel *tagLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 23, 11)];
    tagLab.textAlignment = NSTextAlignmentCenter;
    tagLab.font = SYSTEMFONT(8);
    tagLab.textColor = kCOLOR_0091FF;
    tagLab.backgroundColor = [kCOLOR_0091FF colorWithAlphaComponent:0.1];
    tagLab.layer.cornerRadius = 3;
    tagLab.layer.masksToBounds = YES;
    tagLab.text = @"NEW";
    [view addSubview:tagLab];

    UILabel *countLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 11, 100, 11)];
    countLab.font = SYSTEMFONT(12);
    countLab.textColor = kCOLOR_88898F;
    countLab.text = @"1214";
    [view addSubview:countLab];

    [tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.leading.equalTo(@(0));
        make.width.equalTo(@(23));
        make.height.equalTo(@(11));
    }];
    [countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(11));
        make.leading.equalTo(@(0));
    }]; 
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(countLab);
        make.trailing.equalTo(countLab);
    }];
}

//隐藏导航栏
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)refreshData {
    //iOS 读取本地Json文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"评论" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        //DLog(@"JSON解码失败");
    } else {
        //DLog(@"JSON解码成功");
    }
    NSDictionary *dic = (NSDictionary *)jsonObj;
    RRSeniorCommentsListModel *model = [RRSeniorCommentsListModel modelWithJSON:dic[@"data"]];
    self.data = [NSMutableArray arrayWithArray:model.content];
    [self.tableView reloadData];

}

- (void)setupViews {
 
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(53 - appMargin().bottom));
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.bottom.equalTo(@(0));
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.bottom.equalTo(self.bottomView.mas_top).offset(0);
    }];
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
//    [self.service showSeniorSingleTextType:RRCommentViewTypeSeniorWriteComment placeholder:@"说点什么" superView:nil submitBlock:^(NSString * _Nonnull content, NSMutableArray * _Nonnull imageDataArray, BOOL isSpoiler) {
//
//        [weakSelf.service closeReplyView];
//    }];
     
}

//- (void)showAlertView {
//    WS(weakSelf);
//    RRAlertItem *item1 = [[RRAlertItem alloc] initWithTitle:@"复制" itemImg:IMAGENAME(@"ic_popbar_report") itemStyle:RRAlertItemStyleListIconText];
//    item1.actionBlock = ^(RRAlertItem *item) {
//        NSLog(@"点击了%@",item.title);
////        [weakSelf.base dismissWithAnimation:YES];
//     };
//
//    RRAlertItem *item2 = [[RRAlertItem alloc] initWithTitle:@"删除" itemImg:IMAGENAME(@"ic_popbar_report") itemStyle:RRAlertItemStyleListIconText];
//    item2.actionBlock = ^(RRAlertItem *item) {
//        NSLog(@"点击了%@",item.title);
////        [weakSelf.base dismissWithAnimation:YES];
//     };
//
//    RRAlertItem *item3 = [[RRAlertItem alloc] initWithTitle:@"举报" itemImg:IMAGENAME(@"ic_popbar_report") itemStyle:RRAlertItemStyleListIconText];
//    item3.actionBlock = ^(RRAlertItem *item) {
//        NSLog(@"点击了%@",item.title);
////        [weakSelf.base dismissWithAnimation:YES];
//     };
//
//    BOOL isMy = NO;
//    //复制,删除
//    NSArray *itemArray = @[item1, item2];
//    if (!isMy) {
//        itemArray = @[item1, item3];
//    }
//    NSString *title = @"举报毒舌电影：好搞笑哦好好看撒大噶点范德萨发的撒范德萨到发疯剧啊撒地方大法大范德萨发到点点滴滴带的…";
//    RRAlertBase *alert = [[RRAlertBase alloc] initWithTitle:nil itemArray:itemArray];
//    [alert titleStyleWithText:title lines:2 textColor:kCOLOR_898A91 font:SYSTEMFONT(14) lineHeihgt:6];
//    [alert showWithAnimation:YES];
//
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    return [RRSeasonSeniorCommentsHasReplyListCell cellHeightWithModel:model isShowAll:NO];
}

//header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0;
}

//footer高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0;
}

//自定义头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

//自定义脚
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     
    RRSeasonSeniorCommentsHasReplyListCell *cell = (RRSeasonSeniorCommentsHasReplyListCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonSeniorCommentsHasReplyListCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.isHalf = YES;
    RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    cell.model = model;
    WS(weakSelf)
//    cell.clickText = ^(RRSeniorCommentsModel *_Nonnull model) {
//        [weakSelf clickCommentWithModel:model];
//    };
    cell.clickDelete = ^(RRSeniorCommentsModel * _Nonnull model) {
//        [weakSelf clickDeleteWithModel:model];
    };
    return cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return;
    
//    RRSeasonSeniorCommentsSecondarySubVC *next = [[RRSeasonSeniorCommentsSecondarySubVC alloc] init];
//    [[RRAppLinkManager sharedManager] pushViewController:next animated:YES];
    
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    [self presentViewController:vc animated:YES completion:nil];

    
//    UIViewController *vc = [[UIViewController alloc] init]; 
//    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
//    vc.modalPresentationCapturesStatusBarAppearance = YES;
//    [self presentViewController:vc animated:YES completion:nil];
    
    RRSeasonSeniorCommentsSecondarySubVC *vc = [[RRSeasonSeniorCommentsSecondarySubVC alloc] initWithIsHalf:YES];
//    vc.actorId = [NSString stringWithFormat:@"%lld", model.ID];
//    vc.name = model.chineseName;
//    vc.communityEnable = model.communityEnable;
//    UIViewController *topVC = [UIViewController topViewController];
    UIViewController *topVC = self;
    [topVC addChildViewController:vc];
    [vc didMoveToParentViewController:topVC];
    [topVC.view addSubview:vc.view];
    [vc show];
    
    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if ([self.fatherVC respondsToSelector:@selector(scrollViewDidScroll:)]) {
//        [self.fatherVC scrollViewDidScroll:scrollView];
//    }
}

//lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
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
        [_tableView registerClass:[RRSeasonSeniorCommentsHasReplyListCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonSeniorCommentsHasReplyListCell class])];
        
 
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
        
        RRSeasonSeniorCommentsHearder *header = [[RRSeasonSeniorCommentsHearder alloc] initWithFrame:CGRectMake(0, 0, KWidth, 42)];
        header.clickStatusIndex = ^(UIResponder *sender, NSUInteger index) {
             
        };
        header.clickSwichIndex = ^(UIResponder *sender, NSUInteger index) {
            
        };
        _tableView.tableHeaderView = header;
    }
    return _tableView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[RRSeasonSeniorCommentsInputBar alloc] initWithFrame:CGRectMake(0, 0, 320, 53)];
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

//- (NSString *)rr_UMemgPageName {
//    return @"剧集详情页";
//}
//
//- (NSString *)rr_UMemgChannelName {
//    return @"详情";
//}

@end
 
