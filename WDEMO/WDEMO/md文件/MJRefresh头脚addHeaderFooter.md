
MJRefresh头脚

MJRefresh (Footer ) API
https://www.jianshu.com/p/af57d795839e

------------------------------------------------------------------------------
#addHeaderFooter
#添加列表加载头脚逻辑

```
- (void)loadDataWithPage:(NSInteger)page {

    [self addHeader];
    [self addFooter];
    [self stopLoading]; 
}

- (void)stopLoading {
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
    
    self.dataSource.isLoading = NO;
    self.dataSource.isRefreshing = NO;
    if (self.dataSource.noMoreData) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    } else {
        [self.tableView.mj_footer resetNoMoreData];
    }
    self.noDataView.hidden = !self.dataSource.isNoData;
    //    self.noDataView.placeText = @"抱歉，没有找到相关内容";
    [self.tableView reloadData];
}

- (void)addHeader {
    //编辑模式刷新，不需要头
    if (self.isUserEditing) {
        return;
    }
    if (self.tableView.mj_header) {
        return;
    }
    @weakify(self)
    MJDIYHeader *header = [MJDIYHeader headerWithRefreshingBlock:^{
        @strongify(self)
        [self refreshData];
    }];
    self.tableView.mj_header = header;
}

- (void)removeHeader {
    if (self.tableView.mj_header) {
        [self.tableView.mj_header endRefreshing];
        self.tableView.mj_header = nil;
    }
}

- (void)addFooter {
    if (self.dataSource.dataArray.count <= 0) {
//        self.tableView.mj_footer = nil;
        [self removeFooter];
        return;
    }
    if (self.tableView.mj_footer) {
        return;
    }
    @weakify(self)
    MJDIYFooter *footer = [MJDIYFooter footerWithRefreshingBlock:^{
        @strongify(self)
        [self loadMoreData];
    }];
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"已经到底啦～" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.font = [UIFont systemFontOfSize:12];
    footer.stateLabel.textColor = kCOLOR_85888F;
    self.tableView.mj_footer = footer;
}

- (void)removeFooter {
    if (self.tableView.mj_footer) {
        [self.tableView.mj_footer endRefreshing];
        self.tableView.mj_footer = nil;
    }
}
```



也可以
```
- (void)addHeader {
    //编辑模式刷新，不需要头
    if (self.isUserEditing) {
        return;
    }
    if (self.dataSource.dataArray.count <= 0) {
//        self.tableView.mj_header = nil;
        [self removeHeader];
        return;
    }
    if (self.tableView.mj_header) {
        return;
    }
    @weakify(self)
    MJDIYHeader *header = [MJDIYHeader headerWithRefreshingBlock:^{
        @strongify(self)
        [self refreshData];
    }];
    self.tableView.mj_header = header;
}

- (void)removeHeader {
    if (self.tableView.mj_header.isRefreshing) {
        [self.tableView.mj_header endRefreshing];
    }
    if (self.tableView.mj_header) {
        self.tableView.mj_header = nil;
    }
}
```
