//
//  MWSSelectAddressVC.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/18.
//

#import "MWSMyAddressVC.h"
#import "MWSMyAddressCell.h"
#import "MWSAddAddressVC.h"
#import "MWSAddressListApi.h"
#import "MWSUpdateAddressApi.h"

@interface MWSMyAddressVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *footer;

@property (nonatomic, strong) UIButton *addBtn;

@property (nonatomic, strong) UIImageView *addBtnIcon;

@property (nonatomic, strong) UILabel *addBtnTitleLab;

@property (nonatomic, copy) NSArray *data;

@end

@implementation MWSMyAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    self.navigationBarView.titleLabel.text = @"选择地址";
//    self.navigationBarView.titleLabel.text = @"我的地址";
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
//    @weakify(self);
//    [MWSAddressListApi requestAddressListWithBlock:^(NSArray * _Nonnull array, NSError * _Nonnull error) {
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
//        //        listArray = @[];
//        [self stopAnimating];
//        [self.loadingView removeFromSuperview];
//        self.loadingView = nil;
//
//        self.data = array;
//
//        [self.tableView reloadData];
//        self.footer.hidden = NO;
//
//    }];
//}

- (void)setupViews {
    //按钮
    //    [self showNavigationBarBtn];
    [self.footer addSubview:self.addBtn];
    [self.addBtn addSubview:self.addBtnIcon];
    [self.addBtn addSubview:self.addBtnTitleLab];

    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.navigationBarView.mas_bottom).offset(0);
        make.top.equalTo(@0);

        make.bottom.equalTo(@(appMargin().bottom));
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
    }];
    
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@6);
        make.bottom.equalTo(@-6);
        make.leading.equalTo(@12);
        make.trailing.equalTo(@-12);
    }];
    
    [self.addBtnIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.addBtn);
        make.leading.equalTo(@15);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    [self.addBtnTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.addBtn);
        make.leading.equalTo(@41);
//        make.width.equalTo(@20);
//        make.height.equalTo(@-20);
    }];
//    self.footer.backgroundColor = [UIColor grayColor];
    self.tableView.tableFooterView = self.footer;
//    self.addBtnIcon.backgroundColor = [UIColor redColor];
//    self.footer.hidden = YES;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return 5;
//    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 90;
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
    
    //    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell.textLabel.text = @"选择地址";
    //    return cell;
    
    MWSMyAddressCell *cell = (MWSMyAddressCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MWSMyAddressCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    MWSAddressModel *model = [self.data objectOrNilAtIndex:indexPath.row];
//    cell.model = model;

    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MWSAddressModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    if (self.selectAddressBlock) {
        self.selectAddressBlock(model);
        [self.navigationController popViewControllerAnimated:YES];
    }
}

////iOS8之后
 -  (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;

}

//iOS11新增了方法
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(ios(11.0)){
    if (@available(iOS 11.0, *)) {

//        NSString *title = @"置顶";
//        if (indexPath.section == 0) {
//            title = @"取消置顶";
//        } else {
//            title = @"置顶";
//        }
//        UIContextualAction *topAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:title handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
//
////            ...
//
//            // 这句很重要，退出编辑模式，隐藏左滑菜单
//            [tableView setEditing:NO animated:YES];
//            completionHandler(true);
//        }];

        UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {

            // 这句很重要，退出编辑模式，隐藏左滑菜单
            MWSAddressModel *model = [self.data objectOrNilAtIndex:indexPath.row];
            [self deleteDataWithModel:model];
            
            [tableView setEditing:NO animated:YES];
            completionHandler(true);
        }];

//        UISwipeActionsConfiguration *actions = [UISwipeActionsConfiguration configurationWithActions:@[deleteAction,topAction]];
        UISwipeActionsConfiguration *actions = [UISwipeActionsConfiguration configurationWithActions:@[deleteAction]];

        // 禁止侧滑无线拉伸
        actions.performsFirstActionWithFullSwipe = NO;
        return actions;
    } else {
        return nil;
    }
}

- (void)deleteDataWithModel:(MWSAddressModel *)model {
    NSString *modelId = model.ID;
    @weakify(self);
//    [MWSUpdateAddressApi requestDeleteAddressWithID:modelId
//                                              block:^(BOOL success, NSError * _Nonnull error) {
//        @strongify(self);
//        if (success) {
//            TOAST(@"删除成功");
//            [self deleteDataSuccessWithModel:model];
//        } else {
//            TOAST(@"删除失败");
//        }
//    }];
}

- (void)deleteDataSuccessWithModel:(MWSAddressModel *)model  {
    NSMutableArray *temp = [NSMutableArray array];
    NSLog(@"%@",temp);
    for(int i = 0; i < self.data.count; i++) {
        MWSAddressModel *obj = self.data[i];
        if (![model.ID isEqualToString:obj.ID]) {
            [temp addObject:obj];
        }
    }
    self.data = [NSArray arrayWithArray:temp];
    [self.tableView reloadData];
}

//lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor = kCOLOR_0F0F0F;

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
        [_tableView registerClass:[MWSMyAddressCell class] forCellReuseIdentifier:NSStringFromClass([MWSMyAddressCell class])];
        
    }
    return _tableView;
}

- (UIView *)footer {
    if (!_footer) {
        _footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 62)];
        
    }
    return _footer;
}

- (UIButton *)addBtn {
    if (!_addBtn) {
        _addBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KWidth / 2, 320)];
//        [_addBtn setTitle:@"添加新地址" forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(clickAddBtn :) forControlEvents:UIControlEventTouchUpInside];
       
        _addBtn.backgroundColor = kCOLOR_292929;
        _addBtn.layer.cornerRadius = 4.0;
        _addBtn.layer.masksToBounds = YES;
    }
    return _addBtn;
}

- (UIImageView *)addBtnIcon {
    if (!_addBtnIcon) {
        _addBtnIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _addBtnIcon.image = [UIImage imageNamed:@"ic_Avatar_add"];
    }
    return _addBtnIcon;
}

- (UILabel *)addBtnTitleLab {
    if (!_addBtnTitleLab) {
        _addBtnTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        _addBtnTitleLab.text = @"添加新地址";
        _addBtnTitleLab.textColor = kCOLOR_FFFFFF;
        _addBtnTitleLab.font = [UIFont systemFontOfSize:12];
    }
    return _addBtnTitleLab;
}

- (void)clickAddBtn:(UIButton *)btn {

    @weakify(self);
    MWSAddAddressVC *addAddressVC = [[MWSAddAddressVC alloc] init];
    addAddressVC.addAddressBlock = ^(BOOL success) {
        @strongify(self);
        if (success) {
//            [self refreshData];
        }
    };
//    [[MWSLinkManager sharedManager] pushViewController:addAddressVC animated:YES];
    
    [self.navigationController pushViewController:addAddressVC animated:YES];
}
@end
