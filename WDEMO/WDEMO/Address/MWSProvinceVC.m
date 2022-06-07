//
//  MWSProvinceVC.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/18.
//

#import "MWSProvinceVC.h"
#import "MWSCityListApi.h"
#import "MWSProvinceModel.h"
#import "MWSCityCell.h"
#import "MWSCityVC.h"

@interface MWSProvinceVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
 
@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) UILabel *topViewTitleLab;

@property (nonatomic, copy) NSArray *data;

@end

@implementation MWSProvinceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationBarView.titleLabel.text = @"选择所在省";
//    self.navigationBarView.leftButton.hidden = NO;
 
    [self setupViews];
//    [self startAnimating];
//    [self refreshData];
}

////刷新数据
//- (void)requestData {
//    [self startAnimating];
//    [self refreshData];
//
//}
//
//- (void)refreshData {
//    [self loadData];
//}
//
//- (void)loadData {
//
//    @weakify(self);
//    [MWSCityListApi requestAddressListWithBlock:^(NSArray * _Nonnull array, NSError * _Nonnull error) {
//
//        @strongify(self);
//        //        //测试代码
////        error = [[NSError alloc] init];
//        if (error) {
//            [self stopAnimating];
//            if (self.loadingView) {
//                @weakify(self);
//                [self handleError:error showType:MWSErrorShowTypeCover tapAction:^{
//                    @strongify(self);
//                    [self requestData];
//                }];
//            } else {
//                TOAST(@"加载失败");
//            }
//            return;
//        } else {
//            [self hideExceptionHint];
//        }
//
//        //        listArray = @[];
//        [self stopAnimating];
//        [self.loadingView removeFromSuperview];
//        self.loadingView = nil;
//
//        self.data = array;
//
//        [self.tableView reloadData];
//
//    }];
//}
//
//- (void)showErrorView {
//    if (self.baseAdapter.error) {
//        if (self.baseAdapter.isNoData) {
//            @weakify(self);
//            [self handleError:self.baseAdapter.error showType:MWSErrorShowTypeCover tapAction:^{
//                @strongify(self);
//                [self requestData];
//            }];
//        } else {
//            TOAST(@"加载失败");
//            //            [self handleError:self.baseAdapter.error showType:MWSErrorShowTypeToast tapAction:nil];
//        }
//    } else {
//        [self hideExceptionHint];
//    }
//}

- (void)setupViews {
    //按钮
//    [self showNavigationBarBtn];
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.topViewTitleLab];
    [self.view addSubview:self.tableView];
    
    self.topView.hidden = YES;
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.navigationBarView.mas_bottom).offset(0);
        make.top.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@40);
    }];
    
    [self.topViewTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.leading.equalTo(@12);
//        make.trailing.equalTo(@0);
//        make.height.equalTo(@40);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.topView.mas_bottom).offset(0);
//        make.top.equalTo(self.navigationBarView.mas_bottom).offset(0);
        make.top.equalTo(@0);
        make.bottom.equalTo(@(appMargin().bottom));
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
    }];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
    return self.data.count;
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 50;
}
////header高度
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 0.0;
//}
//
////footer高度
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 0.0;
//}
//
////自定义头
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    return [[UIView alloc] init];
//}
//
////自定义脚
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    return [[UIView alloc] init];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MWSCityCell *cell = (MWSCityCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MWSCityCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
     cell.nameLab.text = @"上海cs";
//    MWSProvinceModel *model = [self.data objectOrNilAtIndex:indexPath.row];
//    cell.nameLab.text = model.name;
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MWSProvinceModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    MWSCityVC *vc = [[MWSCityVC alloc] init];
//    vc.data = model.city;
//    vc.provinceName = model.name;
//    vc.ctiyBlock = self.ctiyBlock;
//    [[MWSLinkManager sharedManager] pushViewController:vc animated:YES];
 
    vc.data = nil;
    vc.provinceName = @"上海cs";
    vc.ctiyBlock = self.ctiyBlock;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KHeight) style:UITableViewStylePlain];
        //        _tableView.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_1F2126;
        _tableView.backgroundColor = kCOLOR_292929;

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
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [_tableView registerClass:[MWSCityCell class] forCellReuseIdentifier:NSStringFromClass([MWSCityCell class])];
//        [_tableView registerClass:[MWSLotteryDetailAllGoodsPercentCell class] forCellReuseIdentifier:NSStringFromClass([MWSLotteryDetailAllGoodsPercentCell class])];
    }
    return _tableView;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 44)];

    }
    return _topView;
}

- (UILabel *)topViewTitleLab {
    if (!_topViewTitleLab) {
        _topViewTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        _topViewTitleLab.text = @"请选择所在省";
        _topViewTitleLab.textColor = kCOLOR_FFFFFF;
    }
    return _topViewTitleLab;

}
@end
