//
//  MWSAreaVC.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/18.
//

#import "MWSAreaVC.h"
#import "MWSCityCell.h"
#import "MWSAddAddressVC.h"

@interface MWSAreaVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
 
@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) UILabel *topViewTitleLab;

//@property (nonatomic, copy) NSString *areaName;

@end

@implementation MWSAreaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationBarView.titleLabel.text = self.cityName;
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
//    NSString *name = [self.data objectOrNilAtIndex:indexPath.row];
////    cell.model = model;
//    cell.nameLab.text = name;
    
    cell.nameLab.text = @"黄浦区cs";

    return cell;

}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
//    NSString *provinceName = self.provinceName;
//    NSString *cityName = self.cityName;
//    NSString *areaName = [self.data objectOrNilAtIndex:indexPath.row];
//    NSString *cityStr = [NSString stringWithFormat:@"%@ %@ %@", provinceName, cityName, areaName];
//    NSLog(@"地区 = %@",cityStr);
 
    NSString *provinceName = self.provinceName;
    NSString *cityName = self.cityName;
    NSString *areaName = @"黄浦区cs";
    NSString *cityStr = [NSString stringWithFormat:@"%@ %@ %@", provinceName, cityName, areaName];
    NSLog(@"地区 = %@",cityStr);
    
    if (self.ctiyBlock) {
        self.ctiyBlock(provinceName, cityName, areaName);
    }
    
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[MWSAddAddressVC class]]) {
           [self.navigationController popToViewController:controller animated:YES];
           return;
        }
    }
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
        _topViewTitleLab.text = @"请选择所在区";
        _topViewTitleLab.text = @"上海市  上海市"; 
        _topViewTitleLab.textColor = kCOLOR_FFFFFF;
    }
    return _topViewTitleLab;

}

@end
