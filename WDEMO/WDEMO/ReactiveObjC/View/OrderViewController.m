//
//  OrderViewController.m
//  WDEMO
//
//  Created by rrtv on 2020/8/26.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "OrderViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "OrderViewModel.h"
#import "OrderCell.h"

@interface OrderViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) OrderViewModel *vm;
@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
    [self ViewModelEvent];
}
#pragma mark - 界面设置

- (void)setupViews {
    //    UINavigationBar与UITabBar半透明：会被遮挡；不透明，不会被遮挡
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    //**************************************************************************
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    [self.tableView registerClass:[OrderCell class] forCellReuseIdentifier:NSStringFromClass([OrderCell class])];
    
    //iOS11
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        //        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //------
    
    [self.view addSubview:self.tableView];
    
    //    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.leading.trailing.top.bottom.equalTo(self.view);
    //    }];
    self.tableView.frame = self.view.bounds;
    
    //header
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectZero];
    //footer
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
}

#pragma mark - ViewModel事件
- (void)ViewModelEvent {
    
    [self.vm.reqCommand execute:nil]; 
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.vm.reqCommand execute:nil];
    });
    
    //    @weakify(self);
    //    [self.reqVM.refreshUISubject subscribeNext:^(id x) {
    //        @strongify(self);
    //        [self.tableView reloadData];
    //    }];
}
#pragma mark - UITableView配置
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vm.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OrderCell class]) forIndexPath:indexPath];
    //    cell.model = self.vm.dataArray[indexPath.row];
    return cell;
}
#pragma mark - 懒加载
- (OrderViewModel *)vm {
    if (!_vm) {
        _vm = [[OrderViewModel alloc] init];
    }
    return _vm;
}


@end
