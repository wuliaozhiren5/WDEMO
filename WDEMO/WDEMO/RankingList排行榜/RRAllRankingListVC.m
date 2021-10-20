//
//  RRAllRankingListVC.m
//  WDEMO
//
//  Created by rrtv on 2021/10/20.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRAllRankingListVC.h"
#import "MJRefresh.h"

@interface RRAllRankingListVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic ,strong)UITableView * myTableView;

@end

@implementation RRAllRankingListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-94-44)];//-34
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.showsVerticalScrollIndicator = NO;
    _myTableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_myTableView];
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
     
    self.scrollView = _myTableView;
    
    // 下拉刷新
    _myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [_myTableView.mj_header endRefreshing];
        });
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 120;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = [NSString stringWithFormat:@"homePageCellIdentifier%@",indexPath ];
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"onetableForIndex.row =%ld",indexPath.row];
    
    return cell;
}


@end
