//
//  MWSCityVC.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/18.
//

#import "MWSCityVC.h"
#import "MWSAreaVC.h"
#import "MWSCityCell.h"
#import "MWSCityModel.h"
#import "MWSAreaVC.h"

@interface MWSCityVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
 
@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) UILabel *topViewTitleLab;

@end

@implementation MWSCityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationBarView.titleLabel.text = self.provinceName;
//    self.navigationBarView.leftButton.hidden = NO;
//    [self createOpenData];
    [self setupViews];
}

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
//    MWSCityModel *model = [self.data objectOrNilAtIndex:indexPath.row];
////    cell.model = model;
//    cell.nameLab.text = model.name;
    
    cell.nameLab.text = @"上海市cs";

    return cell;
  
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MWSCityModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    MWSAreaVC *vc = [[MWSAreaVC alloc] init];
//    vc.data = model.area;
//    vc.provinceName = self.provinceName;
//    vc.cityName = model.name;
//    vc.ctiyBlock = self.ctiyBlock;
//    [[MWSLinkManager sharedManager] pushViewController:vc animated:YES];
    
    
    vc.data = nil;
    vc.provinceName = self.provinceName;
    vc.cityName =  @"上海市cs";
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
//        _topViewTitleLab.text = @"请选择所在市";
        _topViewTitleLab.text = @"上海市"; 
        _topViewTitleLab.textColor = kCOLOR_FFFFFF;
    }
    return _topViewTitleLab;

}
@end
